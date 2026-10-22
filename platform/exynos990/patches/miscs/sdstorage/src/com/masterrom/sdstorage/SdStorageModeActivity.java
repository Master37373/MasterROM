package com.masterrom.sdstorage;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ArgbEvaluator;
import android.animation.ValueAnimator;
import android.app.Activity;
import android.app.ActivityManager;
import android.app.KeyguardManager;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.UserInfo;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Insets;
import android.graphics.RenderEffect;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.UserHandle;
import android.os.UserManager;
import android.os.storage.DiskInfo;
import android.os.storage.StorageEventListener;
import android.os.storage.StorageManager;
import android.os.storage.VolumeInfo;
import android.text.format.Formatter;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.view.animation.PathInterpolator;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
/**
 * MasterROM: switch the microSD card between portable storage and adoptable (internal,
 * encrypted) storage. Full screen page inside SecSettings (system uid) in the same One UI 8.5
 * "glass" design as the MasterROM Updater: drifting colour blobs, translucent cards, a large
 * centred title that shrinks and fades out while scrolling down (no toolbar), gradient / tinted pill buttons and
 * illustrations (SdAnimView) that explain every step. Every step, confirmations included,
 * is a full screen page. Built in code, so no extra resources are needed.
 */
public class SdStorageModeActivity extends Activity {
    private static final String TAG = "MasterROMSdStorage";
    private static final int MOVE_SUCCEEDED = -100;
    private static final int MOVE_FAILED_LOCKED_USER = -10;
    /** PackageManager.EXTRA_MOVE_ID, set by SystemUI's storage move notification */
    private static final String EXTRA_MOVE_ID = "android.content.pm.extra.MOVE_ID";
    /** set when a stock storage wizard page forwarded to this page */
    private static final String EXTRA_FROM_WIZARD = "com.masterrom.sdstorage.FROM_WIZARD";
    private static final int MATCH_ANY_USER = 0x00400000; // PackageManager.MATCH_ANY_USER (hidden)
    private static final String SECURE_FOLDER_PKG = "com.samsung.knox.securefolder";

    private StorageManager mSm;
    private PackageManager mPm;
    private UserManager mUm;
    private Handler mUi;
    private boolean mDe;
    private boolean mNight;

    // colours (identical to the updater's LightGlass / DarkGlass)
    private int mBase, mText, mSubText, mAccent, mAccent2, mViolet, mOnAccent;
    private int mGlass, mGlassStroke, mGlassHi, mDivider, mChipBg, mChipText, mError;
    private Typeface mFont;

    // views
    private FrameLayout mRoot;
    private LinearLayout mFrame;
    private LinearLayout mHeader;
    private LinearLayout mContent;
    private LinearLayout mBottom;
    private ScrollView mScroll;
    private View mBack;
    private TextView mTitle;
    private TextView mWorkText;
    private TextView mWorkPercent;   // "42 %" while files or apps are moved
    private ProgressBar mWorkBar;

    // One UI app bar: mExpand is the empty expanded area at the top of the scrolling page,
    // mHeader the pinned 56dp bar with the back button; mTitle floats above both in mTop and
    // moves/shrinks from the centre of mExpand into the bar
    private FrameLayout mExpand;
    private FrameLayout mTop;
    private boolean mTouching;
    private boolean mStartCollapsed;   // new page: keep it collapsed until the first touch
    private final Runnable mSnap = new Runnable() { @Override public void run() { snapAppBar(); } };

    private boolean mBusy;
    private boolean mOnMain;
    private boolean mSheetShown;      // a full screen confirmation page is shown
    private Runnable mSheetCancel;    // runs when that confirmation is cancelled
    private int mPageId;
    private OnBackInvokedCallback mBackCb;
    private volatile VolumeInfo mNewPrivate;

    // last background job, for "try again"
    private String mLastTitle;
    private Work mLastWork;
    private String mLastOk;
    private Runnable mLastNext;
    /** consumed by the next anim(): FILES/WORKING animation runs card -> phone */
    private boolean mNextReverse;
    private boolean mLastReverse;

    private final PathInterpolator mEase = new PathInterpolator(0.2f, 0f, 0f, 1f);
    private final PathInterpolator mEmph = new PathInterpolator(0.05f, 0.7f, 0.1f, 1f);
    private final PathInterpolator mSpring = new PathInterpolator(0.34f, 1.25f, 0.64f, 1f);

    private final StorageEventListener mListener = new StorageEventListener() {
        @Override public void onVolumeStateChanged(VolumeInfo vol, int oldState, int newState) { refreshMain(); }
        @Override public void onDiskScanned(DiskInfo disk, int volumeCount) { refreshMain(); }
        @Override public void onDiskDestroyed(DiskInfo disk) { refreshMain(); }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mSm = getSystemService(StorageManager.class);
        mPm = getPackageManager();
        mUm = getSystemService(UserManager.class);
        mUi = new Handler(Looper.getMainLooper());
        mDe = "de".equals(Locale.getDefault().getLanguage());
        mNight = (getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        loadColors();
        buildFrame();
        if (!resumeMove(getIntent())) showMain();
        try { mSm.registerListener(mListener); } catch (Throwable e) { Log.w(TAG, "registerListener", e); }
    }

    /**
     * Hook for the stock storage wizard pages (StorageWizardMigrateProgress, StorageWizardReady):
     * SystemUI's "moving content" / "SD card ready" notifications open those. They forward here
     * instead, so the move is shown on this page. Returns true when the wizard page may finish.
     */
    public static boolean redirectFromWizard(Activity wizard) {
        try {
            Intent i = new Intent(wizard, SdStorageModeActivity.class);
            Intent src = wizard.getIntent();
            if (src != null && src.getExtras() != null) i.putExtras(src.getExtras());
            i.putExtra(EXTRA_FROM_WIZARD, wizard.getClass().getSimpleName());
            i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_SINGLE_TOP);
            wizard.startActivity(i);
            return true;
        } catch (Throwable e) {
            Log.w(TAG, "redirectFromWizard", e);
            return false;
        }
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        setIntent(intent);
        // a move started on this page is already shown; otherwise pick up the one the
        // notification refers to. "SD card ready" just brings the page to the front.
        if (!mBusy) resumeMove(intent);
    }

    /** Shows the progress of a running move (started elsewhere) on the working page. */
    private boolean resumeMove(Intent intent) {
        if (intent == null || !intent.hasExtra(EXTRA_MOVE_ID)) return false;
        final int moveId = intent.getIntExtra(EXTRA_MOVE_ID, -1);
        int status;
        try {
            status = mPm.getMoveStatus(moveId);
        } catch (Throwable e) {
            Log.w(TAG, "getMoveStatus " + moveId, e);
            return false;
        }
        if (status == MOVE_SUCCEEDED || status < 0) return false;   // already over: main page
        runWork(t("Verschieben", "Moving files"),
                new Work() {
                    @Override public String run() throws Exception {
                        setProgressText(t("Fotos, Downloads und andere Dateien werden verschoben …",
                                "Photos, downloads and other files are being moved …"));
                        return waitMove(moveId);
                    }
                },
                t("Fotos, Downloads und andere Dateien wurden verschoben.",
                        "Photos, downloads and other files have been moved."),
                null);
        return true;
    }

    @Override
    protected void onDestroy() {
        try { mSm.unregisterListener(mListener); } catch (Throwable ignored) { }
        mPageId++;
        super.onDestroy();
    }

    @Override
    public void onBackPressed() {
        if (handleBack()) return;
        super.onBackPressed();
    }

    /** @return true if back was consumed */
    private boolean handleBack() {
        if (mBusy) return true;
        if (mSheetShown) {
            cancelSheet();
            return true;
        }
        return false;
    }

    private String t(String de, String en) {
        return mDe ? de : en;
    }

    // ---- look & feel -----------------------------------------------------------

    private int dp(float v) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v, getResources().getDisplayMetrics()));
    }

    private static int withAlpha(int color, int alpha) {
        return (color & 0x00FFFFFF) | (Math.max(0, Math.min(255, alpha)) << 24);
    }

    private static int alphaF(int color, float a) {
        return withAlpha(color, Math.round(255f * a));
    }

    /** One UI system font ("sec", follows the font picked in the display settings) */
    private Typeface font(int weight) {
        return Typeface.create(mFont, weight, false);
    }

    private void loadColors() {
        mFont = Typeface.create("sec", Typeface.NORMAL);
        mOnAccent = 0xFFFFFFFF;
        if (mNight) {
            mBase = 0xFF07080C;
            mText = 0xFFF4F5F7;
            mSubText = 0xFFB3B7C0;
            mAccent = 0xFF3E91FF;
            mAccent2 = 0xFF2ED3C6;
            mViolet = 0xFF7B6CFF;
            mGlass = 0x12FFFFFF;
            mGlassStroke = 0x21FFFFFF;
            mGlassHi = 0x14FFFFFF;
            mDivider = 0x14FFFFFF;
            mChipBg = 0x2E3E91FF;
            mChipText = 0xFF9CC8FF;
            mError = 0xFFFF6B6F;
        } else {
            mBase = 0xFFF2F4F8;
            mText = 0xFF101114;
            mSubText = 0xFF4A4E57;
            mAccent = 0xFF0A72E6;
            mAccent2 = 0xFF14B5C9;
            mViolet = 0xFF5B6CFF;
            mGlass = 0xA8FFFFFF;
            mGlassStroke = 0xEBFFFFFF;
            mGlassHi = 0x80FFFFFF;
            mDivider = 0x12000000;
            mChipBg = 0x1C0A72E6;
            mChipText = 0xFF0A66D1;
            mError = 0xFFD93A3F;
        }
    }

    /** translucent glass card: hairline border and a soft highlight on the top 56 dp */
    private Drawable glass(int fill, float radiusDp) {
        GradientDrawable body = new GradientDrawable();
        body.setColor(fill);
        body.setCornerRadius(dp(radiusDp));
        body.setStroke(Math.max(1, dp(0.8f)), mGlassStroke);
        GradientDrawable hi = new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM,
                new int[] { mGlassHi, withAlpha(mGlassHi, 0) });
        hi.setCornerRadii(new float[] { dp(radiusDp), dp(radiusDp), dp(radiusDp), dp(radiusDp), 0, 0, 0, 0 });
        LayerDrawable ld = new LayerDrawable(new Drawable[] { body, hi });
        ld.setLayerHeight(1, dp(56));
        ld.setLayerGravity(1, Gravity.TOP | Gravity.FILL_HORIZONTAL);
        return ld;
    }

    private GradientDrawable pill(int color, float radiusDp) {
        GradientDrawable g = new GradientDrawable();
        g.setColor(color);
        g.setCornerRadius(dp(radiusDp));
        return g;
    }

    /** One UI press feedback: shrink while touched, spring back */
    private void addPress(final View v) {
        v.setOnTouchListener(new View.OnTouchListener() {
            @Override public boolean onTouch(View view, MotionEvent e) {
                switch (e.getActionMasked()) {
                    case MotionEvent.ACTION_DOWN:
                        view.animate().scaleX(0.96f).scaleY(0.96f).setDuration(110).setInterpolator(mEase).start();
                        break;
                    case MotionEvent.ACTION_UP:
                    case MotionEvent.ACTION_CANCEL:
                        view.animate().scaleX(1f).scaleY(1f).setDuration(320).setInterpolator(mSpring).start();
                        break;
                    default: break;
                }
                return false;
            }
        });
    }

    private void buildFrame() {
        getWindow().getDecorView().setBackgroundColor(mBase);
        try {
            getWindow().setStatusBarColor(Color.TRANSPARENT);
            getWindow().setNavigationBarColor(Color.TRANSPARENT);
            getWindow().setDecorFitsSystemWindows(false);
        } catch (Throwable ignored) { }

        mRoot = new FrameLayout(this);
        float ba = mNight ? 1.1f : 1f;
        mRoot.addView(new SdGlassBackground(this, mBase,
                alphaF(mAccent, 0.34f * ba), alphaF(mAccent2, 0.26f * ba), alphaF(mViolet, 0.22f * ba)),
                new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        mFrame = new LinearLayout(this);
        mFrame.setOrientation(LinearLayout.VERTICAL);
        mRoot.addView(mFrame, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        // bar: round glass back button (the title moves in next to it when the page is scrolled)
        mHeader = new LinearLayout(this);
        mHeader.setOrientation(LinearLayout.HORIZONTAL);
        mHeader.setGravity(Gravity.CENTER_VERTICAL);
        mHeader.setPadding(dp(14), 0, dp(14), 0);

        FrameLayout back = new FrameLayout(this);
        GradientDrawable backBg = pill(mNight ? 0x1AFFFFFF : 0xC7FFFFFF, 22);
        backBg.setStroke(dp(1), mNight ? 0x24FFFFFF : 0x12000000);
        back.setBackground(backBg);
        ImageView arrow = new ImageView(this);
        int backId = getResources().getIdentifier("ic_arrow_back", "drawable", getPackageName());
        if (backId != 0) {
            try {
                Drawable d = getDrawable(backId).mutate();
                d.setTint(mText);
                arrow.setImageDrawable(d);
            } catch (Exception ignored) { }
        }
        back.addView(arrow, new FrameLayout.LayoutParams(dp(24), dp(24), Gravity.CENTER));
        back.setContentDescription(t("Zurück", "Navigate up"));
        back.setClickable(true);
        back.setOnClickListener(new View.OnClickListener() { @Override public void onClick(View v) { if (!handleBack()) finish(); } });
        addPress(back);
        mBack = back;
        mHeader.addView(back, new LinearLayout.LayoutParams(dp(44), dp(44)));

        mTop = new FrameLayout(this);
        LinearLayout topCol = new LinearLayout(this);
        topCol.setOrientation(LinearLayout.VERTICAL);
        mTop.addView(topCol, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        topCol.addView(mHeader, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(56)));

        mScroll = new ScrollView(this);
        mScroll.setFillViewport(true);
        mScroll.setVerticalScrollBarEnabled(false);
        mScroll.setOverScrollMode(View.OVER_SCROLL_IF_CONTENT_SCROLLS);
        mScroll.setClipToPadding(false);
        LinearLayout body = new LinearLayout(this);
        body.setOrientation(LinearLayout.VERTICAL);

        // expanded app bar: large centred title, about 30 % of the screen together with the bar
        mExpand = new FrameLayout(this);
        body.addView(mExpand, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, expandRange()));

        mContent = new LinearLayout(this);
        mContent.setOrientation(LinearLayout.VERTICAL);
        mContent.setPadding(dp(14), dp(2), dp(14), dp(24));
        body.addView(mContent, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        mScroll.addView(body, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        mScroll.setOnScrollChangeListener(new View.OnScrollChangeListener() {
            @Override public void onScrollChange(View v, int x, int y, int ox, int oy) {
                applyAppBar(y);
                mScroll.removeCallbacks(mSnap);
                mScroll.postDelayed(mSnap, 90);
            }
        });
        mScroll.setOnTouchListener(new View.OnTouchListener() {
            @Override public boolean onTouch(View v, MotionEvent e) {
                int a = e.getActionMasked();
                if (a == MotionEvent.ACTION_DOWN) { mTouching = true; mStartCollapsed = false; }
                else if (a == MotionEvent.ACTION_UP || a == MotionEvent.ACTION_CANCEL) {
                    mTouching = false;
                    mScroll.removeCallbacks(mSnap);
                    mScroll.postDelayed(mSnap, 90);
                }
                return false;
            }
        });
        // the page is always at least one screen high, so the app bar can collapse on short pages too
        mScroll.addOnLayoutChangeListener(new View.OnLayoutChangeListener() {
            @Override public void onLayoutChange(View v, int l, int t, int r, int b, int ol, int ot, int or, int ob) {
                if (b - t != ob - ot) mContent.setMinimumHeight(b - t);
                if (mStartCollapsed) mScroll.post(new Runnable() { @Override public void run() { collapseNow(); } });
            }
        });
        topCol.addView(mScroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        // the one title: positioned and scaled by applyAppBar()
        mTitle = new TextView(this);
        mTitle.setTextColor(mText);
        mTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 32);
        mTitle.setTypeface(font(600));
        mTitle.setSingleLine(true);
        mTitle.setEllipsize(android.text.TextUtils.TruncateAt.END);
        mTitle.setMaxWidth(getResources().getDisplayMetrics().widthPixels - dp(48));
        mTitle.setPivotX(0f);
        mTitle.setPivotY(0f);
        mTop.addView(mTitle, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.TOP | Gravity.START));
        mTitle.addOnLayoutChangeListener(new View.OnLayoutChangeListener() {
            @Override public void onLayoutChange(View v, int l, int t, int r, int b, int ol, int ot, int or, int ob) {
                applyAppBar(mScroll.getScrollY());
            }
        });
        mFrame.addView(mTop, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        mBottom = new LinearLayout(this);
        mBottom.setOrientation(LinearLayout.HORIZONTAL);
        mBottom.setGravity(Gravity.CENTER);
        mBottom.setPadding(dp(14), dp(10), dp(14), dp(16));
        mFrame.addView(mBottom, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        mRoot.setOnApplyWindowInsetsListener(new View.OnApplyWindowInsetsListener() {
            @Override public WindowInsets onApplyWindowInsets(View v, WindowInsets in) {
                Insets s = in.getInsets(WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout());
                mFrame.setPadding(s.left, s.top, s.right, s.bottom);
                return WindowInsets.CONSUMED;
            }
        });
        setContentView(mRoot);
    }

    /** Height of the large-title area that scrolls away (expanded app bar minus the 56dp bar). */
    private int expandRange() {
        int screen = getResources().getDisplayMetrics().heightPixels;
        return Math.max(dp(56), Math.round(screen * 0.30f) - dp(56));
    }

    /**
     * One UI app bar, driven by the scroll position: the title glides from the centre of the
     * expanded area into the bar next to the back button and shrinks from 32sp to 20sp on the
     * way; it only grows back when the page is back at the top.
     */
    private void applyAppBar(int y) {
        float p = Math.min(1f, Math.max(0f, y / (float) expandRange()));
        float s = 1f + (20f / 32f - 1f) * p;
        float tw = mTitle.getWidth(), th = mTitle.getHeight(), w = mTop.getWidth();
        float bar = dp(56), range = expandRange();
        float xExp = (w - tw) / 2f, xCol = dp(14 + 44 + 12);
        float yExp = bar + (range - th) / 2f, yCol = (bar - th * s) / 2f;
        mTitle.setScaleX(s);
        mTitle.setScaleY(s);
        mTitle.setTranslationX(xExp + (xCol - xExp) * p);
        mTitle.setTranslationY(yExp + (yCol - yExp) * p);
    }

    /** Letting go half way: snap to expanded or collapsed, like One UI. */
    private void snapAppBar() {
        if (mTouching) return;
        int range = expandRange();
        int y = mScroll.getScrollY();
        if (y > 0 && y < range) mScroll.smoothScrollTo(0, y < range / 2 ? 0 : range);
    }

    private void collapseNow() {
        if (!mStartCollapsed) return;
        if (mScroll.getScrollY() != expandRange()) mScroll.scrollTo(0, expandRange());
        applyAppBar(mScroll.getScrollY());
    }

    /** Starts a new page: clears content and buttons, sets the title. Opens collapsed like Settings sub pages. */
    private void newPage(String title) {
        mPageId++;
        mSheetShown = false;
        mSheetCancel = null;
        updateBackCallback();
        mContent.removeAllViews();
        mBottom.removeAllViews();
        mBottom.setVisibility(View.GONE);
        mTitle.setText(title);
        mContent.setMinimumHeight(mScroll.getHeight());
        mStartCollapsed = true;
        collapseNow();
        mScroll.post(new Runnable() { @Override public void run() { collapseNow(); } });
        mTitle.setAlpha(0f);
        mTitle.animate().alpha(1f).setDuration(300).setInterpolator(mEmph).start();
    }

    /** One UI enter animation for a freshly built page: cards rise and fade in one after another. */
    private void animatePage() {
        for (int i = 0; i < mContent.getChildCount(); i++) {
            View v = mContent.getChildAt(i);
            v.setAlpha(0f);
            v.setTranslationY(dp(36));
            v.setScaleX(0.97f);
            v.setScaleY(0.97f);
            v.animate().alpha(1f).translationY(0f).scaleX(1f).scaleY(1f)
                    .setStartDelay(55L * i).setDuration(520).setInterpolator(mEmph).start();
        }
        if (mBottom.getVisibility() == View.VISIBLE) {
            mBottom.setAlpha(0f);
            mBottom.setTranslationY(dp(24));
            mBottom.animate().alpha(1f).translationY(0f).setStartDelay(180).setDuration(420).setInterpolator(mEmph).start();
        }
    }

    private LinearLayout.LayoutParams matchWrap() {
        return new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    /** GlassCard: radius 28 dp, padding 22 / 20 dp, 14 dp between cards */
    private LinearLayout card() {
        LinearLayout c = new LinearLayout(this);
        c.setOrientation(LinearLayout.VERTICAL);
        c.setBackground(glass(mGlass, 28));
        c.setPadding(dp(22), dp(20), dp(22), dp(20));
        LinearLayout.LayoutParams lp = matchWrap();
        lp.bottomMargin = dp(14);
        mContent.addView(c, lp);
        return c;
    }

    private SdAnimView anim(LinearLayout parent, int mode, int heightDp) {
        SdAnimView v = new SdAnimView(this, mText, mAccent, mOnAccent);
        v.setMode(mode);
        v.setReverse(mNextReverse);
        mNextReverse = false;
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(heightDp));
        lp.bottomMargin = dp(12);
        parent.addView(v, lp);
        return v;
    }

    private TextView headline(LinearLayout parent, String s) {
        TextView v = new TextView(this);
        v.setText(s);
        v.setTextColor(mText);
        v.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
        v.setTypeface(font(700));
        LinearLayout.LayoutParams lp = matchWrap();
        lp.bottomMargin = dp(8);
        parent.addView(v, lp);
        return v;
    }

    private TextView body(LinearLayout parent, String s) {
        TextView v = new TextView(this);
        v.setText(s);
        v.setTextColor(mSubText);
        v.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        v.setTypeface(font(400));
        v.setLineSpacing(dp(4), 1f);
        parent.addView(v, matchWrap());
        return v;
    }

    /** SectionLabel: 14 sp bold, sub text colour, indented like the card content */
    private void sectionLabel(String s) {
        TextView v = new TextView(this);
        v.setText(s);
        v.setTextColor(mSubText);
        v.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        v.setTypeface(font(700));
        v.setPadding(dp(22), dp(10), dp(22), dp(8));
        mContent.addView(v, matchWrap());
    }

    /** Chip row: 13 sp bold, tinted pill */
    private void chips(LinearLayout parent, String... items) {
        HorizontalScrollView hs = new HorizontalScrollView(this);
        hs.setHorizontalScrollBarEnabled(false);
        hs.setOverScrollMode(View.OVER_SCROLL_NEVER);
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        for (int i = 0; i < items.length; i++) {
            TextView c = new TextView(this);
            c.setText(items[i]);
            c.setTextColor(mChipText);
            c.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            c.setTypeface(font(700));
            c.setBackground(pill(mChipBg, 16));
            c.setPadding(dp(12), dp(6), dp(12), dp(6));
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            if (i > 0) lp.leftMargin = dp(8);
            row.addView(c, lp);
        }
        hs.addView(row);
        LinearLayout.LayoutParams lp = matchWrap();
        lp.topMargin = dp(14);
        parent.addView(hs, lp);
    }

    /** InfoRow: label left, value right, 1 dp divider above, 14 dp vertical padding */
    private void row(LinearLayout parent, String label, String value, boolean divider) {
        if (!divider) {
            // a card that starts with a row is a list card: less padding, rows bring their own
            parent.setPadding(dp(22), dp(6), dp(22), dp(6));
        } else {
            View d = new View(this);
            d.setBackgroundColor(mDivider);
            parent.addView(d, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, dp(1))));
        }
        LinearLayout r = new LinearLayout(this);
        r.setOrientation(LinearLayout.HORIZONTAL);
        r.setGravity(Gravity.CENTER_VERTICAL);
        r.setPadding(0, dp(14), 0, dp(14));
        TextView l = new TextView(this);
        l.setText(label);
        l.setTextColor(mText);
        l.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        l.setTypeface(font(400));
        r.addView(l, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        TextView v = new TextView(this);
        v.setText(value);
        v.setTextColor(mSubText);
        v.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        v.setTypeface(font(400));
        v.setGravity(Gravity.END);
        LinearLayout.LayoutParams vlp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.2f);
        vlp.leftMargin = dp(16);
        r.addView(v, vlp);
        parent.addView(r, matchWrap());
    }

    /**
     * Pill buttons like the updater: primary = gradient violet -> accent -> accent2 with white
     * bold text; secondary = glass with a thin accent border; destructive = red tinted pill.
     */
    private TextView button(LinearLayout parent, String text, boolean primary, boolean destructive, View.OnClickListener l) {
        TextView b = new TextView(this);
        b.setText(text);
        b.setGravity(Gravity.CENTER);
        b.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        b.setMaxLines(2);
        b.setPadding(dp(16), 0, dp(16), 0);
        Drawable bg;
        if (destructive) {
            GradientDrawable g = pill(alphaF(mError, mNight ? 0.20f : 0.13f), 27);
            g.setStroke(dp(1), alphaF(mError, 0.45f));
            bg = g;
            b.setTextColor(mError);
            b.setTypeface(font(600));
        } else if (primary) {
            GradientDrawable g = new GradientDrawable(GradientDrawable.Orientation.LEFT_RIGHT,
                    new int[] { mViolet, mAccent, mAccent2 });
            g.setCornerRadius(dp(27));
            bg = g;
            b.setTextColor(mOnAccent);
            b.setTypeface(font(700));
        } else {
            GradientDrawable g = pill(mGlass, 27);
            g.setStroke(dp(1), alphaF(mAccent, 0.28f));
            bg = g;
            b.setTextColor(mChipText);
            b.setTypeface(font(600));
        }
        b.setBackground(bg);
        b.setClickable(true);
        b.setFocusable(true);
        b.setOnClickListener(l);
        addPress(b);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, dp(54), 1f);
        if (parent.getChildCount() > 0) lp.leftMargin = dp(12);
        parent.addView(b, lp);
        if (parent == mBottom) mBottom.setVisibility(View.VISIBLE);
        return b;
    }

    // ---- confirmation (full screen page) ------------------------------------------

    /**
     * Asks before a step that changes the card. Shown as its own full screen page (title,
     * illustration, explanation, buttons at the bottom) instead of a bottom sheet.
     * Back / "Cancel" runs mSheetCancel if one was set right after this call, otherwise
     * returns to the overview.
     */
    private void showSheet(String title, String message, int animMode, String negText, String posText,
                           boolean destructive, final Runnable onPos) {
        mOnMain = false;
        newPage(t("Bestätigen", "Confirm"));
        LinearLayout c = card();
        anim(c, animMode >= 0 ? animMode : SdAnimView.MODE_TO_INTERNAL, 170);
        headline(c, title);
        body(c, message);
        if (destructive) {
            LinearLayout w = card();
            TextView note = body(w, t("Dieser Schritt lässt sich nicht rückgängig machen.",
                    "This step cannot be undone."));
            note.setTextColor(mError);
            note.setTypeface(font(600));
        }
        button(mBottom, negText, false, false, new View.OnClickListener() {
            @Override public void onClick(View v) { cancelSheet(); }
        });
        button(mBottom, posText, true, destructive, new View.OnClickListener() {
            @Override public void onClick(View v) {
                if (!mSheetShown) return;
                mSheetShown = false;
                mSheetCancel = null;
                updateBackCallback();
                onPos.run();
            }
        });
        mSheetShown = true;
        mSheetCancel = null;
        updateBackCallback();
        animatePage();
    }

    private void cancelSheet() {
        if (!mSheetShown) return;
        Runnable after = mSheetCancel;
        mSheetShown = false;
        mSheetCancel = null;
        updateBackCallback();
        if (isFinishing() || isDestroyed()) return;
        if (after != null) after.run(); else showMain();
    }

    private void updateBackCallback() {
        boolean want = mBusy || mSheetShown;
        try {
            OnBackInvokedDispatcher disp = getOnBackInvokedDispatcher();
            if (want && mBackCb == null) {
                mBackCb = new OnBackInvokedCallback() { @Override public void onBackInvoked() { handleBack(); } };
                disp.registerOnBackInvokedCallback(OnBackInvokedDispatcher.PRIORITY_OVERLAY, mBackCb);
            } else if (!want && mBackCb != null) {
                disp.unregisterOnBackInvokedCallback(mBackCb);
                mBackCb = null;
            }
        } catch (Throwable e) {
            Log.w(TAG, "back dispatcher", e);
        }
    }

    // ---- state -------------------------------------------------------------

    private DiskInfo findSdDisk() {
        List<DiskInfo> disks = mSm.getDisks();
        if (disks == null) return null;
        for (DiskInfo d : disks) {
            if (d != null && d.isSd()) return d;
        }
        return null;
    }

    private VolumeInfo findVolume(DiskInfo disk, int type) {
        List<VolumeInfo> vols = mSm.getVolumes();
        if (vols == null || disk == null) return null;
        for (VolumeInfo v : vols) {
            if (v != null && v.getType() == type && disk.getId().equals(v.getDiskId())) return v;
        }
        return null;
    }

    private void refreshMain() {
        mUi.post(new Runnable() { @Override public void run() {
            if (mOnMain && !mBusy && !mSheetShown && !isFinishing() && !isDestroyed()) showMain();
        } });
    }

    private boolean filesOnSd(VolumeInfo priv) {
        String u = priv.getFsUuid();
        return u != null && u.equals(mSm.getPrimaryStorageUuid());
    }

    private String currentFileLocation(VolumeInfo priv) {
        return filesOnSd(priv) ? t("SD-Karte", "SD card") : t("Interner Speicher", "Internal storage");
    }

    // ---- main page -----------------------------------------------------------

    private void showMain() {
        mOnMain = true;
        final DiskInfo disk = findSdDisk();
        if (disk == null) {
            newPage(t("SD-Karte", "SD card"));
            LinearLayout c = card();
            anim(c, SdAnimView.MODE_NO_CARD, 180);
            headline(c, t("Keine SD-Karte eingelegt", "No SD card inserted"));
            body(c, t("Lege eine microSD-Karte ein. Danach kannst du hier wählen, ob sie als tragbarer Speicher "
                    + "oder als interner, verschlüsselter Speicher genutzt wird. Die Seite aktualisiert sich automatisch.",
                    "Insert a microSD card. You can then choose here whether it is used as portable storage "
                    + "or as encrypted internal storage. This page updates automatically."));
            animatePage();
            return;
        }
        final VolumeInfo priv = findVolume(disk, VolumeInfo.TYPE_PRIVATE);
        final String size = disk.size > 0 ? Formatter.formatFileSize(this, disk.size) : "–";

        if (priv != null) {
            newPage(t("SD-Karte", "SD card"));
            LinearLayout c = card();
            anim(c, SdAnimView.MODE_TO_PORTABLE, 180);
            headline(c, t("Tragbarer Speicher", "Portable storage"));
            body(c, t("Die Karte wird wieder ein normaler, austauschbarer Speicher – ohne Verschlüsselung und auch in "
                    + "anderen Geräten, Kameras oder am PC lesbar. Apps und Dateien auf der Karte werden vorher "
                    + "automatisch in den internen Speicher verschoben, danach wird die Karte formatiert.",
                    "The card becomes normal removable storage again – without encryption and readable in other "
                    + "devices, cameras or on a PC. Apps and files on the card are moved to internal storage "
                    + "automatically first, then the card is formatted."));
            chips(c, t("Austauschbar", "Removable"), t("Am PC lesbar", "Readable on PC"), t("Unverschlüsselt", "Not encrypted"));

            sectionLabel(t("Aktueller Zustand", "Current state"));
            LinearLayout s = card();
            row(s, t("Nutzung", "Usage"), t("Interner Speicher", "Internal storage"), false);
            row(s, t("Verschlüsselung", "Encryption"), t("Ja, nur dieses Gerät", "Yes, this device only"), true);
            row(s, t("Dateien gespeichert auf", "Files stored on"), currentFileLocation(priv), true);
            row(s, t("Kapazität", "Capacity"), size, true);

            sectionLabel(t("Speicherort für Dateien", "Location for files"));
            LinearLayout f = card();
            anim(f, SdAnimView.MODE_FILES, 130);
            body(f, t("Wähle, wo Fotos, Videos, Downloads, Musik und andere Dateien gespeichert werden. "
                    + "Vorhandene Dateien werden mit verschoben. System und Apps bleiben im internen Speicher.",
                    "Choose where photos, videos, downloads, music and other files are stored. "
                    + "Existing files are moved along. System and apps stay on internal storage."));
            final boolean onSd = filesOnSd(priv);
            LinearLayout tiles = new LinearLayout(this);
            tiles.setOrientation(LinearLayout.HORIZONTAL);
            LinearLayout.LayoutParams tlp = matchWrap();
            tlp.topMargin = dp(16);
            f.addView(tiles, tlp);
            tile(tiles, SdGlyphView.PHONE, t("Intern", "Internal"), t("Gerätespeicher", "Device storage"), !onSd,
                    new Runnable() { @Override public void run() { if (onSd) confirmFileLocation(priv, false); } });
            tile(tiles, SdGlyphView.SD, t("SD-Karte", "SD card"), t("Verschlüsselt", "Encrypted"), onSd,
                    new Runnable() { @Override public void run() { if (!onSd) confirmFileLocation(priv, true); } });

            button(mBottom, t("Tragbar machen", "Make portable"), true, false, new View.OnClickListener() {
                @Override public void onClick(View v) { toPortable(disk, priv); }
            });
        } else {
            newPage(t("SD-Karte", "SD card"));
            LinearLayout c = card();
            anim(c, SdAnimView.MODE_TO_INTERNAL, 180);
            headline(c, t("Interner, verschlüsselter Speicher", "Encrypted internal storage"));
            body(c, t("Die Karte wird formatiert, verschlüsselt und als Erweiterung des internen Speichers genutzt. "
                    + "Danach kannst du Fotos, Downloads und andere Dateien – und unterstützte Apps – auf der Karte speichern. "
                    + "Die Karte ist anschließend nur noch in diesem Gerät lesbar.",
                    "The card is formatted, encrypted and used as an extension of internal storage. "
                    + "You can then store photos, downloads and other files – and supported apps – on the card. "
                    + "Afterwards the card can only be read on this device."));
            chips(c, t("Verschlüsselt", "Encrypted"), t("Mehr Speicher", "More storage"), t("Nur dieses Gerät", "This device only"));

            sectionLabel(t("Aktueller Zustand", "Current state"));
            LinearLayout s = card();
            row(s, t("Nutzung", "Usage"), t("Tragbarer Speicher", "Portable storage"), false);
            row(s, t("Verschlüsselung", "Encryption"), t("Nein", "No"), true);
            row(s, t("Kapazität", "Capacity"), size, true);

            LinearLayout w = card();
            headline(w, t("Gut zu wissen", "Good to know"));
            body(w, t("• Alle Daten, die jetzt auf der Karte sind, werden gelöscht – sichere sie vorher.\n"
                    + "• Nimm die Karte danach nicht mehr einfach heraus, sie ist Teil des Speichers.\n"
                    + "• Du kannst die Karte hier jederzeit wieder tragbar machen.",
                    "• All data currently on the card is erased – back it up first.\n"
                    + "• Do not simply remove the card afterwards, it is part of the storage.\n"
                    + "• You can make the card portable again here at any time."));

            button(mBottom, t("Als intern einrichten", "Set up as internal"), true, false, new View.OnClickListener() {
                @Override public void onClick(View v) { confirmToInternal(disk); }
            });
        }
        animatePage();
    }

    /** selectable glass option tile */
    private void tile(LinearLayout parent, int glyph, String title, String sub, final boolean selected, final Runnable onPick) {
        final LinearLayout tl = new LinearLayout(this);
        tl.setOrientation(LinearLayout.VERTICAL);
        tl.setPadding(dp(16), dp(14), dp(16), dp(14));
        final GradientDrawable bg = new GradientDrawable();
        bg.setCornerRadius(dp(20));
        bg.setColor(selected ? withAlpha(mAccent, mNight ? 0x33 : 0x1F) : withAlpha(mText, mNight ? 0x0F : 0x08));
        bg.setStroke(dp(selected ? 2f : 1f), selected ? mAccent : mDivider);
        tl.setBackground(new RippleDrawable(ColorStateList.valueOf(withAlpha(mAccent, 0x2A)), bg, null));
        LinearLayout top = new LinearLayout(this);
        top.setOrientation(LinearLayout.HORIZONTAL);
        top.setGravity(Gravity.CENTER_VERTICAL);
        SdGlyphView g = new SdGlyphView(this, glyph, selected ? mAccent : mSubText);
        top.addView(g, new LinearLayout.LayoutParams(dp(28), dp(28)));
        View spacer = new View(this);
        top.addView(spacer, new LinearLayout.LayoutParams(0, 1, 1f));
        TextView check = new TextView(this);
        check.setText("✓");
        check.setGravity(Gravity.CENTER);
        check.setTextColor(mOnAccent);
        check.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        check.setTypeface(Typeface.DEFAULT_BOLD);
        check.setBackground(pill(mAccent, 11));
        check.setVisibility(selected ? View.VISIBLE : View.INVISIBLE);
        top.addView(check, new LinearLayout.LayoutParams(dp(22), dp(22)));
        tl.addView(top, matchWrap());
        TextView tt = new TextView(this);
        tt.setText(title);
        tt.setTextColor(selected ? mAccent : mText);
        tt.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        tt.setTypeface(Typeface.create(Typeface.DEFAULT, 600, false));
        tt.setPadding(0, dp(12), 0, dp(2));
        tl.addView(tt, matchWrap());
        TextView st = new TextView(this);
        st.setText(sub);
        st.setTextColor(mSubText);
        st.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        tl.addView(st, matchWrap());
        tl.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                if (selected) return;
                // preview the selection, then ask
                ValueAnimator va = ValueAnimator.ofObject(new ArgbEvaluator(), mDivider, mAccent);
                va.setDuration(220);
                va.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {
                    @Override public void onAnimationUpdate(ValueAnimator a) { bg.setStroke(dp(2f), (Integer) a.getAnimatedValue()); }
                });
                va.start();
                onPick.run();
            }
        });
        addPress(tl);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        if (parent.getChildCount() > 0) lp.leftMargin = dp(10);
        parent.addView(tl, lp);
    }

    // ---- Secure Folder / other users must be unlocked to move files ---------------------

    private List<UserInfo> lockedUsers() {
        List<UserInfo> out = new ArrayList<>();
        try {
            List<UserInfo> users = mUm.getUsers();
            if (users == null) return out;
            for (UserInfo u : users) {
                if (u != null && !mUm.isUserUnlocked(u.id)) out.add(u);
            }
        } catch (Throwable e) {
            Log.w(TAG, "lockedUsers", e);
        }
        return out;
    }

    private String userLabel(UserInfo u) {
        boolean sf = false;
        try { sf = u.isSecureFolder(); } catch (Throwable ignored) { }
        if (sf || (u.id >= 150 && u.id <= 160)) return t("Sicherer Ordner", "Secure Folder");
        return u.name != null ? u.name : t("Benutzer ", "User ") + u.id;
    }

    /** Runs action right away if every user is unlocked, otherwise asks to unlock (Secure Folder) first. */
    private void requireUnlocked(final Runnable action) {
        List<UserInfo> locked = lockedUsers();
        if (locked.isEmpty()) {
            action.run();
            return;
        }
        mOnMain = false;
        final UserInfo first = locked.get(0);
        newPage(t("Entsperren", "Unlock"));
        LinearLayout c = card();
        anim(c, SdAnimView.MODE_SECURE, 180);
        headline(c, t("Kurz entsperren, dann geht es weiter", "Unlock briefly, then we continue"));
        StringBuilder sb = new StringBuilder();
        sb.append(t("Damit Fotos, Downloads und andere Dateien verschoben werden können, müssen alle Bereiche "
                + "dieses Geräts entsperrt sein. Gesperrt ist zurzeit:\n",
                "To move photos, downloads and other files, every space on this device has to be unlocked. "
                + "Currently locked:\n"));
        for (UserInfo u : locked) sb.append("• ").append(userLabel(u)).append('\n');
        sb.append('\n').append(t("Tippe auf „Entsperren“ und gib die Sperre ein. Sobald alles entsperrt ist, "
                + "geht es hier automatisch weiter.",
                "Tap “Unlock” and enter the lock. As soon as everything is unlocked, this page continues automatically."));
        body(c, sb.toString());

        LinearLayout st = card();
        LinearLayout r = new LinearLayout(this);
        r.setOrientation(LinearLayout.HORIZONTAL);
        r.setGravity(Gravity.CENTER_VERTICAL);
        ProgressBar pb = new ProgressBar(this);
        pb.setIndeterminateTintList(ColorStateList.valueOf(mAccent));
        r.addView(pb, new LinearLayout.LayoutParams(dp(22), dp(22)));
        final TextView status = new TextView(this);
        status.setText(t("Warte auf Entsperrung …", "Waiting for unlock …"));
        status.setTextColor(mText);
        status.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        status.setPadding(dp(14), 0, 0, 0);
        r.addView(status, matchWrap());
        st.addView(r, matchWrap());

        button(mBottom, t("Abbrechen", "Cancel"), false, false, new View.OnClickListener() {
            @Override public void onClick(View v) { showMain(); }
        });
        button(mBottom, t("Entsperren", "Unlock"), true, false, new View.OnClickListener() {
            @Override public void onClick(View v) { unlockUser(first.id); }
        });
        animatePage();

        final int page = mPageId;
        mUi.postDelayed(new Runnable() {
            @Override public void run() {
                if (page != mPageId || isFinishing() || isDestroyed()) return;
                if (lockedUsers().isEmpty()) {
                    status.setText(t("Entsperrt ✓", "Unlocked ✓"));
                    status.setTextColor(mAccent);
                    mUi.postDelayed(new Runnable() {
                        @Override public void run() {
                            if (page == mPageId && !isFinishing() && !isDestroyed()) action.run();
                        }
                    }, 600);
                    return;
                }
                mUi.postDelayed(this, 800);
            }
        }, 800);
    }

    private void unlockUser(int userId) {
        try {
            ActivityManager am = getSystemService(ActivityManager.class);
            if (!am.isUserRunning(userId)) am.startProfile(UserHandle.of(userId));
        } catch (Throwable e) {
            Log.w(TAG, "startProfile " + userId, e);
        }
        try {
            KeyguardManager km = getSystemService(KeyguardManager.class);
            Intent i = km.createConfirmDeviceCredentialIntent(
                    t("Sicheren Ordner entsperren", "Unlock Secure Folder"),
                    t("Zum Verschieben der Dateien", "To move your files"), userId);
            if (i != null) {
                startActivity(i);
                return;
            }
        } catch (Throwable e) {
            Log.w(TAG, "confirm credential " + userId, e);
        }
        try {
            Intent i = mPm.getLaunchIntentForPackage(SECURE_FOLDER_PKG);
            if (i != null) {
                i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(i);
                return;
            }
        } catch (Throwable e) {
            Log.w(TAG, "open Secure Folder", e);
        }
        Toast.makeText(this, t("Bitte öffne den Sicheren Ordner und entsperre ihn.",
                "Please open Secure Folder and unlock it."), Toast.LENGTH_LONG).show();
    }

    // ---- portable -> internal ----------------------------------------------

    private void confirmToInternal(final DiskInfo disk) {
        final String diskId = disk.getId();
        showSheet(t("Alle Daten auf der SD-Karte löschen?", "Erase all data on the SD card?"),
                t("Die Karte wird formatiert und verschlüsselt. Alle Daten darauf werden unwiderruflich gelöscht.",
                        "The card is formatted and encrypted. All data on it will be permanently erased."),
                -1, t("Abbrechen", "Cancel"), t("Löschen und einrichten", "Erase and set up"), true,
                new Runnable() { @Override public void run() {
                    runWork(t("Einrichten", "Setting up"), new Work() {
                        @Override public String run() throws Exception {
                            setProgressText(t("Karte wird sicher ausgehängt …", "Safely unmounting the card …"));
                            DiskInfo d = mSm.findDiskById(diskId);
                            unmountQuietly(findVolume(d, VolumeInfo.TYPE_PUBLIC));
                            setProgressText(t("Karte wird formatiert und verschlüsselt …", "Formatting and encrypting the card …"));
                            mSm.partitionPrivate(diskId);
                            setProgressText(t("Karte wird eingebunden …", "Mounting the card …"));
                            mNewPrivate = waitPrivateMounted(diskId);
                            return null;
                        }
                    }, null, new Runnable() { @Override public void run() { showInternalReady(); } });
                } });
    }

    /** Polls until the new private volume of the disk is mounted (max 60 s). */
    private VolumeInfo waitPrivateMounted(String diskId) throws InterruptedException {
        for (int i = 0; i < 120; i++) {
            List<VolumeInfo> vols = mSm.getVolumes();
            if (vols != null) {
                for (VolumeInfo v : vols) {
                    if (v != null && v.getType() == VolumeInfo.TYPE_PRIVATE && diskId.equals(v.getDiskId())
                            && v.getState() == VolumeInfo.STATE_MOUNTED) {
                        return v;
                    }
                }
            }
            Thread.sleep(500);
        }
        return null;
    }

    /** Success page after adopting, with the offer to move photos, downloads etc. to the card. */
    private void showInternalReady() {
        mOnMain = false;
        final VolumeInfo target = mNewPrivate;
        DiskInfo disk = findSdDisk();
        newPage(t("Bereit", "Ready"));
        LinearLayout c = card();
        anim(c, SdAnimView.MODE_DONE, 170);
        headline(c, t("Interner Speicher eingerichtet", "Internal storage set up"));
        body(c, t("Die SD-Karte ist jetzt verschlüsselt und Teil des internen Speichers. Sie ist nur noch in diesem Gerät lesbar.",
                "The SD card is now encrypted and part of internal storage. It can only be read on this device."));
        chips(c, t("Verschlüsselt", "Encrypted"), t("Eingebunden", "Mounted"), t("Bereit", "Ready"));

        LinearLayout s = card();
        row(s, t("Nutzung", "Usage"), t("Interner Speicher", "Internal storage"), false);
        row(s, t("Verschlüsselung", "Encryption"), t("Ja, nur dieses Gerät", "Yes, this device only"), true);
        if (disk != null && disk.size > 0) row(s, t("Kapazität", "Capacity"), Formatter.formatFileSize(this, disk.size), true);

        boolean canMove = target != null && !(target.getFsUuid() != null && target.getFsUuid().equals(mSm.getPrimaryStorageUuid()));
        if (canMove) {
            sectionLabel(t("Nächster Schritt", "Next step"));
            LinearLayout n = card();
            anim(n, SdAnimView.MODE_FILES, 130);
            headline(n, t("Dateien auf die SD-Karte verschieben?", "Move files to the SD card?"));
            body(n, t("Fotos, Videos, Downloads, Musik und andere Dateien kommen auf die Karte, neue Fotos und Downloads "
                    + "landen danach automatisch dort. System und Apps bleiben im internen Speicher. "
                    + "Je nach Datenmenge dauert das einige Minuten – du kannst es auch später auf dieser Seite ändern.",
                    "Photos, videos, downloads, music and other files go to the card, and new photos and downloads are "
                    + "stored there automatically. System and apps stay on internal storage. Depending on the amount of "
                    + "data this takes a few minutes – you can also change it later on this page."));
            button(mBottom, t("Später", "Later"), false, false, new View.OnClickListener() {
                @Override public void onClick(View v) { showMain(); }
            });
            button(mBottom, t("Dateien verschieben", "Move files"), true, false, new View.OnClickListener() {
                @Override public void onClick(View v) {
                    requireUnlocked(new Runnable() { @Override public void run() { moveFiles(target, true); } });
                }
            });
        } else {
            if (target == null) {
                body(s, "\n" + t("Die Karte wird noch eingebunden. Dateien kannst du gleich auf dieser Seite verschieben.",
                        "The card is still being mounted. You can move files on this page in a moment."));
            }
            button(mBottom, t("Fertig", "Done"), true, false, new View.OnClickListener() {
                @Override public void onClick(View v) { showMain(); }
            });
        }
        animatePage();
    }

    // ---- default location for files (primary shared storage) ---------------

    private void confirmFileLocation(final VolumeInfo priv, final boolean wantSd) {
        mNextReverse = !wantSd;
        showSheet(wantSd ? t("Dateien auf die SD-Karte verschieben?", "Move files to the SD card?")
                         : t("Dateien in den internen Speicher verschieben?", "Move files to internal storage?"),
                t("Fotos, Videos, Downloads und andere Dateien werden verschoben und künftig dort gespeichert. "
                        + "Je nach Datenmenge dauert das einige Minuten.",
                        "Photos, videos, downloads and other files are moved and stored there from now on. "
                        + "Depending on the amount of data this takes a few minutes."),
                SdAnimView.MODE_FILES, t("Abbrechen", "Cancel"), t("Verschieben", "Move"), false,
                new Runnable() { @Override public void run() {
                    requireUnlocked(new Runnable() { @Override public void run() {
                        VolumeInfo target = wantSd ? priv : mSm.findVolumeById(VolumeInfo.ID_PRIVATE_INTERNAL);
                        moveFiles(target, wantSd);
                    } });
                } });
        // dismissed -> rebuild main so the tile selection is reset
        mSheetCancel = new Runnable() { @Override public void run() { if (!mBusy) showMain(); } };
    }

    private void moveFiles(final VolumeInfo target, final boolean toSd) {
        mNextReverse = !toSd;
        runWork(t("Verschieben", "Moving files"),
                new Work() {
                    @Override public String run() throws Exception {
                        if (target == null) return t("Speicher nicht gefunden.", "Storage not found.");
                        setProgressText(toSd ? t("Fotos, Downloads und andere Dateien kommen auf die SD-Karte …",
                                                 "Photos, downloads and other files are moving to the SD card …")
                                             : t("Fotos, Downloads und andere Dateien kommen in den internen Speicher …",
                                                 "Photos, downloads and other files are moving to internal storage …"));
                        return waitMove(mPm.movePrimaryStorage(target));
                    }
                },
                toSd ? t("Fotos, Downloads und andere Dateien liegen jetzt auf der SD-Karte. Neue Dateien werden automatisch dort gespeichert.",
                         "Photos, downloads and other files are now on the SD card. New files are stored there automatically.")
                     : t("Fotos, Downloads und andere Dateien liegen jetzt im internen Speicher.",
                         "Photos, downloads and other files are now on internal storage."),
                null);
    }

    // ---- internal -> portable ----------------------------------------------

    private void toPortable(final DiskInfo disk, final VolumeInfo priv) {
        final String fsUuid = priv.getFsUuid();
        final List<String> pkgs = new ArrayList<>();
        final List<String> labels = new ArrayList<>();
        for (ApplicationInfo ai : mPm.getInstalledApplications(MATCH_ANY_USER)) {
            if (fsUuid != null && fsUuid.equals(ai.volumeUuid) && !pkgs.contains(ai.packageName)) {
                pkgs.add(ai.packageName);
                labels.add(String.valueOf(ai.loadLabel(mPm)));
            }
        }
        final boolean primaryOnSd = fsUuid != null && fsUuid.equals(mSm.getPrimaryStorageUuid());

        StringBuilder sb = new StringBuilder();
        if (primaryOnSd) {
            sb.append(t("• Fotos, Downloads und andere Dateien werden zurück in den internen Speicher verschoben.\n",
                    "• Photos, downloads and other files are moved back to internal storage.\n"));
        }
        if (!pkgs.isEmpty()) {
            sb.append(t("• Diese Apps werden zurück in den internen Speicher verschoben: ",
                    "• These apps are moved back to internal storage: "));
            for (int i = 0; i < labels.size(); i++) sb.append(i > 0 ? ", " : "").append(labels.get(i));
            sb.append('\n');
        }
        if (sb.length() > 0) sb.append('\n');
        sb.append(t("Danach wird die SD-Karte formatiert und alle restlichen Daten darauf gelöscht. "
                + "Sie ist dann nicht mehr verschlüsselt und auch in anderen Geräten lesbar.",
                "The SD card is then formatted and all remaining data on it is erased. "
                + "It is no longer encrypted and can be read on other devices."));

        final Runnable doIt = new Runnable() { @Override public void run() {
            mNextReverse = primaryOnSd || !pkgs.isEmpty();   // files/apps come back to the phone
            runWork(t("Tragbar machen", "Make portable"), new Work() { @Override public String run() throws Exception {
                VolumeInfo internal = mSm.findVolumeById(VolumeInfo.ID_PRIVATE_INTERNAL);
                if (internal == null) return t("Interner Speicher nicht gefunden.", "Internal storage not found.");
                if (primaryOnSd) {
                    setProgressText(t("Dateien werden in den internen Speicher verschoben …", "Moving files to internal storage …"));
                    String err = waitMove(mPm.movePrimaryStorage(internal));
                    if (err != null) return err;
                }
                for (int i = 0; i < pkgs.size(); i++) {
                    setProgressText(t("App wird verschoben: ", "Moving app: ") + labels.get(i)
                            + " (" + (i + 1) + "/" + pkgs.size() + ")");
                    String err = waitMove(mPm.movePackage(pkgs.get(i), internal));
                    if (err != null) return labels.get(i) + ": " + err;
                }
                setProgressText(t("Karte wird sicher ausgehängt …", "Safely unmounting the card …"));
                unmountQuietly(findVolume(disk, VolumeInfo.TYPE_PRIVATE));
                setProgressText(t("SD-Karte wird formatiert …", "Formatting SD card …"));
                mSm.partitionPublic(disk.getId());
                if (fsUuid != null) {
                    try {
                        mSm.forgetVolume(fsUuid);
                    } catch (Exception e) {
                        Log.w(TAG, "forgetVolume failed", e);
                    }
                }
                return null;
            } }, t("Die SD-Karte ist jetzt wieder ein tragbarer Speicher – ohne Verschlüsselung und auch in anderen Geräten lesbar.",
                    "The SD card is portable storage again – without encryption and readable on other devices."), null);
        } };

        showSheet(t("SD-Karte wieder tragbar machen?", "Make SD card portable again?"), sb.toString(),
                SdAnimView.MODE_TO_PORTABLE, t("Abbrechen", "Cancel"), t("Fortfahren", "Continue"), true,
                new Runnable() { @Override public void run() {
                    if (primaryOnSd) requireUnlocked(doIt); else doIt.run();
                } });
    }

    /**
     * Unmounts a volume the regular way before it is repartitioned, so the system does not
     * report the card as "unexpectedly removed" (vold would otherwise tear the mounted volume down).
     */
    private void unmountQuietly(VolumeInfo v) {
        if (v == null || v.getState() != VolumeInfo.STATE_MOUNTED) return;
        final String id = v.getId();
        try {
            mSm.unmount(id);
        } catch (Throwable e) {
            Log.w(TAG, "unmount " + id, e);
            return;
        }
        for (int i = 0; i < 40; i++) {
            VolumeInfo cur = mSm.findVolumeById(id);
            if (cur == null || cur.getState() == VolumeInfo.STATE_UNMOUNTED) return;
            try { Thread.sleep(250); } catch (InterruptedException e) { return; }
        }
    }

    /** Waits for a PackageManager move; returns null on success or an error text. */
    private String waitMove(int moveId) throws InterruptedException {
        long deadline = System.currentTimeMillis() + 60L * 60L * 1000L;
        while (System.currentTimeMillis() < deadline) {
            int s = mPm.getMoveStatus(moveId);
            if (s == MOVE_SUCCEEDED) { setProgressPercent(100); return null; }
            if (s < 0) return moveError(s);
            setProgressPercent(s);   // 0..100 while the move runs
            Thread.sleep(500);
        }
        return t("Zeitüberschreitung beim Verschieben.", "Move timed out.");
    }

    /** Human readable text for PackageManager.MOVE_FAILED_* codes. */
    private String moveError(int code) {
        String m;
        switch (code) {
            case -1: m = t("Nicht genug freier Speicher am Ziel.", "Not enough free space at the destination."); break;
            case -2: m = t("Die App existiert nicht mehr.", "The app no longer exists."); break;
            case -3: m = t("System-Apps können nicht verschoben werden.", "System apps cannot be moved."); break;
            case -5: m = t("Dieser Speicherort ist nicht möglich.", "This location is not possible."); break;
            case -7: m = t("Es läuft bereits ein anderer Verschiebevorgang. Bitte später erneut versuchen.",
                    "Another move is already in progress. Please try again later."); break;
            case -8: m = t("Diese App ist ein Geräteadministrator und kann nicht verschoben werden.",
                    "This app is a device administrator and cannot be moved."); break;
            case MOVE_FAILED_LOCKED_USER: m = t("Der Sichere Ordner oder ein anderer Benutzer ist gesperrt. "
                    + "Entsperre ihn und versuche es dann erneut.",
                    "Secure Folder or another user is locked. Unlock it, then try again."); break;
            default: m = t("Interner Fehler.", "Internal error."); break;
        }
        return m + t(" (Code ", " (code ") + code + ")";
    }

    // ---- background work -----------------------------------------------------

    private interface Work {
        /** @return null on success, otherwise an error message */
        String run() throws Exception;
    }

    private void setBusy(boolean busy) {
        mBusy = busy;
        mBack.animate().alpha(busy ? 0f : 1f).setDuration(200).start();
        mBack.setEnabled(!busy);
        if (busy) {
            getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        } else {
            getWindow().clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        }
        updateBackCallback();
    }

    /**
     * Runs work in the background on a "working" page. On success: next.run() if given, otherwise
     * a success page with okMessage. On failure: error page with "try again".
     */
    private void runWork(String title, final Work work, final String okMessage, final Runnable next) {
        mLastTitle = title;
        mLastWork = work;
        mLastOk = okMessage;
        mLastNext = next;
        mLastReverse = mNextReverse;
        mOnMain = false;
        setBusy(true);
        newPage(title);
        LinearLayout c = card();
        anim(c, SdAnimView.MODE_WORKING, 190);
        mWorkText = headline(c, t("Bitte warten …", "Please wait …"));
        // percentage, shown as soon as a move reports progress
        mWorkPercent = new TextView(this);
        mWorkPercent.setTextColor(mAccent);
        mWorkPercent.setTextSize(TypedValue.COMPLEX_UNIT_SP, 34);
        mWorkPercent.setTypeface(font(700));
        mWorkPercent.setFontFeatureSettings("tnum");
        mWorkPercent.setVisibility(View.GONE);
        c.addView(mWorkPercent, matchWrap());
        ProgressBar pb = new ProgressBar(this, null, android.R.attr.progressBarStyleHorizontal);
        pb.setIndeterminate(true);
        pb.setMax(100);
        pb.setIndeterminateTintList(ColorStateList.valueOf(mAccent));
        pb.setProgressTintList(ColorStateList.valueOf(mAccent));
        pb.setProgressBackgroundTintList(ColorStateList.valueOf(mDivider));
        mWorkBar = pb;
        LinearLayout.LayoutParams lp = matchWrap();
        lp.topMargin = dp(6);
        lp.bottomMargin = dp(12);
        c.addView(pb, lp);
        body(c, t("Entferne die SD-Karte nicht und schalte das Gerät nicht aus. Das Display bleibt dabei an.",
                "Do not remove the SD card or turn off the device. The screen stays on meanwhile."));
        animatePage();

        new Thread(new Runnable() { @Override public void run() {
            String err;
            try {
                err = work.run();
            } catch (Throwable e) {
                Log.e(TAG, "SD storage mode switch failed", e);
                err = String.valueOf(e.getMessage() != null ? e.getMessage() : e);
            }
            final String result = err;
            mUi.post(new Runnable() { @Override public void run() {
                if (isFinishing() || isDestroyed()) return;
                setBusy(false);
                if (result == null && next != null) {
                    next.run();
                    return;
                }
                showResult(result == null, result == null ? okMessage : result);
            } });
        } }, "MasterROMSdStorage").start();
    }

    private void showResult(boolean ok, String message) {
        mOnMain = false;
        newPage(ok ? t("Fertig", "Done") : t("Fehler", "Error"));
        LinearLayout c = card();
        anim(c, ok ? SdAnimView.MODE_DONE : SdAnimView.MODE_ERROR, 170);
        headline(c, ok ? t("Alles erledigt", "All done") : t("Das hat nicht geklappt", "That didn't work"));
        body(c, message);
        if (ok) {
            button(mBottom, t("Zurück zur Übersicht", "Back to overview"), false, false, new View.OnClickListener() {
                @Override public void onClick(View v) { showMain(); }
            });
            button(mBottom, t("Fertig", "Done"), true, false, new View.OnClickListener() {
                @Override public void onClick(View v) { finish(); }
            });
        } else {
            button(mBottom, t("Zurück", "Back"), false, false, new View.OnClickListener() {
                @Override public void onClick(View v) { showMain(); }
            });
            if (mLastWork != null) {
                final String title = mLastTitle;
                final Work work = mLastWork;
                final String okMsg = mLastOk;
                final Runnable next = mLastNext;
                final boolean rev = mLastReverse;
                button(mBottom, t("Erneut versuchen", "Try again"), true, false, new View.OnClickListener() {
                    @Override public void onClick(View v) {
                        requireUnlocked(new Runnable() { @Override public void run() { mNextReverse = rev; runWork(title, work, okMsg, next); } });
                    }
                });
            }
        }
        animatePage();
    }

    /** Shows "n %" and a determinate bar; -1 goes back to the indeterminate bar. */
    private void setProgressPercent(final int percent) {
        mUi.post(new Runnable() { @Override public void run() {
            if (mWorkPercent == null || mWorkBar == null || !mBusy || isDestroyed()) return;
            if (percent < 0) {
                mWorkPercent.setVisibility(View.GONE);
                mWorkBar.setIndeterminate(true);
                return;
            }
            int p = Math.min(100, percent);
            if (mWorkPercent.getVisibility() != View.VISIBLE) {
                mWorkPercent.setAlpha(0f);
                mWorkPercent.setVisibility(View.VISIBLE);
                mWorkPercent.animate().alpha(1f).setDuration(220).start();
            }
            mWorkPercent.setText(p + " %");
            if (mWorkBar.isIndeterminate()) mWorkBar.setIndeterminate(false);
            mWorkBar.setProgress(p, true);
        } });
    }

    private void setProgressText(final String text) {
        setProgressPercent(-1);
        mUi.post(new Runnable() { @Override public void run() {
            if (mWorkText != null && mBusy && !isDestroyed()) {
                mWorkText.animate().alpha(0f).setDuration(120).withEndAction(new Runnable() {
                    @Override public void run() {
                        mWorkText.setText(text);
                        mWorkText.animate().alpha(1f).setDuration(180).start();
                    }
                }).start();
            }
        } });
    }
}

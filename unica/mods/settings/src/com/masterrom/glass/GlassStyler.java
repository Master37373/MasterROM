package com.masterrom.glass;

import android.app.Activity;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.RadialGradient;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.RippleDrawable;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.widget.TextView;

import java.lang.reflect.Method;

/**
 * MasterROM: gives the MasterROM pages inside Samsung's Settings the glass look of the updater and
 * the SD card page: a violet/blue/teal background behind the whole page (also behind the title),
 * translucent rounded cards and a rounded banner.
 *
 * Called from onResume() of the MasterROM settings fragments (see unica/mods/settings/customize.sh).
 * Everything is done with plain Android APIs and reflection, so it never crashes Settings: if a step
 * fails it is logged (tag "MasterROMGlass") and skipped.
 */
public final class GlassStyler {
    private static final String TAG = "MasterROMGlass";
    private static final int KEY = 0x7f6d6173; // view tag key ("mas"), any value outside app ids

    private GlassStyler() { }

    public static void apply(Object fragment) {
        try {
            View root = (View) call(fragment, "getView");
            Activity activity = (Activity) call(fragment, "getActivity");
            if (root == null || activity == null) return;
            boolean dark = (activity.getResources().getConfiguration().uiMode
                    & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
            float d = activity.getResources().getDisplayMetrics().density;

            // 1) page background behind everything
            Window w = activity.getWindow();
            w.setBackgroundDrawable(new PageDrawable(dark));
            w.setNavigationBarColor(Color.TRANSPARENT);
            w.setStatusBarColor(Color.TRANSPARENT);

            // 2) Samsung's own rounded corners are painted in the page color: switch them off
            callQuiet(fragment, "seslSetRoundedCorner", new Class[] { boolean.class }, false);

            ViewGroup list = findRecycler(root);
            if (list == null) {
                Log.i(TAG, "no list found in " + fragment.getClass().getName());
                return;
            }
            callQuiet(list, "seslSetFillBottomEnabled", new Class[] { boolean.class }, false);
            // Samsung paints the list's side padding (28px each side) in the old page grey
            noSidePaddingFill(list);
            diagnose(list);
            callQuiet(list, "seslSetFadingEdgeEnabled", new Class[] { boolean.class }, false);

            // 3) everything between the list and the window is made transparent
            View top = w.getDecorView();
            // (stops below the decor view: its background IS the window background from step 1)
            for (ViewParent p = list.getParent(); p instanceof View && p != top; p = p.getParent()) {
                clear((View) p);
            }
            clearAppBar(top, activity);
            hideById(top, activity, "round_corner");

            // 4) the cards are drawn by the list background, in the updater's glass colors
            if (!(list.getBackground() instanceof CardsDrawable)) {
                list.setBackground(new CardsDrawable(list, dark, d));
            }
            if (list.getTag(KEY) == null) {
                final ViewGroup l = list;
                final boolean dk = dark;
                final float dd = d;
                list.setTag(KEY, Boolean.TRUE);
                list.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() {
                    @Override public boolean onPreDraw() {
                        noSidePaddingFill(l);
                        styleChildren(l, dk, dd);
                        return true;
                    }
                });
            }
            styleChildren(list, dark, d);
            list.invalidate();
            Log.i(TAG, "applied to " + fragment.getClass().getSimpleName() + (dark ? " (dark)" : " (light)"));
        } catch (Throwable t) {
            Log.w(TAG, "glass style failed: " + t);
        }
    }

    // ---- list rows ----

    /** Kind of a list row: a card row, a spacer / category title between cards, or the banner. */
    static int kind(View v) {
        if (v instanceof TextView) return 0;                 // spacer or category title
        if (v.getTag(KEY + 1) != null) return (Integer) v.getTag(KEY + 1);
        int k = 1;
        int id = v.getResources().getIdentifier("logo_background_view", "id", v.getContext().getPackageName());
        if (id != 0 && v.findViewById(id) != null) k = 2;   // MasterROM banner
        v.setTag(KEY + 1, k);
        return k;
    }

    /**
     * Styles the visible rows. Runs before every frame and is cheap: Samsung's adapter may set its
     * own row background again when a row is bound, so the check is the background itself.
     */
    static void styleChildren(ViewGroup list, boolean dark, float d) {
        for (int i = 0; i < list.getChildCount(); i++) {
            View c = list.getChildAt(i);
            int k = kind(c);
            if (k == 1) {
                if (!(c.getBackground() instanceof GlassRipple)) {
                    // no own fill: the card is drawn behind; keep a press ripple inside the row
                    c.setBackground(new GlassRipple(dark ? 0x22FFFFFF : 0x14000000));
                }
                clearLinkCard(c);
            } else if (k == 2) {
                if (!c.getClipToOutline()) {
                    final float r = 26 * d;
                    c.setOutlineProvider(new ViewOutlineProvider() {
                        @Override public void getOutline(View view, Outline outline) {
                            outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), r);
                        }
                    });
                    c.setClipToOutline(true);
                }
                if (c.getBackground() != null) c.setBackground(null);
            } else if (c.getBackground() != null) {
                c.setBackground(null);
            }
        }
    }

    /**
     * "Looking for something else?" footer (SecRelativeLinkView): Samsung gives it its own opaque
     * rounded card. Its fill is removed so it sits on a glass card like every other row.
     */
    static void clearLinkCard(View row) {
        if (!(row instanceof ViewGroup) || ((ViewGroup) row).getChildCount() == 0) return;
        View link = ((ViewGroup) row).getChildAt(0);
        if (!link.getClass().getName().endsWith("RelativeLinkView")) return;
        clearGroupFills(link);
    }

    /** Removes the fill of a view group and of all view groups inside it (texts keep their ripple). */
    private static void clearGroupFills(View v) {
        if (!(v instanceof ViewGroup)) return;
        if (v.getBackground() != null) v.setBackground(null);
        ViewGroup g = (ViewGroup) v;
        for (int i = 0; i < g.getChildCount(); i++) clearGroupFills(g.getChildAt(i));
    }

    // ---- side padding fill ----

    private static Method sFillMethod;
    private static boolean sFillLooked;

    /** Samsung fills the list's side padding (28px) in the old page grey: switch that off. */
    static void noSidePaddingFill(ViewGroup list) {
        if (!sFillLooked) {
            sFillLooked = true;
            sFillMethod = find(list.getClass(), "seslSetFillHorizontalPaddingEnabled", new Class[] { boolean.class });
        }
        if (sFillMethod == null) return;
        try {
            sFillMethod.invoke(list, false);
        } catch (Throwable t) {
            Log.i(TAG, "fill: " + t);
        }
    }

    // ---- diagnostics (once per list) ----

    private static void diagnose(ViewGroup list) {
        if (list.getTag(KEY + 2) != null) return;
        list.setTag(KEY + 2, Boolean.TRUE);
        try {
            StringBuilder sb = new StringBuilder("diag list=").append(list.getClass().getName())
                    .append(" fillMethod=").append(sFillMethod != null)
                    .append(" pad=").append(list.getPaddingLeft()).append('/').append(list.getPaddingRight())
                    .append(" bg=").append(name(list.getBackground()));
            Object n = call(list, "getItemDecorationCount");
            int count = n instanceof Integer ? (Integer) n : 0;
            for (int i = 0; i < count; i++) {
                Method m = find(list.getClass(), "getItemDecorationAt", new Class[] { int.class });
                Object d = m == null ? null : m.invoke(list, i);
                sb.append(" deco").append(i).append('=').append(d == null ? "null" : d.getClass().getName());
            }
            Log.i(TAG, sb.toString());
            for (ViewParent p = list.getParent(); p instanceof View; p = p.getParent()) {
                View v = (View) p;
                Log.i(TAG, "diag parent " + v.getClass().getName() + " id=" + idName(v) + " bg=" + name(v.getBackground())
                        + " fg=" + name(v.getForeground()) + " " + v.getLeft() + "," + v.getTop() + "-" + v.getRight() + "," + v.getBottom());
            }
        } catch (Throwable t) {
            Log.i(TAG, "diag: " + t);
        }
    }

    private static String name(Object o) {
        return o == null ? "null" : o.getClass().getSimpleName();
    }

    private static String idName(View v) {
        try {
            return v.getId() == View.NO_ID ? "-" : v.getResources().getResourceEntryName(v.getId());
        } catch (Throwable t) {
            return "?";
        }
    }

    /** Press ripple without a fill, so the glass card behind the row stays visible. */
    static final class GlassRipple extends RippleDrawable {
        GlassRipple(int press) {
            super(ColorStateList.valueOf(press), null, new ColorDrawable(Color.WHITE));
        }
    }

    // ---- helpers ----

    private static void clear(View v) {
        v.setBackground(null);
    }

    private static void clearAppBar(View top, Context c) {
        for (String name : new String[] { "app_bar", "collapsing_app_bar", "action_bar", "collapsing_appbar_title_layout_parent" }) {
            View v = byName(top, c, name);
            if (v == null) continue;
            v.setBackground(null);
            callQuiet(v, "setContentScrimColor", new Class[] { int.class }, Color.TRANSPARENT);
            callQuiet(v, "setStatusBarScrimColor", new Class[] { int.class }, Color.TRANSPARENT);
        }
    }

    private static void hideById(View top, Context c, String name) {
        View v = byName(top, c, name);
        if (v != null) v.setVisibility(View.GONE);
    }

    private static View byName(View top, Context c, String name) {
        int id = c.getResources().getIdentifier(name, "id", c.getPackageName());
        return id == 0 ? null : top.findViewById(id);
    }

    private static ViewGroup findRecycler(View v) {
        if (v instanceof ViewGroup) {
            if (v.getClass().getName().endsWith("RecyclerView") && v.getVisibility() == View.VISIBLE) return (ViewGroup) v;
            ViewGroup g = (ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) {
                ViewGroup r = findRecycler(g.getChildAt(i));
                if (r != null) return r;
            }
        }
        return null;
    }

    private static Object call(Object o, String name) throws Exception {
        Method m = find(o.getClass(), name, new Class[0]);
        return m == null ? null : m.invoke(o);
    }

    private static void callQuiet(Object o, String name, Class<?>[] types, Object arg) {
        try {
            Method m = find(o.getClass(), name, types);
            if (m != null) m.invoke(o, arg);
        } catch (Throwable t) {
            Log.i(TAG, name + ": " + t);
        }
    }

    private static Method find(Class<?> c, String name, Class<?>[] types) {
        for (; c != null; c = c.getSuperclass()) {
            try {
                Method m = c.getDeclaredMethod(name, types);
                m.setAccessible(true);
                return m;
            } catch (NoSuchMethodException ignored) { }
        }
        return null;
    }

    // ---- drawables ----

    /** Page background: base color and three soft color spots (same as the updater). */
    static final class PageDrawable extends Drawable {
        private final boolean dark;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        PageDrawable(boolean dark) { this.dark = dark; }

        @Override public void draw(Canvas c) {
            Rect b = getBounds();
            float w = b.width(), h = b.height();
            c.drawColor(dark ? 0xFF07080C : 0xFFF2F4F8);
            spot(c, -0.25f * w, -0.10f * h, 1.10f * w, dark ? 0x387B6CFF : 0x575B6CFF);
            spot(c, 1.05f * w, 0.20f * h, 1.00f * w, dark ? 0x302ED3C6 : 0x4214B5C9);
            spot(c, 0.30f * w, 0.95f * h, 1.20f * w, dark ? 0x303E91FF : 0x380A72E6);
        }

        private void spot(Canvas c, float x, float y, float r, int color) {
            paint.setShader(new RadialGradient(x, y, r, new int[] { color, color & 0x00FFFFFF }, null, Shader.TileMode.CLAMP));
            c.drawCircle(x, y, r, paint);
        }

        @Override public void setAlpha(int alpha) { }
        @Override public void setColorFilter(ColorFilter cf) { }
        @Override public int getOpacity() { return PixelFormat.OPAQUE; }
    }

    /** Draws a translucent rounded card behind every run of card rows of the list. */
    static final class CardsDrawable extends Drawable {
        private final ViewGroup list;
        private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint stroke = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final float radius;
        private final RectF r = new RectF();

        CardsDrawable(ViewGroup list, boolean dark, float d) {
            this.list = list;
            radius = 26 * d;
            fill.setColor(dark ? 0x12FFFFFF : 0xA8FFFFFF);
            stroke.setStyle(Paint.Style.STROKE);
            stroke.setStrokeWidth(0.8f * d);
            stroke.setColor(dark ? 0x21FFFFFF : 0xEBFFFFFF);
        }

        @Override public void draw(Canvas c) {
            int n = list.getChildCount();
            boolean open = false;
            for (int i = 0; i <= n; i++) {
                View v = i < n ? list.getChildAt(i) : null;
                boolean card = v != null && v.getVisibility() == View.VISIBLE && kind(v) == 1 && v.getHeight() > 0;
                if (card) {
                    float t = v.getTop() + v.getTranslationY();
                    float bt = v.getBottom() + v.getTranslationY();
                    if (!open) {
                        r.set(v.getLeft(), t, v.getRight(), bt);
                        open = true;
                    } else {
                        r.left = Math.min(r.left, v.getLeft());
                        r.right = Math.max(r.right, v.getRight());
                        r.bottom = bt;
                    }
                } else if (open) {
                    c.drawRoundRect(r, radius, radius, fill);
                    c.drawRoundRect(r, radius, radius, stroke);
                    open = false;
                }
            }
        }

        @Override public void setAlpha(int alpha) { }
        @Override public void setColorFilter(ColorFilter cf) { }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}

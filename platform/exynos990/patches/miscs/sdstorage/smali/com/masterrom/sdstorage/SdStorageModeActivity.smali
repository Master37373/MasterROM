.class public Lcom/masterrom/sdstorage/SdStorageModeActivity;
.super Landroid/app/Activity;
.source "SdStorageModeActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;
    }
.end annotation


# static fields
.field private static final EXTRA_FROM_GUARD:Ljava/lang/String; = "com.masterrom.sdstorage.FROM_GUARD"

.field private static final EXTRA_FROM_WIZARD:Ljava/lang/String; = "com.masterrom.sdstorage.FROM_WIZARD"

.field private static final EXTRA_MOVE_ID:Ljava/lang/String; = "android.content.pm.extra.MOVE_ID"

.field private static final MATCH_ANY_USER:I = 0x400000

.field private static final MOVE_FAILED_LOCKED_USER:I = -0xa

.field private static final MOVE_SUCCEEDED:I = -0x64

.field private static final SECURE_FOLDER_PKG:Ljava/lang/String; = "com.samsung.knox.securefolder"

.field private static final TAG:Ljava/lang/String; = "MasterROMSdStorage"


# instance fields
.field private mAccent:I

.field private mAccent2:I

.field private mBack:Landroid/view/View;

.field private mBackCb:Landroid/window/OnBackInvokedCallback;

.field private mBase:I

.field private mBottom:Landroid/widget/LinearLayout;

.field private mBusy:Z

.field private mChipBg:I

.field private mChipText:I

.field private mContent:Landroid/widget/LinearLayout;

.field private mDe:Z

.field private mDivider:I

.field private final mEase:Landroid/view/animation/PathInterpolator;

.field private final mEmph:Landroid/view/animation/PathInterpolator;

.field private mError:I

.field private mExpand:Landroid/widget/FrameLayout;

.field private mFont:Landroid/graphics/Typeface;

.field private mFrame:Landroid/widget/LinearLayout;

.field private mGlass:I

.field private mGlassHi:I

.field private mGlassStroke:I

.field private mHeader:Landroid/widget/LinearLayout;

.field private mLastNext:Ljava/lang/Runnable;

.field private mLastOk:Ljava/lang/String;

.field private mLastReverse:Z

.field private mLastTitle:Ljava/lang/String;

.field private mLastWork:Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;

.field private final mListener:Landroid/os/storage/StorageEventListener;

.field private volatile mNewPrivate:Landroid/os/storage/VolumeInfo;

.field private mNextReverse:Z

.field private mNight:Z

.field private mOnAccent:I

.field private mOnMain:Z

.field private mPageId:I

.field private mPm:Landroid/content/pm/PackageManager;

.field private mRoot:Landroid/widget/FrameLayout;

.field private mScroll:Landroid/widget/ScrollView;

.field private mSheetCancel:Ljava/lang/Runnable;

.field private mSheetShown:Z

.field private mSm:Landroid/os/storage/StorageManager;

.field private final mSnap:Ljava/lang/Runnable;

.field private final mSpring:Landroid/view/animation/PathInterpolator;

.field private mStartCollapsed:Z

.field private mSubText:I

.field private mText:I

.field private mTitle:Landroid/widget/TextView;

.field private mTop:Landroid/widget/FrameLayout;

.field private mTouching:Z

.field private mUi:Landroid/os/Handler;

.field private mUm:Landroid/os/UserManager;

.field private mViolet:I

.field private mWorkBar:Landroid/widget/ProgressBar;

.field private mWorkPercent:Landroid/widget/TextView;

.field private mWorkText:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 69
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 114
    new-instance v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$1;

    invoke-direct {v0, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$1;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V

    iput-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSnap:Ljava/lang/Runnable;

    .line 133
    new-instance v0, Landroid/view/animation/PathInterpolator;

    const v1, 0x3e4ccccd    # 0.2f

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2, v2, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    iput-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mEase:Landroid/view/animation/PathInterpolator;

    .line 134
    new-instance v0, Landroid/view/animation/PathInterpolator;

    const v1, 0x3f333333    # 0.7f

    const v2, 0x3dcccccd    # 0.1f

    const v4, 0x3d4ccccd    # 0.05f

    invoke-direct {v0, v4, v1, v2, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    iput-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mEmph:Landroid/view/animation/PathInterpolator;

    .line 135
    new-instance v0, Landroid/view/animation/PathInterpolator;

    const/high16 v1, 0x3fa00000    # 1.25f

    const v2, 0x3f23d70a    # 0.64f

    const v4, 0x3eae147b    # 0.34f

    invoke-direct {v0, v4, v1, v2, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    iput-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSpring:Landroid/view/animation/PathInterpolator;

    .line 137
    new-instance v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$2;

    invoke-direct {v0, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$2;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V

    iput-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mListener:Landroid/os/storage/StorageEventListener;

    return-void
.end method

.method static synthetic access$000(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V
    .locals 0

    .line 69
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->snapAppBar()V

    return-void
.end method

.method static synthetic access$100(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V
    .locals 0

    .line 69
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->refreshMain()V

    return-void
.end method

.method static synthetic access$1000(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Ljava/lang/Runnable;
    .locals 0

    .line 69
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSnap:Ljava/lang/Runnable;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/widget/ScrollView;
    .locals 0

    .line 69
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mScroll:Landroid/widget/ScrollView;

    return-object p0
.end method

.method static synthetic access$1202(Lcom/masterrom/sdstorage/SdStorageModeActivity;Z)Z
    .locals 0

    .line 69
    iput-boolean p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mTouching:Z

    return p1
.end method

.method static synthetic access$1300(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Z
    .locals 0

    .line 69
    iget-boolean p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mStartCollapsed:Z

    return p0
.end method

.method static synthetic access$1302(Lcom/masterrom/sdstorage/SdStorageModeActivity;Z)Z
    .locals 0

    .line 69
    iput-boolean p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mStartCollapsed:Z

    return p1
.end method

.method static synthetic access$1400(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/widget/LinearLayout;
    .locals 0

    .line 69
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mContent:Landroid/widget/LinearLayout;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V
    .locals 0

    .line 69
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->collapseNow()V

    return-void
.end method

.method static synthetic access$1600(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/widget/LinearLayout;
    .locals 0

    .line 69
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mFrame:Landroid/widget/LinearLayout;

    return-object p0
.end method

.method static synthetic access$1700(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V
    .locals 0

    .line 69
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->cancelSheet()V

    return-void
.end method

.method static synthetic access$1800(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Z
    .locals 0

    .line 69
    iget-boolean p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSheetShown:Z

    return p0
.end method

.method static synthetic access$1802(Lcom/masterrom/sdstorage/SdStorageModeActivity;Z)Z
    .locals 0

    .line 69
    iput-boolean p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSheetShown:Z

    return p1
.end method

.method static synthetic access$1902(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 0

    .line 69
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSheetCancel:Ljava/lang/Runnable;

    return-object p1
.end method

.method static synthetic access$200(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/DiskInfo;Landroid/os/storage/VolumeInfo;)V
    .locals 0

    .line 69
    invoke-direct {p0, p1, p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->toPortable(Landroid/os/storage/DiskInfo;Landroid/os/storage/VolumeInfo;)V

    return-void
.end method

.method static synthetic access$2000(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V
    .locals 0

    .line 69
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->updateBackCallback()V

    return-void
.end method

.method static synthetic access$2100(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Z
    .locals 0

    .line 69
    iget-boolean p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mOnMain:Z

    return p0
.end method

.method static synthetic access$2200(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Z
    .locals 0

    .line 69
    iget-boolean p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBusy:Z

    return p0
.end method

.method static synthetic access$2300(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V
    .locals 0

    .line 69
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->showMain()V

    return-void
.end method

.method static synthetic access$2400(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/VolumeInfo;Z)V
    .locals 0

    .line 69
    invoke-direct {p0, p1, p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->confirmFileLocation(Landroid/os/storage/VolumeInfo;Z)V

    return-void
.end method

.method static synthetic access$2500(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/DiskInfo;)V
    .locals 0

    .line 69
    invoke-direct {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->confirmToInternal(Landroid/os/storage/DiskInfo;)V

    return-void
.end method

.method static synthetic access$2600(Lcom/masterrom/sdstorage/SdStorageModeActivity;)I
    .locals 0

    .line 69
    iget p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mDivider:I

    return p0
.end method

.method static synthetic access$2700(Lcom/masterrom/sdstorage/SdStorageModeActivity;)I
    .locals 0

    .line 69
    iget p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mAccent:I

    return p0
.end method

.method static synthetic access$2800(Lcom/masterrom/sdstorage/SdStorageModeActivity;F)I
    .locals 0

    .line 69
    invoke-direct {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result p0

    return p0
.end method

.method static synthetic access$2900(Lcom/masterrom/sdstorage/SdStorageModeActivity;I)V
    .locals 0

    .line 69
    invoke-direct {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->unlockUser(I)V

    return-void
.end method

.method static synthetic access$300(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 69
    invoke-direct {p0, p1, p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$3000(Lcom/masterrom/sdstorage/SdStorageModeActivity;)I
    .locals 0

    .line 69
    iget p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mPageId:I

    return p0
.end method

.method static synthetic access$3100(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Ljava/util/List;
    .locals 0

    .line 69
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->lockedUsers()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$3200(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/os/Handler;
    .locals 0

    .line 69
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mUi:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$3300(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/os/storage/StorageManager;
    .locals 0

    .line 69
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSm:Landroid/os/storage/StorageManager;

    return-object p0
.end method

.method static synthetic access$3400(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/DiskInfo;I)Landroid/os/storage/VolumeInfo;
    .locals 0

    .line 69
    invoke-direct {p0, p1, p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->findVolume(Landroid/os/storage/DiskInfo;I)Landroid/os/storage/VolumeInfo;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$3500(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/VolumeInfo;)V
    .locals 0

    .line 69
    invoke-direct {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->unmountQuietly(Landroid/os/storage/VolumeInfo;)V

    return-void
.end method

.method static synthetic access$3602(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/VolumeInfo;)Landroid/os/storage/VolumeInfo;
    .locals 0

    .line 69
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mNewPrivate:Landroid/os/storage/VolumeInfo;

    return-object p1
.end method

.method static synthetic access$3700(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;)Landroid/os/storage/VolumeInfo;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 69
    invoke-direct {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->waitPrivateMounted(Ljava/lang/String;)Landroid/os/storage/VolumeInfo;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$3800(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V
    .locals 0

    .line 69
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->showInternalReady()V

    return-void
.end method

.method static synthetic access$3900(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 0

    .line 69
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->runWork(Ljava/lang/String;Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$400(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;)V
    .locals 0

    .line 69
    invoke-direct {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->setProgressText(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$4000(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/VolumeInfo;Z)V
    .locals 0

    .line 69
    invoke-direct {p0, p1, p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->moveFiles(Landroid/os/storage/VolumeInfo;Z)V

    return-void
.end method

.method static synthetic access$4100(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/Runnable;)V
    .locals 0

    .line 69
    invoke-direct {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->requireUnlocked(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$4200(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/content/pm/PackageManager;
    .locals 0

    .line 69
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mPm:Landroid/content/pm/PackageManager;

    return-object p0
.end method

.method static synthetic access$4302(Lcom/masterrom/sdstorage/SdStorageModeActivity;Z)Z
    .locals 0

    .line 69
    iput-boolean p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mNextReverse:Z

    return p1
.end method

.method static synthetic access$4400(Lcom/masterrom/sdstorage/SdStorageModeActivity;Z)V
    .locals 0

    .line 69
    invoke-direct {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->setBusy(Z)V

    return-void
.end method

.method static synthetic access$4500(Lcom/masterrom/sdstorage/SdStorageModeActivity;ZLjava/lang/String;)V
    .locals 0

    .line 69
    invoke-direct {p0, p1, p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->showResult(ZLjava/lang/String;)V

    return-void
.end method

.method static synthetic access$4600(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/widget/TextView;
    .locals 0

    .line 69
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mWorkPercent:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$4700(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/widget/ProgressBar;
    .locals 0

    .line 69
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mWorkBar:Landroid/widget/ProgressBar;

    return-object p0
.end method

.method static synthetic access$4800(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/widget/TextView;
    .locals 0

    .line 69
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mWorkText:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$500(Lcom/masterrom/sdstorage/SdStorageModeActivity;I)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 69
    invoke-direct {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->waitMove(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$600(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/view/animation/PathInterpolator;
    .locals 0

    .line 69
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mEase:Landroid/view/animation/PathInterpolator;

    return-object p0
.end method

.method static synthetic access$700(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/view/animation/PathInterpolator;
    .locals 0

    .line 69
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSpring:Landroid/view/animation/PathInterpolator;

    return-object p0
.end method

.method static synthetic access$800(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Z
    .locals 0

    .line 69
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->handleBack()Z

    move-result p0

    return p0
.end method

.method static synthetic access$900(Lcom/masterrom/sdstorage/SdStorageModeActivity;I)V
    .locals 0

    .line 69
    invoke-direct {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->applyAppBar(I)V

    return-void
.end method

.method private addPress(Landroid/view/View;)V
    .locals 1

    .line 347
    new-instance v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$5;

    invoke-direct {v0, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$5;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method

.method private static alphaF(IF)I
    .locals 1

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float/2addr p1, v0

    .line 281
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-static {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->withAlpha(II)I

    move-result p0

    return p0
.end method

.method private anim(Landroid/widget/LinearLayout;II)Lcom/masterrom/sdstorage/SdAnimView;
    .locals 4

    .line 586
    new-instance v0, Lcom/masterrom/sdstorage/SdAnimView;

    iget v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mText:I

    iget v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mAccent:I

    iget v3, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mOnAccent:I

    invoke-direct {v0, p0, v1, v2, v3}, Lcom/masterrom/sdstorage/SdAnimView;-><init>(Landroid/content/Context;III)V

    .line 587
    invoke-virtual {v0, p2}, Lcom/masterrom/sdstorage/SdAnimView;->setMode(I)V

    .line 588
    iget-boolean p2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mNextReverse:Z

    invoke-virtual {v0, p2}, Lcom/masterrom/sdstorage/SdAnimView;->setReverse(Z)V

    const/4 p2, 0x0

    .line 589
    iput-boolean p2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mNextReverse:Z

    .line 590
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    int-to-float p3, p3

    invoke-direct {p0, p3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result p3

    const/4 v1, -0x1

    invoke-direct {p2, v1, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 p3, 0x41400000    # 12.0f

    .line 591
    invoke-direct {p0, p3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result p0

    iput p0, p2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 592
    invoke-virtual {p1, v0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method private animatePage()V
    .locals 6

    const/4 v0, 0x0

    .line 553
    :goto_0
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mContent:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    if-ge v0, v1, :cond_0

    .line 554
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mContent:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 555
    invoke-virtual {v1, v3}, Landroid/view/View;->setAlpha(F)V

    const/high16 v4, 0x42100000    # 36.0f

    .line 556
    invoke-direct {p0, v4}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v1, v4}, Landroid/view/View;->setTranslationY(F)V

    const v4, 0x3f7851ec    # 0.97f

    .line 557
    invoke-virtual {v1, v4}, Landroid/view/View;->setScaleX(F)V

    .line 558
    invoke-virtual {v1, v4}, Landroid/view/View;->setScaleY(F)V

    .line 559
    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const-wide/16 v2, 0x37

    int-to-long v4, v0

    mul-long/2addr v4, v2

    .line 560
    invoke-virtual {v1, v4, v5}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const-wide/16 v2, 0x208

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    iget-object v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mEmph:Landroid/view/animation/PathInterpolator;

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 562
    :cond_0
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBottom:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    .line 563
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBottom:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 564
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBottom:Landroid/widget/LinearLayout;

    const/high16 v1, 0x41c00000    # 24.0f

    invoke-direct {p0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setTranslationY(F)V

    .line 565
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBottom:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0xb4

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0x1a4

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mEmph:Landroid/view/animation/PathInterpolator;

    invoke-virtual {v0, p0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_1
    return-void
.end method

.method private applyAppBar(I)V
    .locals 7

    int-to-float p1, p1

    .line 507
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->expandRange()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr p1, v0

    const/4 v0, 0x0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    const/high16 v1, -0x41400000    # -0.375f

    mul-float/2addr v1, p1

    add-float/2addr v1, v0

    .line 509
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getWidth()I

    move-result v0

    int-to-float v0, v0

    iget-object v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getHeight()I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mTop:Landroid/widget/FrameLayout;

    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x42600000    # 56.0f

    .line 510
    invoke-direct {p0, v4}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v4

    int-to-float v4, v4

    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->expandRange()I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v3, v0

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr v3, v0

    const/high16 v6, 0x428c0000    # 70.0f

    .line 511
    invoke-direct {p0, v6}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v6

    int-to-float v6, v6

    sub-float/2addr v5, v2

    div-float/2addr v5, v0

    add-float/2addr v5, v4

    mul-float/2addr v2, v1

    sub-float/2addr v4, v2

    div-float/2addr v4, v0

    .line 513
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setScaleX(F)V

    .line 514
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setScaleY(F)V

    .line 515
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mTitle:Landroid/widget/TextView;

    sub-float/2addr v6, v3

    mul-float/2addr v6, p1

    add-float/2addr v3, v6

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTranslationX(F)V

    .line 516
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mTitle:Landroid/widget/TextView;

    sub-float/2addr v4, v5

    mul-float/2addr v4, p1

    add-float/2addr v5, v4

    invoke-virtual {p0, v5}, Landroid/widget/TextView;->setTranslationY(F)V

    return-void
.end method

.method private body(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;
    .locals 2

    .line 609
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 610
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 611
    iget p2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSubText:I

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 p2, 0x2

    const/high16 v1, 0x41700000    # 15.0f

    .line 612
    invoke-virtual {v0, p2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    const/16 p2, 0x190

    .line 613
    invoke-direct {p0, p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->font(I)Landroid/graphics/Typeface;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    const/high16 p2, 0x40800000    # 4.0f

    .line 614
    invoke-direct {p0, p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result p2

    int-to-float p2, p2

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, p2, v1}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 615
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method private buildFrame()V
    .locals 13

    .line 365
    invoke-virtual {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    iget v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBase:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    const/4 v0, 0x0

    .line 367
    :try_start_0
    invoke-virtual {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 368
    invoke-virtual {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 369
    invoke-virtual {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Window;->setDecorFitsSystemWindows(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 372
    :catchall_0
    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mRoot:Landroid/widget/FrameLayout;

    .line 373
    iget-boolean v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mNight:Z

    const/high16 v3, 0x3f800000    # 1.0f

    if-eqz v2, :cond_0

    const v2, 0x3f8ccccd    # 1.1f

    goto :goto_0

    :cond_0
    move v2, v3

    .line 374
    :goto_0
    new-instance v10, Lcom/masterrom/sdstorage/SdGlassBackground;

    iget v6, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBase:I

    iget v4, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mAccent:I

    const v5, 0x3eae147b    # 0.34f

    mul-float/2addr v5, v2

    .line 375
    invoke-static {v4, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->alphaF(IF)I

    move-result v7

    iget v4, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mAccent2:I

    const v5, 0x3e851eb8    # 0.26f

    mul-float/2addr v5, v2

    invoke-static {v4, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->alphaF(IF)I

    move-result v8

    iget v4, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mViolet:I

    const v5, 0x3e6147ae    # 0.22f

    mul-float/2addr v2, v5

    invoke-static {v4, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->alphaF(IF)I

    move-result v9

    move-object v4, v10

    move-object v5, p0

    invoke-direct/range {v4 .. v9}, Lcom/masterrom/sdstorage/SdGlassBackground;-><init>(Landroid/content/Context;IIII)V

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v2, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 374
    invoke-virtual {v1, v10, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 378
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mFrame:Landroid/widget/LinearLayout;

    const/4 v2, 0x1

    .line 379
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 380
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mRoot:Landroid/widget/FrameLayout;

    iget-object v5, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mFrame:Landroid/widget/LinearLayout;

    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v6, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v5, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 383
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mHeader:Landroid/widget/LinearLayout;

    .line 384
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 385
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mHeader:Landroid/widget/LinearLayout;

    const/16 v5, 0x10

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 386
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mHeader:Landroid/widget/LinearLayout;

    const/high16 v5, 0x41600000    # 14.0f

    invoke-direct {p0, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v6

    invoke-direct {p0, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v7

    invoke-virtual {v1, v6, v0, v7, v0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 388
    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 389
    iget-boolean v6, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mNight:Z

    if-eqz v6, :cond_1

    const v6, 0x1affffff

    goto :goto_1

    :cond_1
    const v6, -0x38000001

    :goto_1
    const/high16 v7, 0x41b00000    # 22.0f

    invoke-direct {p0, v6, v7}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->pill(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v6

    .line 390
    invoke-direct {p0, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v7

    iget-boolean v8, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mNight:Z

    if-eqz v8, :cond_2

    const v8, 0x24ffffff

    goto :goto_2

    :cond_2
    const/high16 v8, 0x12000000

    :goto_2
    invoke-virtual {v6, v7, v8}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 391
    invoke-virtual {v1, v6}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 392
    new-instance v6, Landroid/widget/ImageView;

    invoke-direct {v6, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 393
    invoke-virtual {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const-string v8, "drawable"

    invoke-virtual {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->getPackageName()Ljava/lang/String;

    move-result-object v9

    const-string v10, "ic_arrow_back"

    invoke-virtual {v7, v10, v8, v9}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v7

    if-eqz v7, :cond_3

    .line 396
    :try_start_1
    invoke-virtual {p0, v7}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v7

    .line 397
    iget v8, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mText:I

    invoke-virtual {v7, v8}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 398
    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 401
    :catch_0
    :cond_3
    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v8, 0x41c00000    # 24.0f

    invoke-direct {p0, v8}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v9

    invoke-direct {p0, v8}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v10

    const/16 v11, 0x11

    invoke-direct {v7, v9, v10, v11}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v1, v6, v7}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 402
    const-string v6, "Zur\u00fcck"

    const-string v7, "Navigate up"

    invoke-direct {p0, v6, v7}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/widget/FrameLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 403
    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setClickable(Z)V

    .line 404
    new-instance v6, Lcom/masterrom/sdstorage/SdStorageModeActivity$6;

    invoke-direct {v6, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$6;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V

    invoke-virtual {v1, v6}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 405
    invoke-direct {p0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->addPress(Landroid/view/View;)V

    .line 406
    iput-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBack:Landroid/view/View;

    .line 407
    iget-object v6, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mHeader:Landroid/widget/LinearLayout;

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v9, 0x42300000    # 44.0f

    invoke-direct {p0, v9}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v10

    invoke-direct {p0, v9}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v9

    invoke-direct {v7, v10, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v1, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 409
    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mTop:Landroid/widget/FrameLayout;

    .line 410
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 411
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 412
    iget-object v6, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mTop:Landroid/widget/FrameLayout;

    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v7, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v1, v7}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 413
    iget-object v6, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mHeader:Landroid/widget/LinearLayout;

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v9, 0x42600000    # 56.0f

    invoke-direct {p0, v9}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v9

    invoke-direct {v7, v4, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 415
    new-instance v6, Landroid/widget/ScrollView;

    invoke-direct {v6, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mScroll:Landroid/widget/ScrollView;

    .line 416
    invoke-virtual {v6, v2}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 417
    iget-object v6, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mScroll:Landroid/widget/ScrollView;

    invoke-virtual {v6, v0}, Landroid/widget/ScrollView;->setVerticalScrollBarEnabled(Z)V

    .line 418
    iget-object v6, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mScroll:Landroid/widget/ScrollView;

    invoke-virtual {v6, v2}, Landroid/widget/ScrollView;->setOverScrollMode(I)V

    .line 419
    iget-object v6, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mScroll:Landroid/widget/ScrollView;

    invoke-virtual {v6, v0}, Landroid/widget/ScrollView;->setClipToPadding(Z)V

    .line 420
    new-instance v6, Landroid/widget/LinearLayout;

    invoke-direct {v6, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 421
    invoke-virtual {v6, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 424
    new-instance v7, Landroid/widget/FrameLayout;

    invoke-direct {v7, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mExpand:Landroid/widget/FrameLayout;

    .line 425
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->expandRange()I

    move-result v10

    invoke-direct {v9, v4, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v7, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 427
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mContent:Landroid/widget/LinearLayout;

    .line 428
    invoke-virtual {v7, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 429
    iget-object v7, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mContent:Landroid/widget/LinearLayout;

    invoke-direct {p0, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v9

    const/high16 v10, 0x40000000    # 2.0f

    invoke-direct {p0, v10}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v10

    invoke-direct {p0, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v12

    invoke-direct {p0, v8}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v8

    invoke-virtual {v7, v9, v10, v12, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 430
    iget-object v7, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mContent:Landroid/widget/LinearLayout;

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, -0x2

    invoke-direct {v8, v4, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 431
    iget-object v7, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mScroll:Landroid/widget/ScrollView;

    new-instance v8, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v8, v4, v9}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v6, v8}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 432
    iget-object v6, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mScroll:Landroid/widget/ScrollView;

    new-instance v7, Lcom/masterrom/sdstorage/SdStorageModeActivity$7;

    invoke-direct {v7, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$7;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V

    invoke-virtual {v6, v7}, Landroid/widget/ScrollView;->setOnScrollChangeListener(Landroid/view/View$OnScrollChangeListener;)V

    .line 439
    iget-object v6, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mScroll:Landroid/widget/ScrollView;

    new-instance v7, Lcom/masterrom/sdstorage/SdStorageModeActivity$8;

    invoke-direct {v7, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$8;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V

    invoke-virtual {v6, v7}, Landroid/widget/ScrollView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 452
    iget-object v6, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mScroll:Landroid/widget/ScrollView;

    new-instance v7, Lcom/masterrom/sdstorage/SdStorageModeActivity$9;

    invoke-direct {v7, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$9;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V

    invoke-virtual {v6, v7}, Landroid/widget/ScrollView;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 458
    iget-object v6, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mScroll:Landroid/widget/ScrollView;

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v7, v4, v0, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 461
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mTitle:Landroid/widget/TextView;

    .line 462
    iget v6, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mText:I

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 463
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mTitle:Landroid/widget/TextView;

    const/4 v6, 0x2

    const/high16 v7, 0x42000000    # 32.0f

    invoke-virtual {v1, v6, v7}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 464
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mTitle:Landroid/widget/TextView;

    const/16 v6, 0x258

    invoke-direct {p0, v6}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->font(I)Landroid/graphics/Typeface;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 465
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 466
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mTitle:Landroid/widget/TextView;

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 467
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mTitle:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    const/high16 v6, 0x42400000    # 48.0f

    invoke-direct {p0, v6}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v6

    sub-int/2addr v2, v6

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 468
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mTitle:Landroid/widget/TextView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setPivotX(F)V

    .line 469
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setPivotY(F)V

    .line 470
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mTop:Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mTitle:Landroid/widget/TextView;

    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    const v7, 0x800033

    invoke-direct {v6, v9, v9, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v1, v2, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 472
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mTitle:Landroid/widget/TextView;

    new-instance v2, Lcom/masterrom/sdstorage/SdStorageModeActivity$10;

    invoke-direct {v2, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$10;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 477
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mFrame:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mTop:Landroid/widget/FrameLayout;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v4, v0, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 479
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBottom:Landroid/widget/LinearLayout;

    .line 480
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 481
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBottom:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v11}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 482
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBottom:Landroid/widget/LinearLayout;

    invoke-direct {p0, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v1

    const/high16 v2, 0x41200000    # 10.0f

    invoke-direct {p0, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v2

    invoke-direct {p0, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v3

    const/high16 v5, 0x41800000    # 16.0f

    invoke-direct {p0, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v5

    invoke-virtual {v0, v1, v2, v3, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 483
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mFrame:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBottom:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v4, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 485
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mRoot:Landroid/widget/FrameLayout;

    new-instance v1, Lcom/masterrom/sdstorage/SdStorageModeActivity$11;

    invoke-direct {v1, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$11;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    .line 492
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mRoot:Landroid/widget/FrameLayout;

    invoke-virtual {p0, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method private button(Landroid/widget/LinearLayout;Ljava/lang/String;ZZLandroid/view/View$OnClickListener;)Landroid/widget/TextView;
    .locals 6

    .line 692
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 693
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 p2, 0x11

    .line 694
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setGravity(I)V

    const/4 p2, 0x2

    const/high16 v1, 0x41800000    # 16.0f

    .line 695
    invoke-virtual {v0, p2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 696
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 697
    invoke-direct {p0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result p2

    invoke-direct {p0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, p2, v2, v1, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    const/16 p2, 0x258

    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v3, 0x41d80000    # 27.0f

    if-eqz p4, :cond_1

    .line 700
    iget p3, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mError:I

    iget-boolean p4, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mNight:Z

    if-eqz p4, :cond_0

    const p4, 0x3e4ccccd    # 0.2f

    goto :goto_0

    :cond_0
    const p4, 0x3e051eb8    # 0.13f

    :goto_0
    invoke-static {p3, p4}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->alphaF(IF)I

    move-result p3

    invoke-direct {p0, p3, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->pill(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p3

    .line 701
    invoke-direct {p0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result p4

    iget v3, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mError:I

    const v4, 0x3ee66666    # 0.45f

    invoke-static {v3, v4}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->alphaF(IF)I

    move-result v3

    invoke-virtual {p3, p4, v3}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 703
    iget p4, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mError:I

    invoke-virtual {v0, p4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 704
    invoke-direct {p0, p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->font(I)Landroid/graphics/Typeface;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    goto :goto_1

    :cond_1
    if-eqz p3, :cond_2

    .line 706
    new-instance p3, Landroid/graphics/drawable/GradientDrawable;

    sget-object p2, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    iget p4, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mViolet:I

    iget v4, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mAccent:I

    iget v5, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mAccent2:I

    filled-new-array {p4, v4, v5}, [I

    move-result-object p4

    invoke-direct {p3, p2, p4}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 708
    invoke-direct {p0, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result p2

    int-to-float p2, p2

    invoke-virtual {p3, p2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 710
    iget p2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mOnAccent:I

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 p2, 0x2bc

    .line 711
    invoke-direct {p0, p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->font(I)Landroid/graphics/Typeface;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    goto :goto_1

    .line 713
    :cond_2
    iget p3, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mGlass:I

    invoke-direct {p0, p3, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->pill(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p3

    .line 714
    invoke-direct {p0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result p4

    iget v3, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mAccent:I

    const v4, 0x3e8f5c29    # 0.28f

    invoke-static {v3, v4}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->alphaF(IF)I

    move-result v3

    invoke-virtual {p3, p4, v3}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 716
    iget p4, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mChipText:I

    invoke-virtual {v0, p4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 717
    invoke-direct {p0, p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->font(I)Landroid/graphics/Typeface;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 719
    :goto_1
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/4 p2, 0x1

    .line 720
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setClickable(Z)V

    .line 721
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setFocusable(Z)V

    .line 722
    invoke-virtual {v0, p5}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 723
    invoke-direct {p0, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->addPress(Landroid/view/View;)V

    .line 724
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 p3, 0x42580000    # 54.0f

    invoke-direct {p0, p3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result p3

    invoke-direct {p2, v2, p3, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 725
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p3

    if-lez p3, :cond_3

    const/high16 p3, 0x41400000    # 12.0f

    invoke-direct {p0, p3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result p3

    iput p3, p2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 726
    :cond_3
    invoke-virtual {p1, v0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 727
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBottom:Landroid/widget/LinearLayout;

    if-ne p1, p0, :cond_4

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    :cond_4
    return-object v0
.end method

.method private cancelSheet()V
    .locals 2

    .line 773
    iget-boolean v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSheetShown:Z

    if-nez v0, :cond_0

    return-void

    .line 774
    :cond_0
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSheetCancel:Ljava/lang/Runnable;

    const/4 v1, 0x0

    .line 775
    iput-boolean v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSheetShown:Z

    const/4 v1, 0x0

    .line 776
    iput-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSheetCancel:Ljava/lang/Runnable;

    .line 777
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->updateBackCallback()V

    .line 778
    invoke-virtual {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_3

    invoke-virtual {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->isDestroyed()Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    if-eqz v0, :cond_2

    .line 779
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->showMain()V

    :cond_3
    :goto_0
    return-void
.end method

.method private card()Landroid/widget/LinearLayout;
    .locals 5

    .line 575
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    .line 576
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 577
    iget v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mGlass:I

    const/high16 v2, 0x41e00000    # 28.0f

    invoke-direct {p0, v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->glass(IF)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/high16 v1, 0x41b00000    # 22.0f

    .line 578
    invoke-direct {p0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v2

    const/high16 v3, 0x41a00000    # 20.0f

    invoke-direct {p0, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v4

    invoke-direct {p0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v1

    invoke-direct {p0, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v3

    invoke-virtual {v0, v2, v4, v1, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 579
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    const/high16 v2, 0x41600000    # 14.0f

    .line 580
    invoke-direct {p0, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 581
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mContent:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method private varargs chips(Landroid/widget/LinearLayout;[Ljava/lang/String;)V
    .locals 9

    .line 632
    new-instance v0, Landroid/widget/HorizontalScrollView;

    invoke-direct {v0, p0}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    .line 633
    invoke-virtual {v0, v1}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V

    const/4 v2, 0x2

    .line 634
    invoke-virtual {v0, v2}, Landroid/widget/HorizontalScrollView;->setOverScrollMode(I)V

    .line 635
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 636
    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 637
    :goto_0
    array-length v4, p2

    if-ge v1, v4, :cond_1

    .line 638
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 639
    aget-object v5, p2, v1

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 640
    iget v5, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mChipText:I

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v5, 0x41500000    # 13.0f

    .line 641
    invoke-virtual {v4, v2, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    const/16 v5, 0x2bc

    .line 642
    invoke-direct {p0, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->font(I)Landroid/graphics/Typeface;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 643
    iget v5, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mChipBg:I

    const/high16 v6, 0x41800000    # 16.0f

    invoke-direct {p0, v5, v6}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->pill(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/high16 v5, 0x41400000    # 12.0f

    .line 644
    invoke-direct {p0, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v6

    const/high16 v7, 0x40c00000    # 6.0f

    invoke-direct {p0, v7}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v8

    invoke-direct {p0, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v5

    invoke-direct {p0, v7}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v7

    invoke-virtual {v4, v6, v8, v5, v7}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 645
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x2

    invoke-direct {v5, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    if-lez v1, :cond_0

    const/high16 v6, 0x41000000    # 8.0f

    .line 646
    invoke-direct {p0, v6}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v6

    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 647
    :cond_0
    invoke-virtual {v3, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 649
    :cond_1
    invoke-virtual {v0, v3}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;)V

    .line 650
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object p2

    const/high16 v1, 0x41600000    # 14.0f

    .line 651
    invoke-direct {p0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result p0

    iput p0, p2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 652
    invoke-virtual {p1, v0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method private collapseNow()V
    .locals 3

    .line 528
    iget-boolean v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mStartCollapsed:Z

    if-nez v0, :cond_0

    return-void

    .line 529
    :cond_0
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mScroll:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v0

    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->expandRange()I

    move-result v1

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mScroll:Landroid/widget/ScrollView;

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->expandRange()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/ScrollView;->scrollTo(II)V

    .line 530
    :cond_1
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mScroll:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->applyAppBar(I)V

    return-void
.end method

.method private confirmFileLocation(Landroid/os/storage/VolumeInfo;Z)V
    .locals 9

    xor-int/lit8 v0, p2, 0x1

    .line 1203
    iput-boolean v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mNextReverse:Z

    if-eqz p2, :cond_0

    .line 1204
    const-string v0, "Dateien auf die SD-Karte verschieben?"

    const-string v1, "Move files to the SD card?"

    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1205
    :cond_0
    const-string v0, "Dateien in den internen Speicher verschieben?"

    const-string v1, "Move files to internal storage?"

    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    move-object v2, v0

    const-string v0, "Fotos, Videos, Downloads und andere Dateien werden verschoben und k\u00fcnftig dort gespeichert. Je nach Datenmenge dauert das einige Minuten."

    const-string v1, "Photos, videos, downloads and other files are moved and stored there from now on. Depending on the amount of data this takes a few minutes."

    .line 1206
    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v0, "Abbrechen"

    const-string v1, "Cancel"

    .line 1210
    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v0, "Verschieben"

    const-string v1, "Move"

    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    new-instance v8, Lcom/masterrom/sdstorage/SdStorageModeActivity$29;

    invoke-direct {v8, p0, p2, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity$29;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;ZLandroid/os/storage/VolumeInfo;)V

    const/4 v4, 0x2

    const/4 v7, 0x0

    move-object v1, p0

    .line 1204
    invoke-direct/range {v1 .. v8}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->showSheet(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;)V

    .line 1218
    new-instance p1, Lcom/masterrom/sdstorage/SdStorageModeActivity$30;

    invoke-direct {p1, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$30;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V

    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSheetCancel:Ljava/lang/Runnable;

    return-void
.end method

.method private confirmToInternal(Landroid/os/storage/DiskInfo;)V
    .locals 10

    .line 1112
    invoke-virtual {p1}, Landroid/os/storage/DiskInfo;->getId()Ljava/lang/String;

    move-result-object p1

    .line 1113
    const-string v0, "Alle Daten auf der SD-Karte l\u00f6schen?"

    const-string v1, "Erase all data on the SD card?"

    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v0, "Die Karte wird formatiert und verschl\u00fcsselt. Alle Daten darauf werden unwiderruflich gel\u00f6scht."

    const-string v1, "The card is formatted and encrypted. All data on it will be permanently erased."

    .line 1114
    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v0, "Abbrechen"

    const-string v1, "Cancel"

    .line 1116
    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v0, "L\u00f6schen und einrichten"

    const-string v1, "Erase and set up"

    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    new-instance v9, Lcom/masterrom/sdstorage/SdStorageModeActivity$25;

    invoke-direct {v9, p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity$25;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;)V

    const/4 v5, -0x1

    const/4 v8, 0x1

    move-object v2, p0

    .line 1113
    invoke-direct/range {v2 .. v9}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->showSheet(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;)V

    return-void
.end method

.method private currentFileLocation(Landroid/os/storage/VolumeInfo;)Ljava/lang/String;
    .locals 1

    .line 830
    invoke-direct {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->filesOnSd(Landroid/os/storage/VolumeInfo;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "SD-Karte"

    const-string v0, "SD card"

    goto :goto_0

    :cond_0
    const-string p1, "Interner Speicher"

    const-string v0, "Internal storage"

    :goto_0
    invoke-direct {p0, p1, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private dp(F)I
    .locals 1

    .line 273
    invoke-virtual {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    const/4 v0, 0x1

    invoke-static {v0, p1, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method private expandRange()I
    .locals 4

    .line 497
    invoke-virtual {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    const/high16 v1, 0x42600000    # 56.0f

    .line 498
    invoke-direct {p0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v2

    int-to-float v0, v0

    const v3, 0x3e99999a    # 0.3f

    mul-float/2addr v0, v3

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-direct {p0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result p0

    sub-int/2addr v0, p0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method private filesOnSd(Landroid/os/storage/VolumeInfo;)Z
    .locals 0

    .line 825
    invoke-virtual {p1}, Landroid/os/storage/VolumeInfo;->getFsUuid()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 826
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSm:Landroid/os/storage/StorageManager;

    invoke-virtual {p0}, Landroid/os/storage/StorageManager;->getPrimaryStorageUuid()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private findSdDisk()Landroid/os/storage/DiskInfo;
    .locals 3

    .line 801
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSm:Landroid/os/storage/StorageManager;

    invoke-virtual {p0}, Landroid/os/storage/StorageManager;->getDisks()Ljava/util/List;

    move-result-object p0

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 803
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/storage/DiskInfo;

    if-eqz v1, :cond_1

    .line 804
    invoke-virtual {v1}, Landroid/os/storage/DiskInfo;->isSd()Z

    move-result v2

    if-eqz v2, :cond_1

    return-object v1

    :cond_2
    return-object v0
.end method

.method private findVolume(Landroid/os/storage/DiskInfo;I)Landroid/os/storage/VolumeInfo;
    .locals 4

    .line 810
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSm:Landroid/os/storage/StorageManager;

    invoke-virtual {p0}, Landroid/os/storage/StorageManager;->getVolumes()Ljava/util/List;

    move-result-object p0

    const/4 v0, 0x0

    if-eqz p0, :cond_2

    if-nez p1, :cond_0

    goto :goto_0

    .line 812
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/storage/VolumeInfo;

    if-eqz v1, :cond_1

    .line 813
    invoke-virtual {v1}, Landroid/os/storage/VolumeInfo;->getType()I

    move-result v2

    if-ne v2, p2, :cond_1

    invoke-virtual {p1}, Landroid/os/storage/DiskInfo;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Landroid/os/storage/VolumeInfo;->getDiskId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    return-object v1

    :cond_2
    :goto_0
    return-object v0
.end method

.method private font(I)Landroid/graphics/Typeface;
    .locals 1

    .line 286
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mFont:Landroid/graphics/Typeface;

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0
.end method

.method private glass(IF)Landroid/graphics/drawable/Drawable;
    .locals 7

    .line 325
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 326
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 327
    invoke-direct {p0, p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    const p1, 0x3f4ccccd    # 0.8f

    .line 328
    invoke-direct {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result p1

    const/4 v1, 0x1

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iget v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mGlassStroke:I

    invoke-virtual {v0, p1, v2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 329
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;

    sget-object v2, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    iget v3, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mGlassHi:I

    const/4 v4, 0x0

    .line 330
    invoke-static {v3, v4}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->withAlpha(II)I

    move-result v5

    filled-new-array {v3, v5}, [I

    move-result-object v3

    invoke-direct {p1, v2, v3}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 331
    invoke-direct {p0, p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v2

    int-to-float v2, v2

    invoke-direct {p0, p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v3

    int-to-float v3, v3

    invoke-direct {p0, p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v5

    int-to-float v5, v5

    invoke-direct {p0, p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result p2

    int-to-float p2, p2

    const/16 v6, 0x8

    new-array v6, v6, [F

    aput v2, v6, v4

    aput v3, v6, v1

    const/4 v2, 0x2

    aput v5, v6, v2

    const/4 v3, 0x3

    aput p2, v6, v3

    const/4 p2, 0x4

    const/4 v3, 0x0

    aput v3, v6, p2

    const/4 p2, 0x5

    aput v3, v6, p2

    const/4 p2, 0x6

    aput v3, v6, p2

    const/4 p2, 0x7

    aput v3, v6, p2

    invoke-virtual {p1, v6}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 332
    new-instance p2, Landroid/graphics/drawable/LayerDrawable;

    new-array v2, v2, [Landroid/graphics/drawable/Drawable;

    aput-object v0, v2, v4

    aput-object p1, v2, v1

    invoke-direct {p2, v2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    const/high16 p1, 0x42600000    # 56.0f

    .line 333
    invoke-direct {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result p0

    invoke-virtual {p2, v1, p0}, Landroid/graphics/drawable/LayerDrawable;->setLayerHeight(II)V

    const/16 p0, 0x37

    .line 334
    invoke-virtual {p2, v1, p0}, Landroid/graphics/drawable/LayerDrawable;->setLayerGravity(II)V

    return-object p2
.end method

.method private handleBack()Z
    .locals 2

    .line 258
    iget-boolean v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBusy:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 259
    :cond_0
    iget-boolean v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSheetShown:Z

    if-eqz v0, :cond_1

    .line 260
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->cancelSheet()V

    return v1

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method private headline(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;
    .locals 2

    .line 597
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 598
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 599
    iget p2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mText:I

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 p2, 0x2

    const/high16 v1, 0x41a00000    # 20.0f

    .line 600
    invoke-virtual {v0, p2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    const/16 p2, 0x2bc

    .line 601
    invoke-direct {p0, p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->font(I)Landroid/graphics/Typeface;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 602
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object p2

    const/high16 v1, 0x41000000    # 8.0f

    .line 603
    invoke-direct {p0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result p0

    iput p0, p2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 604
    invoke-virtual {p1, v0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method private loadColors()V
    .locals 2

    .line 290
    const-string v0, "sec"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v0

    iput-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mFont:Landroid/graphics/Typeface;

    const/4 v0, -0x1

    .line 291
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mOnAccent:I

    .line 292
    iget-boolean v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mNight:Z

    if-eqz v0, :cond_0

    const v0, -0xf8f7f4

    .line 293
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBase:I

    const v0, -0xb0a09

    .line 294
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mText:I

    const v0, -0x4c4840

    .line 295
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSubText:I

    const v0, -0xc16e01

    .line 296
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mAccent:I

    const v0, -0xd12c3a

    .line 297
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mAccent2:I

    const v0, -0x849301

    .line 298
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mViolet:I

    const v0, 0x12ffffff

    .line 299
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mGlass:I

    const v0, 0x21ffffff

    .line 300
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mGlassStroke:I

    const v0, 0x14ffffff

    .line 301
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mGlassHi:I

    .line 302
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mDivider:I

    const v0, 0x2e3e91ff

    .line 303
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mChipBg:I

    const v0, -0x633701

    .line 304
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mChipText:I

    const v0, -0x9491

    .line 305
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mError:I

    goto :goto_0

    :cond_0
    const v0, -0xd0b08

    .line 307
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBase:I

    const v0, -0xefeeec

    .line 308
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mText:I

    const v0, -0xb5b1a9

    .line 309
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSubText:I

    const v0, -0xf58d1a

    .line 310
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mAccent:I

    const v0, -0xeb4a37

    .line 311
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mAccent2:I

    const v0, -0xa49301

    .line 312
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mViolet:I

    const v0, -0x57000001

    .line 313
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mGlass:I

    const v0, -0x14000001

    .line 314
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mGlassStroke:I

    const v0, -0x7f000001

    .line 315
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mGlassHi:I

    const/high16 v0, 0x12000000

    .line 316
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mDivider:I

    const v0, 0x1c0a72e6

    .line 317
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mChipBg:I

    const v0, -0xf5992f

    .line 318
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mChipText:I

    const v0, -0x26c5c1

    .line 319
    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mError:I

    :goto_0
    return-void
.end method

.method private lockedUsers()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/content/pm/UserInfo;",
            ">;"
        }
    .end annotation

    .line 990
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 992
    :try_start_0
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mUm:Landroid/os/UserManager;

    invoke-virtual {v1}, Landroid/os/UserManager;->getUsers()Ljava/util/List;

    move-result-object v1

    if-nez v1, :cond_0

    return-object v0

    .line 994
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/UserInfo;

    if-eqz v2, :cond_1

    .line 995
    iget-object v3, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mUm:Landroid/os/UserManager;

    iget v4, v2, Landroid/content/pm/UserInfo;->id:I

    invoke-virtual {v3, v4}, Landroid/os/UserManager;->isUserUnlocked(I)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    .line 998
    const-string v1, "MasterROMSdStorage"

    const-string v2, "lockedUsers"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2
    return-object v0
.end method

.method private matchWrap()Landroid/widget/LinearLayout$LayoutParams;
    .locals 2

    .line 570
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v0, -0x1

    const/4 v1, -0x2

    invoke-direct {p0, v0, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    return-object p0
.end method

.method private moveError(I)Ljava/lang/String;
    .locals 3

    const/16 v0, -0xa

    if-eq p1, v0, :cond_6

    const/4 v0, -0x5

    if-eq p1, v0, :cond_5

    const/4 v0, -0x8

    if-eq p1, v0, :cond_4

    const/4 v0, -0x7

    if-eq p1, v0, :cond_3

    const/4 v0, -0x3

    if-eq p1, v0, :cond_2

    const/4 v0, -0x2

    if-eq p1, v0, :cond_1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 1359
    const-string v0, "Interner Fehler."

    const-string v1, "Internal error."

    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1348
    :cond_0
    const-string v0, "Nicht genug freier Speicher am Ziel."

    const-string v1, "Not enough free space at the destination."

    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1349
    :cond_1
    const-string v0, "Die App existiert nicht mehr."

    const-string v1, "The app no longer exists."

    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1350
    :cond_2
    const-string v0, "System-Apps k\u00f6nnen nicht verschoben werden."

    const-string v1, "System apps cannot be moved."

    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1352
    :cond_3
    const-string v0, "Es l\u00e4uft bereits ein anderer Verschiebevorgang. Bitte sp\u00e4ter erneut versuchen."

    const-string v1, "Another move is already in progress. Please try again later."

    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1354
    :cond_4
    const-string v0, "Diese App ist ein Ger\u00e4teadministrator und kann nicht verschoben werden."

    const-string v1, "This app is a device administrator and cannot be moved."

    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1351
    :cond_5
    const-string v0, "Dieser Speicherort ist nicht m\u00f6glich."

    const-string v1, "This location is not possible."

    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1356
    :cond_6
    const-string v0, "Der Sichere Ordner oder ein anderer Benutzer ist gesperrt. Entsperre ihn und versuche es dann erneut."

    const-string v1, "Secure Folder or another user is locked. Unlock it, then try again."

    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1361
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " (Code "

    const-string v2, " (code "

    invoke-direct {p0, v0, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private moveFiles(Landroid/os/storage/VolumeInfo;Z)V
    .locals 2

    xor-int/lit8 v0, p2, 0x1

    .line 1222
    iput-boolean v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mNextReverse:Z

    .line 1223
    const-string v0, "Verschieben"

    const-string v1, "Moving files"

    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/masterrom/sdstorage/SdStorageModeActivity$31;

    invoke-direct {v1, p0, p1, p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity$31;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/VolumeInfo;Z)V

    if-eqz p2, :cond_0

    .line 1234
    const-string p1, "Fotos, Downloads und andere Dateien liegen jetzt auf der SD-Karte. Neue Dateien werden automatisch dort gespeichert."

    const-string p2, "Photos, downloads and other files are now on the SD card. New files are stored there automatically."

    invoke-direct {p0, p1, p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 1236
    :cond_0
    const-string p1, "Fotos, Downloads und andere Dateien liegen jetzt im internen Speicher."

    const-string p2, "Photos, downloads and other files are now on internal storage."

    invoke-direct {p0, p1, p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :goto_0
    const/4 p2, 0x0

    .line 1223
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->runWork(Ljava/lang/String;Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method private newPage(Ljava/lang/String;)V
    .locals 3

    .line 535
    iget v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mPageId:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mPageId:I

    const/4 v0, 0x0

    .line 536
    iput-boolean v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSheetShown:Z

    const/4 v0, 0x0

    .line 537
    iput-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSheetCancel:Ljava/lang/Runnable;

    .line 538
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->updateBackCallback()V

    .line 539
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mContent:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 540
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBottom:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 541
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBottom:Landroid/widget/LinearLayout;

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 542
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 543
    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mContent:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mScroll:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getHeight()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 544
    iput-boolean v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mStartCollapsed:Z

    .line 545
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->collapseNow()V

    .line 546
    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mScroll:Landroid/widget/ScrollView;

    new-instance v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$12;

    invoke-direct {v0, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$12;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    .line 547
    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mTitle:Landroid/widget/TextView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setAlpha(F)V

    .line 548
    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mTitle:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 v0, 0x12c

    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mEmph:Landroid/view/animation/PathInterpolator;

    invoke-virtual {p1, p0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    return-void
.end method

.method private pill(IF)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 339
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 340
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 341
    invoke-direct {p0, p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result p0

    int-to-float p0, p0

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    return-object v0
.end method

.method public static redirectFromWizard(Landroid/app/Activity;)Z
    .locals 3

    .line 169
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 170
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 171
    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 172
    :cond_0
    const-string v1, "com.masterrom.sdstorage.FROM_WIZARD"

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v1, 0x30000000

    .line 173
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 174
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p0, 0x1

    return p0

    :catchall_0
    move-exception p0

    .line 177
    const-string v0, "MasterROMSdStorage"

    const-string v1, "redirectFromWizard"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p0, 0x0

    return p0
.end method

.method private refreshMain()V
    .locals 2

    .line 819
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mUi:Landroid/os/Handler;

    new-instance v1, Lcom/masterrom/sdstorage/SdStorageModeActivity$16;

    invoke-direct {v1, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$16;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private requireUnlocked(Ljava/lang/Runnable;)V
    .locals 10

    .line 1012
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->lockedUsers()Ljava/util/List;

    move-result-object v0

    .line 1013
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1014
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_0
    const/4 v1, 0x0

    .line 1017
    iput-boolean v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mOnMain:Z

    .line 1018
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Landroid/content/pm/UserInfo;

    .line 1019
    const-string v7, "Entsperren"

    const-string v8, "Unlock"

    invoke-direct {p0, v7, v8}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->newPage(Ljava/lang/String;)V

    .line 1020
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->card()Landroid/widget/LinearLayout;

    move-result-object v2

    const/4 v3, 0x6

    const/16 v4, 0xb4

    .line 1021
    invoke-direct {p0, v2, v3, v4}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->anim(Landroid/widget/LinearLayout;II)Lcom/masterrom/sdstorage/SdAnimView;

    .line 1022
    const-string v3, "Kurz entsperren, dann geht es weiter"

    const-string v4, "Unlock briefly, then we continue"

    invoke-direct {p0, v3, v4}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->headline(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    .line 1023
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 1024
    const-string v4, "Damit Fotos, Downloads und andere Dateien verschoben werden k\u00f6nnen, m\u00fcssen alle Bereiche dieses Ger\u00e4ts entsperrt sein. Gesperrt ist zurzeit:\n"

    const-string v5, "To move photos, downloads and other files, every space on this device has to be unlocked. Currently locked:\n"

    invoke-direct {p0, v4, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1028
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/16 v5, 0xa

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/UserInfo;

    const-string v9, "\u2022 "

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0, v4}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->userLabel(Landroid/content/pm/UserInfo;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 1029
    :cond_1
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v0, "Tippe auf \u201eEntsperren\u201c und gib die Sperre ein. Sobald alles entsperrt ist, geht es hier automatisch weiter."

    const-string v4, "Tap \u201cUnlock\u201d and enter the lock. As soon as everything is unlocked, this page continues automatically."

    invoke-direct {p0, v0, v4}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1032
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v2, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->body(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    .line 1034
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->card()Landroid/widget/LinearLayout;

    move-result-object v0

    .line 1035
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 1036
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v3, 0x10

    .line 1037
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 1038
    new-instance v3, Landroid/widget/ProgressBar;

    invoke-direct {v3, p0}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    .line 1039
    iget v4, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mAccent:I

    invoke-static {v4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ProgressBar;->setIndeterminateTintList(Landroid/content/res/ColorStateList;)V

    .line 1040
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x41b00000    # 22.0f

    invoke-direct {p0, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v9

    invoke-direct {p0, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v5

    invoke-direct {v4, v9, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1041
    new-instance v9, Landroid/widget/TextView;

    invoke-direct {v9, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1042
    const-string v3, "Warte auf Entsperrung \u2026"

    const-string v4, "Waiting for unlock \u2026"

    invoke-direct {p0, v3, v4}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v9, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1043
    iget v3, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mText:I

    invoke-virtual {v9, v3}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 v3, 0x2

    const/high16 v4, 0x41700000    # 15.0f

    .line 1044
    invoke-virtual {v9, v3, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    const/high16 v3, 0x41600000    # 14.0f

    .line 1045
    invoke-direct {p0, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v3

    invoke-virtual {v9, v3, v1, v1, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 1046
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v2, v9, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1047
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1049
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBottom:Landroid/widget/LinearLayout;

    const-string v0, "Abbrechen"

    const-string v2, "Cancel"

    invoke-direct {p0, v0, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v5, Lcom/masterrom/sdstorage/SdStorageModeActivity$22;

    invoke-direct {v5, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$22;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;ZZLandroid/view/View$OnClickListener;)Landroid/widget/TextView;

    .line 1052
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBottom:Landroid/widget/LinearLayout;

    invoke-direct {p0, v7, v8}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v5, Lcom/masterrom/sdstorage/SdStorageModeActivity$23;

    invoke-direct {v5, p0, v6}, Lcom/masterrom/sdstorage/SdStorageModeActivity$23;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/content/pm/UserInfo;)V

    const/4 v3, 0x1

    invoke-direct/range {v0 .. v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;ZZLandroid/view/View$OnClickListener;)Landroid/widget/TextView;

    .line 1055
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->animatePage()V

    .line 1057
    iget v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mPageId:I

    .line 1058
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mUi:Landroid/os/Handler;

    new-instance v2, Lcom/masterrom/sdstorage/SdStorageModeActivity$24;

    invoke-direct {v2, p0, v0, v9, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity$24;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;ILandroid/widget/TextView;Ljava/lang/Runnable;)V

    const-wide/16 v3, 0x320

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private resumeMove(Landroid/content/Intent;)Z
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_3

    .line 219
    const-string v1, "android.content.pm.extra.MOVE_ID"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_1

    :cond_0
    const/4 v2, -0x1

    .line 220
    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    .line 223
    :try_start_0
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mPm:Landroid/content/pm/PackageManager;

    invoke-virtual {v1, p1}, Landroid/content/pm/PackageManager;->getMoveStatus(I)I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v2, -0x64

    if-eq v1, v2, :cond_2

    if-gez v1, :cond_1

    goto :goto_0

    .line 229
    :cond_1
    const-string v0, "Verschieben"

    const-string v1, "Moving files"

    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/masterrom/sdstorage/SdStorageModeActivity$4;

    invoke-direct {v1, p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity$4;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;I)V

    const-string p1, "Fotos, Downloads und andere Dateien wurden verschoben."

    const-string v2, "Photos, downloads and other files have been moved."

    .line 237
    invoke-direct {p0, p1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v2, 0x0

    .line 229
    invoke-direct {p0, v0, v1, p1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->runWork(Ljava/lang/String;Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;Ljava/lang/String;Ljava/lang/Runnable;)V

    const/4 p0, 0x1

    return p0

    :cond_2
    :goto_0
    return v0

    :catchall_0
    move-exception p0

    .line 225
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "getMoveStatus "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "MasterROMSdStorage"

    invoke-static {v1, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_3
    :goto_1
    return v0
.end method

.method private row(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 7

    const/high16 v0, 0x3f800000    # 1.0f

    if-nez p4, :cond_0

    const/high16 p4, 0x41b00000    # 22.0f

    .line 659
    invoke-direct {p0, p4}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v1

    const/high16 v2, 0x40c00000    # 6.0f

    invoke-direct {p0, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v3

    invoke-direct {p0, p4}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result p4

    invoke-direct {p0, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v2

    invoke-virtual {p1, v1, v3, p4, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    goto :goto_0

    .line 661
    :cond_0
    new-instance p4, Landroid/view/View;

    invoke-direct {p4, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 662
    iget v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mDivider:I

    invoke-virtual {p4, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 663
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, 0x1

    invoke-direct {p0, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    const/4 v3, -0x1

    invoke-direct {v1, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p4, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 665
    :goto_0
    new-instance p4, Landroid/widget/LinearLayout;

    invoke-direct {p4, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    .line 666
    invoke-virtual {p4, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v2, 0x10

    .line 667
    invoke-virtual {p4, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/high16 v2, 0x41600000    # 14.0f

    .line 668
    invoke-direct {p0, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v3

    invoke-direct {p0, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v2

    invoke-virtual {p4, v1, v3, v1, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 669
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 670
    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 671
    iget p2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mText:I

    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 p2, 0x2

    const/high16 v3, 0x41800000    # 16.0f

    .line 672
    invoke-virtual {v2, p2, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    const/16 v4, 0x190

    .line 673
    invoke-direct {p0, v4}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->font(I)Landroid/graphics/Typeface;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 674
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x2

    invoke-direct {v5, v1, v6, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p4, v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 675
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 676
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 677
    iget p3, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSubText:I

    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 p3, 0x41700000    # 15.0f

    .line 678
    invoke-virtual {v0, p2, p3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 679
    invoke-direct {p0, v4}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->font(I)Landroid/graphics/Typeface;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    const p2, 0x800005

    .line 680
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setGravity(I)V

    .line 681
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const p3, 0x3f99999a    # 1.2f

    invoke-direct {p2, v1, v6, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 682
    invoke-direct {p0, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result p3

    iput p3, p2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 683
    invoke-virtual {p4, v0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 684
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object p0

    invoke-virtual {p1, p4, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method private runWork(Ljava/lang/String;Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 4

    .line 1388
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mLastTitle:Ljava/lang/String;

    .line 1389
    iput-object p2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mLastWork:Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;

    .line 1390
    iput-object p3, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mLastOk:Ljava/lang/String;

    .line 1391
    iput-object p4, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mLastNext:Ljava/lang/Runnable;

    .line 1392
    iget-boolean v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mNextReverse:Z

    iput-boolean v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mLastReverse:Z

    const/4 v0, 0x0

    .line 1393
    iput-boolean v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mOnMain:Z

    const/4 v0, 0x1

    .line 1394
    invoke-direct {p0, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->setBusy(Z)V

    .line 1395
    invoke-direct {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->newPage(Ljava/lang/String;)V

    .line 1396
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->card()Landroid/widget/LinearLayout;

    move-result-object p1

    const/4 v1, 0x3

    const/16 v2, 0xbe

    .line 1397
    invoke-direct {p0, p1, v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->anim(Landroid/widget/LinearLayout;II)Lcom/masterrom/sdstorage/SdAnimView;

    .line 1398
    const-string v1, "Bitte warten \u2026"

    const-string v2, "Please wait \u2026"

    invoke-direct {p0, v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->headline(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v1

    iput-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mWorkText:Landroid/widget/TextView;

    .line 1400
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mWorkPercent:Landroid/widget/TextView;

    .line 1401
    iget v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mAccent:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1402
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mWorkPercent:Landroid/widget/TextView;

    const/4 v2, 0x2

    const/high16 v3, 0x42080000    # 34.0f

    invoke-virtual {v1, v2, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 1403
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mWorkPercent:Landroid/widget/TextView;

    const/16 v2, 0x2bc

    invoke-direct {p0, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->font(I)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 1404
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mWorkPercent:Landroid/widget/TextView;

    const-string v2, "tnum"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setFontFeatureSettings(Ljava/lang/String;)V

    .line 1405
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mWorkPercent:Landroid/widget/TextView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1406
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mWorkPercent:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1407
    new-instance v1, Landroid/widget/ProgressBar;

    const/4 v2, 0x0

    const v3, 0x1010078

    invoke-direct {v1, p0, v2, v3}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 1408
    invoke-virtual {v1, v0}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    const/16 v0, 0x64

    .line 1409
    invoke-virtual {v1, v0}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 1410
    iget v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mAccent:I

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/ProgressBar;->setIndeterminateTintList(Landroid/content/res/ColorStateList;)V

    .line 1411
    iget v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mAccent:I

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/ProgressBar;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    .line 1412
    iget v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mDivider:I

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/ProgressBar;->setProgressBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 1413
    iput-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mWorkBar:Landroid/widget/ProgressBar;

    .line 1414
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v0

    const/high16 v2, 0x40c00000    # 6.0f

    .line 1415
    invoke-direct {p0, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v2

    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    const/high16 v2, 0x41400000    # 12.0f

    .line 1416
    invoke-direct {p0, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v2

    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 1417
    invoke-virtual {p1, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1418
    const-string v0, "Entferne die SD-Karte nicht und schalte das Ger\u00e4t nicht aus. Das Display bleibt dabei an."

    const-string v1, "Do not remove the SD card or turn off the device. The screen stays on meanwhile."

    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->body(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    .line 1420
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->animatePage()V

    .line 1422
    new-instance p1, Ljava/lang/Thread;

    new-instance v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$34;

    invoke-direct {v0, p0, p2, p4, p3}, Lcom/masterrom/sdstorage/SdStorageModeActivity$34;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;Ljava/lang/Runnable;Ljava/lang/String;)V

    const-string p0, "MasterROMSdStorage"

    invoke-direct {p1, v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 1440
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method private sectionLabel(Ljava/lang/String;)V
    .locals 4

    .line 621
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 622
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 623
    iget p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSubText:I

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 p1, 0x2

    const/high16 v1, 0x41600000    # 14.0f

    .line 624
    invoke-virtual {v0, p1, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    const/16 p1, 0x2bc

    .line 625
    invoke-direct {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->font(I)Landroid/graphics/Typeface;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    const/high16 p1, 0x41b00000    # 22.0f

    .line 626
    invoke-direct {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v1

    const/high16 v2, 0x41200000    # 10.0f

    invoke-direct {p0, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v2

    invoke-direct {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result p1

    const/high16 v3, 0x41000000    # 8.0f

    invoke-direct {p0, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v3

    invoke-virtual {v0, v1, v2, p1, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 627
    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mContent:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method private setBusy(Z)V
    .locals 3

    .line 1372
    iput-boolean p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBusy:Z

    .line 1373
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBack:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    if-eqz p1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/high16 v1, 0x3f800000    # 1.0f

    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0xc8

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 1374
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBack:Landroid/view/View;

    xor-int/lit8 v1, p1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    const/16 v0, 0x80

    if-eqz p1, :cond_1

    .line 1376
    invoke-virtual {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    goto :goto_1

    .line 1378
    :cond_1
    invoke-virtual {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/Window;->clearFlags(I)V

    .line 1380
    :goto_1
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->updateBackCallback()V

    return-void
.end method

.method private setProgressPercent(I)V
    .locals 2

    .line 1479
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mUi:Landroid/os/Handler;

    new-instance v1, Lcom/masterrom/sdstorage/SdStorageModeActivity$39;

    invoke-direct {v1, p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity$39;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private setProgressText(Ljava/lang/String;)V
    .locals 2

    const/4 v0, -0x1

    .line 1499
    invoke-direct {p0, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->setProgressPercent(I)V

    .line 1500
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mUi:Landroid/os/Handler;

    new-instance v1, Lcom/masterrom/sdstorage/SdStorageModeActivity$40;

    invoke-direct {v1, p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity$40;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private showGuardHint(Landroid/content/Intent;)V
    .locals 11

    if-eqz p1, :cond_3

    const/4 v0, 0x0

    .line 199
    const-string v1, "com.masterrom.sdstorage.FROM_GUARD"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 200
    :cond_0
    invoke-virtual {p1, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 201
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->findSdDisk()Landroid/os/storage/DiskInfo;

    move-result-object p1

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    .line 202
    invoke-direct {p0, p1, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->findVolume(Landroid/os/storage/DiskInfo;I)Landroid/os/storage/VolumeInfo;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_2

    return-void

    .line 204
    :cond_2
    const-string v1, "SD-Karte wird als interner Speicher genutzt"

    const-string v2, "SD card is used as internal storage"

    invoke-direct {p0, v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v1, "Eine App wollte die SD-Karte formatieren. Darauf liegen verschl\u00fcsselte Dateien und eventuell Apps \u2013 beim Formatieren w\u00e4ren sie verloren, deshalb wurde es verhindert.\n\nWenn du die Karte wieder als tragbaren Speicher nutzen willst, holt \u201eTragbar machen\u201c deine Dateien und Apps vorher in den internen Speicher zur\u00fcck."

    const-string v2, "An app tried to format the SD card. It holds encrypted files and possibly apps \u2013 formatting would have lost them, so it was prevented.\n\nIf you want to use the card as portable storage again, \"Make portable\" first moves your files and apps back to internal storage."

    .line 205
    invoke-direct {p0, v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v1, "Schlie\u00dfen"

    const-string v2, "Close"

    .line 213
    invoke-direct {p0, v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v1, "Tragbar machen"

    const-string v2, "Make portable"

    invoke-direct {p0, v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    new-instance v10, Lcom/masterrom/sdstorage/SdStorageModeActivity$3;

    invoke-direct {v10, p0, p1, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$3;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/DiskInfo;Landroid/os/storage/VolumeInfo;)V

    const/4 v6, 0x1

    const/4 v9, 0x0

    move-object v3, p0

    .line 204
    invoke-direct/range {v3 .. v10}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->showSheet(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;)V

    :cond_3
    :goto_1
    return-void
.end method

.method private showInternalReady()V
    .locals 15

    const/4 v0, 0x0

    .line 1152
    iput-boolean v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mOnMain:Z

    .line 1153
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mNewPrivate:Landroid/os/storage/VolumeInfo;

    .line 1154
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->findSdDisk()Landroid/os/storage/DiskInfo;

    move-result-object v2

    .line 1155
    const-string v3, "Bereit"

    const-string v4, "Ready"

    invoke-direct {p0, v3, v4}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->newPage(Ljava/lang/String;)V

    .line 1156
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->card()Landroid/widget/LinearLayout;

    move-result-object v5

    const/4 v6, 0x5

    const/16 v7, 0xaa

    .line 1157
    invoke-direct {p0, v5, v6, v7}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->anim(Landroid/widget/LinearLayout;II)Lcom/masterrom/sdstorage/SdAnimView;

    .line 1158
    const-string v6, "Interner Speicher eingerichtet"

    const-string v7, "Internal storage set up"

    invoke-direct {p0, v6, v7}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v5, v6}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->headline(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    .line 1159
    const-string v6, "Die SD-Karte ist jetzt verschl\u00fcsselt und Teil des internen Speichers. Sie ist nur noch in diesem Ger\u00e4t lesbar."

    const-string v7, "The SD card is now encrypted and part of internal storage. It can only be read on this device."

    invoke-direct {p0, v6, v7}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v5, v6}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->body(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    .line 1161
    const-string v6, "Verschl\u00fcsselt"

    const-string v7, "Encrypted"

    invoke-direct {p0, v6, v7}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "Eingebunden"

    const-string v8, "Mounted"

    invoke-direct {p0, v7, v8}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v3, v4}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    filled-new-array {v6, v7, v3}, [Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v5, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->chips(Landroid/widget/LinearLayout;[Ljava/lang/String;)V

    .line 1163
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->card()Landroid/widget/LinearLayout;

    move-result-object v3

    .line 1164
    const-string v4, "Nutzung"

    const-string v5, "Usage"

    invoke-direct {p0, v4, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "Interner Speicher"

    const-string v6, "Internal storage"

    invoke-direct {p0, v5, v6}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v3, v4, v5, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->row(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 1165
    const-string v0, "Verschl\u00fcsselung"

    const-string v4, "Encryption"

    invoke-direct {p0, v0, v4}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v4, "Ja, nur dieses Ger\u00e4t"

    const-string v5, "Yes, this device only"

    invoke-direct {p0, v4, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-direct {p0, v3, v0, v4, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->row(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)V

    if-eqz v2, :cond_0

    .line 1166
    iget-wide v6, v2, Landroid/os/storage/DiskInfo;->size:J

    const-wide/16 v8, 0x0

    cmp-long v0, v6, v8

    if-lez v0, :cond_0

    const-string v0, "Kapazit\u00e4t"

    const-string v4, "Capacity"

    invoke-direct {p0, v0, v4}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-wide v6, v2, Landroid/os/storage/DiskInfo;->size:J

    invoke-static {p0, v6, v7}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v3, v0, v2, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->row(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)V

    :cond_0
    if-eqz v1, :cond_2

    .line 1168
    invoke-virtual {v1}, Landroid/os/storage/VolumeInfo;->getFsUuid()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v1}, Landroid/os/storage/VolumeInfo;->getFsUuid()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSm:Landroid/os/storage/StorageManager;

    invoke-virtual {v2}, Landroid/os/storage/StorageManager;->getPrimaryStorageUuid()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 1170
    :cond_1
    const-string v0, "N\u00e4chster Schritt"

    const-string v2, "Next step"

    invoke-direct {p0, v0, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->sectionLabel(Ljava/lang/String;)V

    .line 1171
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->card()Landroid/widget/LinearLayout;

    move-result-object v0

    const/4 v2, 0x2

    const/16 v3, 0x82

    .line 1172
    invoke-direct {p0, v0, v2, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->anim(Landroid/widget/LinearLayout;II)Lcom/masterrom/sdstorage/SdAnimView;

    .line 1173
    const-string v2, "Dateien auf die SD-Karte verschieben?"

    const-string v3, "Move files to the SD card?"

    invoke-direct {p0, v2, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v0, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->headline(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    .line 1174
    const-string v2, "Fotos, Videos, Downloads, Musik und andere Dateien kommen auf die Karte, neue Fotos und Downloads landen danach automatisch dort. System und Apps bleiben im internen Speicher. Je nach Datenmenge dauert das einige Minuten \u2013 du kannst es auch sp\u00e4ter auf dieser Seite \u00e4ndern."

    const-string v3, "Photos, videos, downloads, music and other files go to the card, and new photos and downloads are stored there automatically. System and apps stay on internal storage. Depending on the amount of data this takes a few minutes \u2013 you can also change it later on this page."

    invoke-direct {p0, v2, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v0, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->body(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    .line 1180
    iget-object v4, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBottom:Landroid/widget/LinearLayout;

    const-string v0, "Sp\u00e4ter"

    const-string v2, "Later"

    invoke-direct {p0, v0, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    new-instance v8, Lcom/masterrom/sdstorage/SdStorageModeActivity$26;

    invoke-direct {v8, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$26;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v3, p0

    invoke-direct/range {v3 .. v8}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;ZZLandroid/view/View$OnClickListener;)Landroid/widget/TextView;

    .line 1183
    iget-object v10, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBottom:Landroid/widget/LinearLayout;

    const-string v0, "Dateien verschieben"

    const-string v2, "Move files"

    invoke-direct {p0, v0, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    new-instance v14, Lcom/masterrom/sdstorage/SdStorageModeActivity$27;

    invoke-direct {v14, p0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity$27;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/VolumeInfo;)V

    const/4 v12, 0x1

    const/4 v13, 0x0

    move-object v9, p0

    invoke-direct/range {v9 .. v14}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;ZZLandroid/view/View$OnClickListener;)Landroid/widget/TextView;

    goto :goto_0

    :cond_2
    if-nez v1, :cond_3

    .line 1190
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "Die Karte wird noch eingebunden. Dateien kannst du gleich auf dieser Seite verschieben."

    const-string v2, "The card is still being mounted. You can move files on this page in a moment."

    invoke-direct {p0, v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v3, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->body(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    .line 1193
    :cond_3
    iget-object v5, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBottom:Landroid/widget/LinearLayout;

    const-string v0, "Fertig"

    const-string v1, "Done"

    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    new-instance v9, Lcom/masterrom/sdstorage/SdStorageModeActivity$28;

    invoke-direct {v9, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$28;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V

    const/4 v7, 0x1

    const/4 v8, 0x0

    move-object v4, p0

    invoke-direct/range {v4 .. v9}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;ZZLandroid/view/View$OnClickListener;)Landroid/widget/TextView;

    .line 1197
    :goto_0
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->animatePage()V

    return-void
.end method

.method private showMain()V
    .locals 22

    move-object/from16 v7, p0

    const/4 v0, 0x1

    .line 836
    iput-boolean v0, v7, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mOnMain:Z

    .line 837
    invoke-direct/range {p0 .. p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->findSdDisk()Landroid/os/storage/DiskInfo;

    move-result-object v8

    const/16 v1, 0xb4

    .line 838
    const-string v9, "SD card"

    const-string v10, "SD-Karte"

    if-nez v8, :cond_0

    .line 839
    invoke-direct {v7, v10, v9}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v7, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->newPage(Ljava/lang/String;)V

    .line 840
    invoke-direct/range {p0 .. p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->card()Landroid/widget/LinearLayout;

    move-result-object v0

    const/4 v2, 0x4

    .line 841
    invoke-direct {v7, v0, v2, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->anim(Landroid/widget/LinearLayout;II)Lcom/masterrom/sdstorage/SdAnimView;

    .line 842
    const-string v1, "Keine SD-Karte eingelegt"

    const-string v2, "No SD card inserted"

    invoke-direct {v7, v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v7, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->headline(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    .line 843
    const-string v1, "Lege eine microSD-Karte ein. Danach kannst du hier w\u00e4hlen, ob sie als tragbarer Speicher oder als interner, verschl\u00fcsselter Speicher genutzt wird. Die Seite aktualisiert sich automatisch."

    const-string v2, "Insert a microSD card. You can then choose here whether it is used as portable storage or as encrypted internal storage. This page updates automatically."

    invoke-direct {v7, v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v7, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->body(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    .line 847
    invoke-direct/range {p0 .. p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->animatePage()V

    return-void

    .line 850
    :cond_0
    invoke-direct {v7, v8, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->findVolume(Landroid/os/storage/DiskInfo;I)Landroid/os/storage/VolumeInfo;

    move-result-object v11

    .line 851
    iget-wide v2, v8, Landroid/os/storage/DiskInfo;->size:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-lez v2, :cond_1

    iget-wide v2, v8, Landroid/os/storage/DiskInfo;->size:J

    invoke-static {v7, v2, v3}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_1
    const-string v2, "\u2013"

    .line 853
    :goto_0
    const-string v3, "Capacity"

    const-string v4, "Kapazit\u00e4t"

    const-string v5, "Encryption"

    const-string v6, "Verschl\u00fcsselung"

    const-string v12, "Portable storage"

    const-string v13, "Tragbarer Speicher"

    const-string v14, "Usage"

    const-string v15, "Nutzung"

    const-string v0, "Current state"

    const-string v1, "Aktueller Zustand"

    move-object/from16 v17, v8

    const-string v8, "Encrypted"

    move-object/from16 v18, v8

    const-string v8, "Verschl\u00fcsselt"

    move-object/from16 v19, v8

    if-eqz v11, :cond_2

    .line 854
    invoke-direct {v7, v10, v9}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->newPage(Ljava/lang/String;)V

    .line 855
    invoke-direct/range {p0 .. p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->card()Landroid/widget/LinearLayout;

    move-result-object v8

    move-object/from16 v20, v9

    move-object/from16 v21, v10

    const/16 v9, 0xb4

    const/4 v10, 0x1

    .line 856
    invoke-direct {v7, v8, v10, v9}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->anim(Landroid/widget/LinearLayout;II)Lcom/masterrom/sdstorage/SdAnimView;

    .line 857
    invoke-direct {v7, v13, v12}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->headline(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    .line 858
    const-string v9, "Die Karte wird wieder ein normaler, austauschbarer Speicher \u2013 ohne Verschl\u00fcsselung und auch in anderen Ger\u00e4ten, Kameras oder am PC lesbar. Apps und Dateien auf der Karte werden vorher automatisch in den internen Speicher verschoben, danach wird die Karte formatiert."

    const-string v10, "The card becomes normal removable storage again \u2013 without encryption and readable in other devices, cameras or on a PC. Apps and files on the card are moved to internal storage automatically first, then the card is formatted."

    invoke-direct {v7, v9, v10}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->body(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    .line 864
    const-string v9, "Austauschbar"

    const-string v10, "Removable"

    invoke-direct {v7, v9, v10}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "Am PC lesbar"

    const-string v12, "Readable on PC"

    invoke-direct {v7, v10, v12}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v12, "Unverschl\u00fcsselt"

    const-string v13, "Not encrypted"

    invoke-direct {v7, v12, v13}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    filled-new-array {v9, v10, v12}, [Ljava/lang/String;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->chips(Landroid/widget/LinearLayout;[Ljava/lang/String;)V

    .line 866
    invoke-direct {v7, v1, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v7, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->sectionLabel(Ljava/lang/String;)V

    .line 867
    invoke-direct/range {p0 .. p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->card()Landroid/widget/LinearLayout;

    move-result-object v0

    .line 868
    invoke-direct {v7, v15, v14}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v8, "Interner Speicher"

    const-string v9, "Internal storage"

    invoke-direct {v7, v8, v9}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-direct {v7, v0, v1, v8, v9}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->row(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 869
    invoke-direct {v7, v6, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v5, "Ja, nur dieses Ger\u00e4t"

    const-string v6, "Yes, this device only"

    invoke-direct {v7, v5, v6}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    invoke-direct {v7, v0, v1, v5, v6}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->row(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 870
    const-string v1, "Dateien gespeichert auf"

    const-string v5, "Files stored on"

    invoke-direct {v7, v1, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v7, v11}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->currentFileLocation(Landroid/os/storage/VolumeInfo;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v7, v0, v1, v5, v6}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->row(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 871
    invoke-direct {v7, v4, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v7, v0, v1, v2, v6}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->row(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 873
    const-string v0, "Speicherort f\u00fcr Dateien"

    const-string v1, "Location for files"

    invoke-direct {v7, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v7, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->sectionLabel(Ljava/lang/String;)V

    .line 874
    invoke-direct/range {p0 .. p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->card()Landroid/widget/LinearLayout;

    move-result-object v0

    const/4 v1, 0x2

    const/16 v2, 0x82

    .line 875
    invoke-direct {v7, v0, v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->anim(Landroid/widget/LinearLayout;II)Lcom/masterrom/sdstorage/SdAnimView;

    .line 876
    const-string v1, "W\u00e4hle, wo Fotos, Videos, Downloads, Musik und andere Dateien gespeichert werden. Vorhandene Dateien werden mit verschoben. System und Apps bleiben im internen Speicher."

    const-string v2, "Choose where photos, videos, downloads, music and other files are stored. Existing files are moved along. System and apps stay on internal storage."

    invoke-direct {v7, v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v7, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->body(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    .line 880
    invoke-direct {v7, v11}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->filesOnSd(Landroid/os/storage/VolumeInfo;)Z

    move-result v8

    .line 881
    new-instance v9, Landroid/widget/LinearLayout;

    invoke-direct {v9, v7}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    .line 882
    invoke-virtual {v9, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 883
    invoke-direct/range {p0 .. p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    const/high16 v2, 0x41800000    # 16.0f

    .line 884
    invoke-direct {v7, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 885
    invoke-virtual {v0, v9, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 886
    const-string v0, "Intern"

    const-string v1, "Internal"

    invoke-direct {v7, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v0, "Ger\u00e4tespeicher"

    const-string v1, "Device storage"

    invoke-direct {v7, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    xor-int/lit8 v5, v8, 0x1

    new-instance v6, Lcom/masterrom/sdstorage/SdStorageModeActivity$17;

    invoke-direct {v6, v7, v8, v11}, Lcom/masterrom/sdstorage/SdStorageModeActivity$17;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;ZLandroid/os/storage/VolumeInfo;)V

    const/4 v2, 0x0

    move-object/from16 v0, p0

    move-object v1, v9

    invoke-direct/range {v0 .. v6}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->tile(Landroid/widget/LinearLayout;ILjava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;)V

    move-object/from16 v10, v20

    move-object/from16 v0, v21

    .line 888
    invoke-direct {v7, v0, v10}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-direct {v7, v1, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v6, Lcom/masterrom/sdstorage/SdStorageModeActivity$18;

    invoke-direct {v6, v7, v8, v11}, Lcom/masterrom/sdstorage/SdStorageModeActivity$18;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;ZLandroid/os/storage/VolumeInfo;)V

    const/4 v2, 0x1

    move-object/from16 v0, p0

    move-object v1, v9

    move v5, v8

    invoke-direct/range {v0 .. v6}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->tile(Landroid/widget/LinearLayout;ILjava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;)V

    .line 891
    iget-object v1, v7, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBottom:Landroid/widget/LinearLayout;

    const-string v0, "Tragbar machen"

    const-string v2, "Make portable"

    invoke-direct {v7, v0, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v5, Lcom/masterrom/sdstorage/SdStorageModeActivity$19;

    move-object/from16 v8, v17

    invoke-direct {v5, v7, v8, v11}, Lcom/masterrom/sdstorage/SdStorageModeActivity$19;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/DiskInfo;Landroid/os/storage/VolumeInfo;)V

    const/4 v3, 0x1

    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;ZZLandroid/view/View$OnClickListener;)Landroid/widget/TextView;

    goto/16 :goto_1

    :cond_2
    move-object v8, v10

    move-object/from16 v11, v19

    move-object v10, v9

    move-object/from16 v9, v18

    .line 895
    invoke-direct {v7, v8, v10}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->newPage(Ljava/lang/String;)V

    .line 896
    invoke-direct/range {p0 .. p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->card()Landroid/widget/LinearLayout;

    move-result-object v8

    move-object/from16 v16, v2

    const/4 v2, 0x0

    const/16 v10, 0xb4

    .line 897
    invoke-direct {v7, v8, v2, v10}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->anim(Landroid/widget/LinearLayout;II)Lcom/masterrom/sdstorage/SdAnimView;

    .line 898
    const-string v2, "Interner, verschl\u00fcsselter Speicher"

    const-string v10, "Encrypted internal storage"

    invoke-direct {v7, v2, v10}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v7, v8, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->headline(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    .line 899
    const-string v2, "Die Karte wird formatiert, verschl\u00fcsselt und als Erweiterung des internen Speichers genutzt. Danach kannst du Fotos, Downloads und andere Dateien \u2013 und unterst\u00fctzte Apps \u2013 auf der Karte speichern. Die Karte ist anschlie\u00dfend nur noch in diesem Ger\u00e4t lesbar."

    const-string v10, "The card is formatted, encrypted and used as an extension of internal storage. You can then store photos, downloads and other files \u2013 and supported apps \u2013 on the card. Afterwards the card can only be read on this device."

    invoke-direct {v7, v2, v10}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v7, v8, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->body(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    .line 905
    invoke-direct {v7, v11, v9}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v9, "Mehr Speicher"

    const-string v10, "More storage"

    invoke-direct {v7, v9, v10}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "Nur dieses Ger\u00e4t"

    const-string v11, "This device only"

    invoke-direct {v7, v10, v11}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    filled-new-array {v2, v9, v10}, [Ljava/lang/String;

    move-result-object v2

    invoke-direct {v7, v8, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->chips(Landroid/widget/LinearLayout;[Ljava/lang/String;)V

    .line 907
    invoke-direct {v7, v1, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v7, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->sectionLabel(Ljava/lang/String;)V

    .line 908
    invoke-direct/range {p0 .. p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->card()Landroid/widget/LinearLayout;

    move-result-object v0

    .line 909
    invoke-direct {v7, v15, v14}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v7, v13, v12}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v8, 0x0

    invoke-direct {v7, v0, v1, v2, v8}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->row(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 910
    invoke-direct {v7, v6, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Nein"

    const-string v5, "No"

    invoke-direct {v7, v2, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x1

    invoke-direct {v7, v0, v1, v2, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->row(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 911
    invoke-direct {v7, v4, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v2, v16

    invoke-direct {v7, v0, v1, v2, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->row(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 913
    invoke-direct/range {p0 .. p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->card()Landroid/widget/LinearLayout;

    move-result-object v0

    .line 914
    const-string v1, "Gut zu wissen"

    const-string v2, "Good to know"

    invoke-direct {v7, v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v7, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->headline(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    .line 915
    const-string v1, "\u2022 Alle Daten, die jetzt auf der Karte sind, werden gel\u00f6scht \u2013 sichere sie vorher.\n\u2022 Nimm die Karte danach nicht mehr einfach heraus, sie ist Teil des Speichers.\n\u2022 Du kannst die Karte hier jederzeit wieder tragbar machen."

    const-string v2, "\u2022 All data currently on the card is erased \u2013 back it up first.\n\u2022 Do not simply remove the card afterwards, it is part of the storage.\n\u2022 You can make the card portable again here at any time."

    invoke-direct {v7, v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v7, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->body(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    .line 922
    iget-object v1, v7, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBottom:Landroid/widget/LinearLayout;

    const-string v0, "Als intern einrichten"

    const-string v2, "Set up as internal"

    invoke-direct {v7, v0, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v5, Lcom/masterrom/sdstorage/SdStorageModeActivity$20;

    move-object/from16 v0, v17

    invoke-direct {v5, v7, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$20;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/DiskInfo;)V

    const/4 v3, 0x1

    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;ZZLandroid/view/View$OnClickListener;)Landroid/widget/TextView;

    .line 926
    :goto_1
    invoke-direct/range {p0 .. p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->animatePage()V

    return-void
.end method

.method private showResult(ZLjava/lang/String;)V
    .locals 10

    const/4 v0, 0x0

    .line 1444
    iput-boolean v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mOnMain:Z

    .line 1445
    const-string v6, "Done"

    const-string v7, "Fertig"

    if-eqz p1, :cond_0

    invoke-direct {p0, v7, v6}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, "Fehler"

    const-string v1, "Error"

    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-direct {p0, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->newPage(Ljava/lang/String;)V

    .line 1446
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->card()Landroid/widget/LinearLayout;

    move-result-object v0

    if-eqz p1, :cond_1

    const/4 v1, 0x5

    goto :goto_1

    :cond_1
    const/4 v1, 0x7

    :goto_1
    const/16 v2, 0xaa

    .line 1447
    invoke-direct {p0, v0, v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->anim(Landroid/widget/LinearLayout;II)Lcom/masterrom/sdstorage/SdAnimView;

    if-eqz p1, :cond_2

    .line 1448
    const-string v1, "Alles erledigt"

    const-string v2, "All done"

    goto :goto_2

    :cond_2
    const-string v1, "Das hat nicht geklappt"

    const-string v2, "That didn\'t work"

    :goto_2
    invoke-direct {p0, v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->headline(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    .line 1449
    invoke-direct {p0, v0, p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->body(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    if-eqz p1, :cond_3

    .line 1451
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBottom:Landroid/widget/LinearLayout;

    const-string v0, "Zur\u00fcck zur \u00dcbersicht"

    const-string v2, "Back to overview"

    invoke-direct {p0, v0, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v5, Lcom/masterrom/sdstorage/SdStorageModeActivity$35;

    invoke-direct {v5, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$35;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;ZZLandroid/view/View$OnClickListener;)Landroid/widget/TextView;

    .line 1454
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBottom:Landroid/widget/LinearLayout;

    invoke-direct {p0, v7, v6}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v5, Lcom/masterrom/sdstorage/SdStorageModeActivity$36;

    invoke-direct {v5, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$36;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V

    const/4 v3, 0x1

    invoke-direct/range {v0 .. v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;ZZLandroid/view/View$OnClickListener;)Landroid/widget/TextView;

    goto :goto_3

    .line 1458
    :cond_3
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBottom:Landroid/widget/LinearLayout;

    const-string v0, "Zur\u00fcck"

    const-string v2, "Back"

    invoke-direct {p0, v0, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v5, Lcom/masterrom/sdstorage/SdStorageModeActivity$37;

    invoke-direct {v5, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$37;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;ZZLandroid/view/View$OnClickListener;)Landroid/widget/TextView;

    .line 1461
    iget-object v4, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mLastWork:Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;

    if-eqz v4, :cond_4

    .line 1462
    iget-object v3, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mLastTitle:Ljava/lang/String;

    .line 1464
    iget-object v5, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mLastOk:Ljava/lang/String;

    .line 1465
    iget-object v6, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mLastNext:Ljava/lang/Runnable;

    .line 1466
    iget-boolean v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mLastReverse:Z

    .line 1467
    iget-object v7, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBottom:Landroid/widget/LinearLayout;

    const-string v0, "Erneut versuchen"

    const-string v1, "Try again"

    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Lcom/masterrom/sdstorage/SdStorageModeActivity$38;

    move-object v0, v9

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/masterrom/sdstorage/SdStorageModeActivity$38;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;ZLjava/lang/String;Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;Ljava/lang/String;Ljava/lang/Runnable;)V

    const/4 v3, 0x1

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, v7

    move-object v2, v8

    move-object v5, v9

    invoke-direct/range {v0 .. v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;ZZLandroid/view/View$OnClickListener;)Landroid/widget/TextView;

    .line 1474
    :cond_4
    :goto_3
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->animatePage()V

    return-void
.end method

.method private showSheet(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;)V
    .locals 6

    const/4 v0, 0x0

    .line 741
    iput-boolean v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mOnMain:Z

    .line 742
    const-string v1, "Best\u00e4tigen"

    const-string v2, "Confirm"

    invoke-direct {p0, v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->newPage(Ljava/lang/String;)V

    .line 743
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->card()Landroid/widget/LinearLayout;

    move-result-object v1

    if-ltz p3, :cond_0

    move v0, p3

    :cond_0
    const/16 v2, 0xaa

    .line 744
    invoke-direct {p0, v1, v0, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->anim(Landroid/widget/LinearLayout;II)Lcom/masterrom/sdstorage/SdAnimView;

    .line 745
    invoke-direct {p0, v1, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->headline(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    .line 746
    invoke-direct {p0, v1, p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->body(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    if-eqz p6, :cond_1

    .line 748
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->card()Landroid/widget/LinearLayout;

    move-result-object v0

    .line 749
    const-string v1, "Dieser Schritt l\u00e4sst sich nicht r\u00fcckg\u00e4ngig machen."

    const-string v2, "This step cannot be undone."

    invoke-direct {p0, v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->body(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v0

    .line 751
    iget v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mError:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 v1, 0x258

    .line 752
    invoke-direct {p0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->font(I)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 754
    :cond_1
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBottom:Landroid/widget/LinearLayout;

    new-instance v5, Lcom/masterrom/sdstorage/SdStorageModeActivity$13;

    invoke-direct {v5, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$13;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v2, p4

    invoke-direct/range {v0 .. v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;ZZLandroid/view/View$OnClickListener;)Landroid/widget/TextView;

    .line 757
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBottom:Landroid/widget/LinearLayout;

    new-instance v5, Lcom/masterrom/sdstorage/SdStorageModeActivity$14;

    invoke-direct {v5, p0, p7}, Lcom/masterrom/sdstorage/SdStorageModeActivity$14;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/Runnable;)V

    const/4 v3, 0x1

    move-object v2, p5

    move v4, p6

    invoke-direct/range {v0 .. v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;ZZLandroid/view/View$OnClickListener;)Landroid/widget/TextView;

    const/4 v0, 0x1

    .line 766
    iput-boolean v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSheetShown:Z

    const/4 v0, 0x0

    .line 767
    iput-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSheetCancel:Ljava/lang/Runnable;

    .line 768
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->updateBackCallback()V

    .line 769
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->animatePage()V

    return-void
.end method

.method private snapAppBar()V
    .locals 4

    .line 521
    iget-boolean v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mTouching:Z

    if-eqz v0, :cond_0

    return-void

    .line 522
    :cond_0
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->expandRange()I

    move-result v0

    .line 523
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mScroll:Landroid/widget/ScrollView;

    invoke-virtual {v1}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v1

    if-lez v1, :cond_2

    if-ge v1, v0, :cond_2

    .line 524
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mScroll:Landroid/widget/ScrollView;

    div-int/lit8 v2, v0, 0x2

    const/4 v3, 0x0

    if-ge v1, v2, :cond_1

    move v0, v3

    :cond_1
    invoke-virtual {p0, v3, v0}, Landroid/widget/ScrollView;->smoothScrollTo(II)V

    :cond_2
    return-void
.end method

.method private t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 267
    iget-boolean p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mDe:Z

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    move-object p1, p2

    :goto_0
    return-object p1
.end method

.method private tile(Landroid/widget/LinearLayout;ILjava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;)V
    .locals 15

    move-object v0, p0

    move/from16 v1, p5

    .line 931
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x1

    .line 932
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v4, 0x41800000    # 16.0f

    .line 933
    invoke-direct {p0, v4}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v5

    const/high16 v6, 0x41600000    # 14.0f

    invoke-direct {p0, v6}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v7

    invoke-direct {p0, v4}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v8

    invoke-direct {p0, v6}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v6

    invoke-virtual {v2, v5, v7, v8, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 934
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/high16 v6, 0x41a00000    # 20.0f

    .line 935
    invoke-direct {p0, v6}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    if-eqz v1, :cond_1

    .line 936
    iget v6, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mAccent:I

    iget-boolean v7, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mNight:Z

    if-eqz v7, :cond_0

    const/16 v7, 0x33

    goto :goto_0

    :cond_0
    const/16 v7, 0x1f

    goto :goto_0

    :cond_1
    iget v6, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mText:I

    iget-boolean v7, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mNight:Z

    if-eqz v7, :cond_2

    const/16 v7, 0xf

    goto :goto_0

    :cond_2
    const/16 v7, 0x8

    :goto_0
    invoke-static {v6, v7}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->withAlpha(II)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v6, 0x40000000    # 2.0f

    const/high16 v7, 0x3f800000    # 1.0f

    if-eqz v1, :cond_3

    move v8, v6

    goto :goto_1

    :cond_3
    move v8, v7

    .line 937
    :goto_1
    invoke-direct {p0, v8}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v8

    if-eqz v1, :cond_4

    iget v9, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mAccent:I

    goto :goto_2

    :cond_4
    iget v9, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mDivider:I

    :goto_2
    invoke-virtual {v5, v8, v9}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 938
    new-instance v8, Landroid/graphics/drawable/RippleDrawable;

    iget v9, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mAccent:I

    const/16 v10, 0x2a

    invoke-static {v9, v10}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->withAlpha(II)I

    move-result v9

    invoke-static {v9}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v9

    const/4 v10, 0x0

    invoke-direct {v8, v9, v5, v10}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v2, v8}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 939
    new-instance v8, Landroid/widget/LinearLayout;

    invoke-direct {v8, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v9, 0x0

    .line 940
    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v10, 0x10

    .line 941
    invoke-virtual {v8, v10}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 942
    new-instance v10, Lcom/masterrom/sdstorage/SdGlyphView;

    if-eqz v1, :cond_5

    iget v11, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mAccent:I

    goto :goto_3

    :cond_5
    iget v11, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSubText:I

    :goto_3
    move/from16 v12, p2

    invoke-direct {v10, p0, v12, v11}, Lcom/masterrom/sdstorage/SdGlyphView;-><init>(Landroid/content/Context;II)V

    .line 943
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v12, 0x41e00000    # 28.0f

    invoke-direct {p0, v12}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v13

    invoke-direct {p0, v12}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v12

    invoke-direct {v11, v13, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v10, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 944
    new-instance v10, Landroid/view/View;

    invoke-direct {v10, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 945
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v11, v9, v3, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v8, v10, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 946
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 947
    const-string v10, "\u2713"

    invoke-virtual {v3, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 v10, 0x11

    .line 948
    invoke-virtual {v3, v10}, Landroid/widget/TextView;->setGravity(I)V

    .line 949
    iget v10, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mOnAccent:I

    invoke-virtual {v3, v10}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 v10, 0x2

    const/high16 v11, 0x41500000    # 13.0f

    .line 950
    invoke-virtual {v3, v10, v11}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 951
    sget-object v12, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v3, v12}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 952
    iget v12, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mAccent:I

    const/high16 v13, 0x41300000    # 11.0f

    invoke-direct {p0, v12, v13}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->pill(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v12

    invoke-virtual {v3, v12}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    if-eqz v1, :cond_6

    move v12, v9

    goto :goto_4

    :cond_6
    const/4 v12, 0x4

    .line 953
    :goto_4
    invoke-virtual {v3, v12}, Landroid/widget/TextView;->setVisibility(I)V

    .line 954
    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v13, 0x41b00000    # 22.0f

    invoke-direct {p0, v13}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v14

    invoke-direct {p0, v13}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v13

    invoke-direct {v12, v14, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v3, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 955
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    invoke-virtual {v2, v8, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 956
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    move-object/from16 v8, p3

    .line 957
    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz v1, :cond_7

    .line 958
    iget v8, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mAccent:I

    goto :goto_5

    :cond_7
    iget v8, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mText:I

    :goto_5
    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 959
    invoke-virtual {v3, v10, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 960
    sget-object v4, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    const/16 v8, 0x258

    invoke-static {v4, v8, v9}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    const/high16 v4, 0x41400000    # 12.0f

    .line 961
    invoke-direct {p0, v4}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v4

    invoke-direct {p0, v6}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v6

    invoke-virtual {v3, v9, v4, v9, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 962
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 963
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    move-object/from16 v4, p4

    .line 964
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 965
    iget v4, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSubText:I

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 966
    invoke-virtual {v3, v10, v11}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 967
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 968
    new-instance v3, Lcom/masterrom/sdstorage/SdStorageModeActivity$21;

    move-object/from16 v4, p6

    invoke-direct {v3, p0, v1, v5, v4}, Lcom/masterrom/sdstorage/SdStorageModeActivity$21;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;ZLandroid/graphics/drawable/GradientDrawable;Ljava/lang/Runnable;)V

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 981
    invoke-direct {p0, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->addPress(Landroid/view/View;)V

    .line 982
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v1, v9, v3, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 983
    invoke-virtual/range {p1 .. p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    if-lez v3, :cond_8

    const/high16 v3, 0x41200000    # 10.0f

    invoke-direct {p0, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->dp(F)I

    move-result v0

    iput v0, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    :cond_8
    move-object/from16 v0, p1

    .line 984
    invoke-virtual {v0, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method private toPortable(Landroid/os/storage/DiskInfo;Landroid/os/storage/VolumeInfo;)V
    .locals 11

    .line 1244
    invoke-virtual {p2}, Landroid/os/storage/VolumeInfo;->getFsUuid()Ljava/lang/String;

    move-result-object v6

    .line 1245
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1246
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1247
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mPm:Landroid/content/pm/PackageManager;

    const/high16 v1, 0x400000

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getInstalledApplications(I)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ApplicationInfo;

    if-eqz v6, :cond_0

    .line 1248
    iget-object v2, v1, Landroid/content/pm/ApplicationInfo;->volumeUuid:Ljava/lang/String;

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-interface {v3, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1249
    iget-object v2, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1250
    iget-object v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mPm:Landroid/content/pm/PackageManager;

    invoke-virtual {v1, v2}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    if-eqz v6, :cond_2

    .line 1253
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSm:Landroid/os/storage/StorageManager;

    invoke-virtual {v1}, Landroid/os/storage/StorageManager;->getPrimaryStorageUuid()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v1, 0x1

    move v8, v1

    goto :goto_1

    :cond_2
    move v8, v0

    .line 1255
    :goto_1
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz v8, :cond_3

    .line 1257
    const-string v1, "\u2022 Fotos, Downloads und andere Dateien werden zur\u00fcck in den internen Speicher verschoben.\n"

    const-string v2, "\u2022 Photos, downloads and other files are moved back to internal storage.\n"

    invoke-direct {p0, v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1260
    :cond_3
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v1

    const/16 v2, 0xa

    if-nez v1, :cond_6

    .line 1261
    const-string v1, "\u2022 Diese Apps werden zur\u00fcck in den internen Speicher verschoben: "

    const-string v5, "\u2022 These apps are moved back to internal storage: "

    invoke-direct {p0, v1, v5}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1263
    :goto_2
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_5

    if-lez v0, :cond_4

    const-string v1, ", "

    goto :goto_3

    :cond_4
    const-string v1, ""

    :goto_3
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 1264
    :cond_5
    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1266
    :cond_6
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_7

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1267
    :cond_7
    const-string v0, "Danach wird die SD-Karte formatiert und alle restlichen Daten darauf gel\u00f6scht. Sie ist dann nicht mehr verschl\u00fcsselt und auch in anderen Ger\u00e4ten lesbar."

    const-string v1, "The SD card is then formatted and all remaining data on it is erased. It is no longer encrypted and can be read on other devices."

    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1272
    new-instance v10, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    move-object v0, v10

    move-object v1, p0

    move v2, v8

    move-object v5, p1

    invoke-direct/range {v0 .. v6}, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;ZLjava/util/List;Ljava/util/List;Landroid/os/storage/DiskInfo;Ljava/lang/String;)V

    .line 1304
    const-string v0, "SD-Karte wieder tragbar machen?"

    const-string v1, "Make SD card portable again?"

    invoke-direct {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v0, "Abbrechen"

    const-string v3, "Cancel"

    .line 1305
    invoke-direct {p0, v0, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v0, "Fortfahren"

    const-string v3, "Continue"

    invoke-direct {p0, v0, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    new-instance v9, Lcom/masterrom/sdstorage/SdStorageModeActivity$33;

    invoke-direct {v9, p0, v8, v10}, Lcom/masterrom/sdstorage/SdStorageModeActivity$33;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;ZLjava/lang/Runnable;)V

    const/4 v3, 0x1

    const/4 v6, 0x1

    move-object v0, p0

    move-object v7, v9

    .line 1304
    invoke-direct/range {v0 .. v7}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->showSheet(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;)V

    return-void
.end method

.method private unlockUser(I)V
    .locals 5

    .line 1078
    const-string v0, "MasterROMSdStorage"

    :try_start_0
    const-class v1, Landroid/app/ActivityManager;

    invoke-virtual {p0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager;

    .line 1079
    invoke-virtual {v1, p1}, Landroid/app/ActivityManager;->isUserRunning(I)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {p1}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/ActivityManager;->startProfile(Landroid/os/UserHandle;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    .line 1081
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "startProfile "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1084
    :cond_0
    :goto_0
    :try_start_1
    const-class v1, Landroid/app/KeyguardManager;

    invoke-virtual {p0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/KeyguardManager;

    .line 1085
    const-string v2, "Sicheren Ordner entsperren"

    const-string v3, "Unlock Secure Folder"

    .line 1086
    invoke-direct {p0, v2, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "Zum Verschieben der Dateien"

    const-string v4, "To move your files"

    .line 1087
    invoke-direct {p0, v3, v4}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1085
    invoke-virtual {v1, v2, v3, p1}, Landroid/app/KeyguardManager;->createConfirmDeviceCredentialIntent(Ljava/lang/CharSequence;Ljava/lang/CharSequence;I)Landroid/content/Intent;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 1089
    invoke-virtual {p0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-void

    :catchall_1
    move-exception v1

    .line 1093
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "confirm credential "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1096
    :cond_1
    :try_start_2
    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mPm:Landroid/content/pm/PackageManager;

    const-string v1, "com.samsung.knox.securefolder"

    invoke-virtual {p1, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    if-eqz p1, :cond_2

    const/high16 v1, 0x10000000

    .line 1098
    invoke-virtual {p1, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1099
    invoke-virtual {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    return-void

    :catchall_2
    move-exception p1

    .line 1103
    const-string v1, "open Secure Folder"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1105
    :cond_2
    const-string p1, "Bitte \u00f6ffne den Sicheren Ordner und entsperre ihn."

    const-string v0, "Please open Secure Folder and unlock it."

    invoke-direct {p0, p1, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    .line 1106
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method private unmountQuietly(Landroid/os/storage/VolumeInfo;)V
    .locals 3

    if-eqz p1, :cond_3

    .line 1316
    invoke-virtual {p1}, Landroid/os/storage/VolumeInfo;->getState()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    goto :goto_2

    .line 1317
    :cond_0
    invoke-virtual {p1}, Landroid/os/storage/VolumeInfo;->getId()Ljava/lang/String;

    move-result-object p1

    .line 1319
    :try_start_0
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSm:Landroid/os/storage/StorageManager;

    invoke-virtual {v0, p1}, Landroid/os/storage/StorageManager;->unmount(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0x28

    if-ge v0, v1, :cond_2

    .line 1325
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSm:Landroid/os/storage/StorageManager;

    invoke-virtual {v1, p1}, Landroid/os/storage/StorageManager;->findVolumeById(Ljava/lang/String;)Landroid/os/storage/VolumeInfo;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 1326
    invoke-virtual {v1}, Landroid/os/storage/VolumeInfo;->getState()I

    move-result v1

    if-nez v1, :cond_1

    goto :goto_1

    :cond_1
    const-wide/16 v1, 0xfa

    .line 1327
    :try_start_1
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :catch_0
    :cond_2
    :goto_1
    return-void

    :catchall_0
    move-exception p0

    .line 1321
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "unmount "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "MasterROMSdStorage"

    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_3
    :goto_2
    return-void
.end method

.method private updateBackCallback()V
    .locals 3

    .line 783
    iget-boolean v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBusy:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSheetShown:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 785
    :goto_1
    :try_start_0
    invoke-virtual {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->getOnBackInvokedDispatcher()Landroid/window/OnBackInvokedDispatcher;

    move-result-object v1

    if-eqz v0, :cond_2

    .line 786
    iget-object v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBackCb:Landroid/window/OnBackInvokedCallback;

    if-nez v2, :cond_2

    .line 787
    new-instance v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$15;

    invoke-direct {v0, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$15;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V

    iput-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBackCb:Landroid/window/OnBackInvokedCallback;

    const p0, 0xf4240

    .line 788
    invoke-interface {v1, p0, v0}, Landroid/window/OnBackInvokedDispatcher;->registerOnBackInvokedCallback(ILandroid/window/OnBackInvokedCallback;)V

    goto :goto_2

    :cond_2
    if-nez v0, :cond_3

    .line 789
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBackCb:Landroid/window/OnBackInvokedCallback;

    if-eqz v0, :cond_3

    .line 790
    invoke-interface {v1, v0}, Landroid/window/OnBackInvokedDispatcher;->unregisterOnBackInvokedCallback(Landroid/window/OnBackInvokedCallback;)V

    const/4 v0, 0x0

    .line 791
    iput-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBackCb:Landroid/window/OnBackInvokedCallback;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception p0

    .line 794
    const-string v0, "MasterROMSdStorage"

    const-string v1, "back dispatcher"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_3
    :goto_2
    return-void
.end method

.method private userLabel(Landroid/content/pm/UserInfo;)Ljava/lang/String;
    .locals 3

    .line 1005
    :try_start_0
    invoke-virtual {p1}, Landroid/content/pm/UserInfo;->isSecureFolder()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_2

    .line 1006
    iget v0, p1, Landroid/content/pm/UserInfo;->id:I

    const/16 v1, 0x96

    if-lt v0, v1, :cond_0

    iget v0, p1, Landroid/content/pm/UserInfo;->id:I

    const/16 v1, 0xa0

    if-gt v0, v1, :cond_0

    goto :goto_2

    .line 1007
    :cond_0
    iget-object v0, p1, Landroid/content/pm/UserInfo;->name:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object p0, p1, Landroid/content/pm/UserInfo;->name:Ljava/lang/String;

    goto :goto_1

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Benutzer "

    const-string v2, "User "

    invoke-direct {p0, v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p1, Landroid/content/pm/UserInfo;->id:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_1
    return-object p0

    .line 1006
    :cond_2
    :goto_2
    const-string p1, "Sicherer Ordner"

    const-string v0, "Secure Folder"

    invoke-direct {p0, p1, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private waitMove(I)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 1333
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/32 v2, 0x36ee80

    add-long/2addr v0, v2

    .line 1334
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    cmp-long v2, v2, v0

    if-gez v2, :cond_2

    .line 1335
    iget-object v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mPm:Landroid/content/pm/PackageManager;

    invoke-virtual {v2, p1}, Landroid/content/pm/PackageManager;->getMoveStatus(I)I

    move-result v2

    const/16 v3, -0x64

    if-ne v2, v3, :cond_0

    const/16 p1, 0x64

    .line 1336
    invoke-direct {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->setProgressPercent(I)V

    const/4 p0, 0x0

    return-object p0

    :cond_0
    if-gez v2, :cond_1

    .line 1337
    invoke-direct {p0, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->moveError(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 1338
    :cond_1
    invoke-direct {p0, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->setProgressPercent(I)V

    const-wide/16 v2, 0x1f4

    .line 1339
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    goto :goto_0

    .line 1341
    :cond_2
    const-string p1, "Zeit\u00fcberschreitung beim Verschieben."

    const-string v0, "Move timed out."

    invoke-direct {p0, p1, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private waitPrivateMounted(Ljava/lang/String;)Landroid/os/storage/VolumeInfo;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0x78

    if-ge v0, v1, :cond_2

    .line 1136
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSm:Landroid/os/storage/StorageManager;

    invoke-virtual {v1}, Landroid/os/storage/StorageManager;->getVolumes()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 1138
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/storage/VolumeInfo;

    if-eqz v2, :cond_0

    .line 1139
    invoke-virtual {v2}, Landroid/os/storage/VolumeInfo;->getType()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    invoke-virtual {v2}, Landroid/os/storage/VolumeInfo;->getDiskId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1140
    invoke-virtual {v2}, Landroid/os/storage/VolumeInfo;->getState()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_0

    return-object v2

    :cond_1
    const-wide/16 v1, 0x1f4

    .line 1145
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method private static withAlpha(II)I
    .locals 1

    const v0, 0xffffff

    and-int/2addr p0, v0

    const/16 v0, 0xff

    .line 277
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    const/4 v0, 0x0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    shl-int/lit8 p1, p1, 0x18

    or-int/2addr p0, p1

    return p0
.end method


# virtual methods
.method public onBackPressed()V
    .locals 1

    .line 252
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->handleBack()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 253
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 145
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 146
    const-class p1, Landroid/os/storage/StorageManager;

    invoke-virtual {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/storage/StorageManager;

    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSm:Landroid/os/storage/StorageManager;

    .line 147
    invoke-virtual {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mPm:Landroid/content/pm/PackageManager;

    .line 148
    const-class p1, Landroid/os/UserManager;

    invoke-virtual {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/UserManager;

    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mUm:Landroid/os/UserManager;

    .line 149
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mUi:Landroid/os/Handler;

    .line 150
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p1

    const-string v0, "de"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mDe:Z

    .line 151
    invoke-virtual {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    iget p1, p1, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 p1, p1, 0x30

    const/16 v0, 0x20

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mNight:Z

    .line 153
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->loadColors()V

    .line 154
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->buildFrame()V

    .line 155
    invoke-virtual {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->resumeMove(Landroid/content/Intent;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 156
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->showMain()V

    .line 157
    invoke-virtual {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->showGuardHint(Landroid/content/Intent;)V

    .line 159
    :cond_1
    :try_start_0
    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSm:Landroid/os/storage/StorageManager;

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mListener:Landroid/os/storage/StorageEventListener;

    invoke-virtual {p1, p0}, Landroid/os/storage/StorageManager;->registerListener(Landroid/os/storage/StorageEventListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    const-string p1, "MasterROMSdStorage"

    const-string v0, "registerListener"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .line 245
    :try_start_0
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mSm:Landroid/os/storage/StorageManager;

    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mListener:Landroid/os/storage/StorageEventListener;

    invoke-virtual {v0, v1}, Landroid/os/storage/StorageManager;->unregisterListener(Landroid/os/storage/StorageEventListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 246
    :catchall_0
    iget v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mPageId:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mPageId:I

    .line 247
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 2

    .line 184
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    .line 185
    invoke-virtual {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->setIntent(Landroid/content/Intent;)V

    .line 188
    iget-boolean v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity;->mBusy:Z

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->resumeMove(Landroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "com.masterrom.sdstorage.FROM_GUARD"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 189
    invoke-direct {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->showMain()V

    .line 190
    invoke-direct {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->showGuardHint(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

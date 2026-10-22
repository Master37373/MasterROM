.class Lcom/masterrom/sdstorage/SdStorageModeActivity$20;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity;->tile(Landroid/widget/LinearLayout;ILjava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

.field final synthetic val$bg:Landroid/graphics/drawable/GradientDrawable;

.field final synthetic val$onPick:Ljava/lang/Runnable;

.field final synthetic val$selected:Z


# direct methods
.method constructor <init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;ZLandroid/graphics/drawable/GradientDrawable;Ljava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 937
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$20;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iput-boolean p2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$20;->val$selected:Z

    iput-object p3, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$20;->val$bg:Landroid/graphics/drawable/GradientDrawable;

    iput-object p4, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$20;->val$onPick:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 939
    iget-boolean p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$20;->val$selected:Z

    if-eqz p1, :cond_0

    return-void

    .line 941
    :cond_0
    new-instance p1, Landroid/animation/ArgbEvaluator;

    invoke-direct {p1}, Landroid/animation/ArgbEvaluator;-><init>()V

    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$20;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$2600(Lcom/masterrom/sdstorage/SdStorageModeActivity;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$20;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$2700(Lcom/masterrom/sdstorage/SdStorageModeActivity;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v0, v1}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/animation/ValueAnimator;->ofObject(Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/ValueAnimator;

    move-result-object p1

    const-wide/16 v0, 0xdc

    .line 942
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 943
    new-instance v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$20$1;

    invoke-direct {v0, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$20$1;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity$20;)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 946
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 947
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$20;->val$onPick:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

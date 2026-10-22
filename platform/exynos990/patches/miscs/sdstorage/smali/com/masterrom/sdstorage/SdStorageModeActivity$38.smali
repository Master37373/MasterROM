.class Lcom/masterrom/sdstorage/SdStorageModeActivity$38;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity;->setProgressPercent(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

.field final synthetic val$percent:I


# direct methods
.method constructor <init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1448
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$38;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iput p2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$38;->val$percent:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1449
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$38;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$4600(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/widget/TextView;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$38;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$4700(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/widget/ProgressBar;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$38;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$2100(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$38;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-virtual {v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_0

    .line 1450
    :cond_0
    iget v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$38;->val$percent:I

    const/4 v1, 0x1

    if-gez v0, :cond_1

    .line 1451
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$38;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$4600(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/widget/TextView;

    move-result-object v0

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1452
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$38;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$4700(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/widget/ProgressBar;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    return-void

    :cond_1
    const/16 v2, 0x64

    .line 1455
    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 1456
    iget-object v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$38;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$4600(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/TextView;->getVisibility()I

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_2

    .line 1457
    iget-object v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$38;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$4600(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/widget/TextView;

    move-result-object v2

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setAlpha(F)V

    .line 1458
    iget-object v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$38;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$4600(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1459
    iget-object v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$38;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$4600(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/TextView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v2, v4}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    const-wide/16 v4, 0xdc

    invoke-virtual {v2, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 1461
    :cond_2
    iget-object v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$38;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$4600(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/widget/TextView;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " %"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1462
    iget-object v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$38;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$4700(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/widget/ProgressBar;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/ProgressBar;->isIndeterminate()Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$38;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$4700(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/widget/ProgressBar;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 1463
    :cond_3
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$38;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$4700(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/widget/ProgressBar;

    move-result-object p0

    invoke-virtual {p0, v0, v1}, Landroid/widget/ProgressBar;->setProgress(IZ)V

    :cond_4
    :goto_0
    return-void
.end method

.class Lcom/masterrom/sdstorage/SdStorageModeActivity$20$1;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity$20;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$20;


# direct methods
.method constructor <init>(Lcom/masterrom/sdstorage/SdStorageModeActivity$20;)V
    .locals 0

    .line 943
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$20$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$20;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 944
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$20$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$20;

    iget-object v0, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$20;->val$bg:Landroid/graphics/drawable/GradientDrawable;

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$20$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$20;

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$20;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {p0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$2800(Lcom/masterrom/sdstorage/SdStorageModeActivity;F)I

    move-result p0

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v0, p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    return-void
.end method

.class Lcom/masterrom/sdstorage/SdStorageModeActivity$8;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity;->buildFrame()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;


# direct methods
.method constructor <init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V
    .locals 0

    .line 439
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$8;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3

    .line 441
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    const/4 p2, 0x1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 442
    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$8;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p1, p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$1202(Lcom/masterrom/sdstorage/SdStorageModeActivity;Z)Z

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$8;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p0, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$1302(Lcom/masterrom/sdstorage/SdStorageModeActivity;Z)Z

    goto :goto_0

    :cond_0
    if-eq p1, p2, :cond_1

    const/4 p2, 0x3

    if-ne p1, p2, :cond_2

    .line 444
    :cond_1
    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$8;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p1, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$1202(Lcom/masterrom/sdstorage/SdStorageModeActivity;Z)Z

    .line 445
    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$8;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$1100(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/widget/ScrollView;

    move-result-object p1

    iget-object p2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$8;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$1000(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Ljava/lang/Runnable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/ScrollView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 446
    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$8;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$1100(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/widget/ScrollView;

    move-result-object p1

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$8;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$1000(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Ljava/lang/Runnable;

    move-result-object p0

    const-wide/16 v1, 0x5a

    invoke-virtual {p1, p0, v1, v2}, Landroid/widget/ScrollView;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_2
    :goto_0
    return v0
.end method

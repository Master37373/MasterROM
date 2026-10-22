.class Lcom/masterrom/sdstorage/SdStorageModeActivity$23$1;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity$23;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$23;


# direct methods
.method constructor <init>(Lcom/masterrom/sdstorage/SdStorageModeActivity$23;)V
    .locals 0

    .line 1033
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$23$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$23;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1035
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$23$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$23;

    iget v0, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$23;->val$page:I

    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$23$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$23;

    iget-object v1, v1, Lcom/masterrom/sdstorage/SdStorageModeActivity$23;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$3000(Lcom/masterrom/sdstorage/SdStorageModeActivity;)I

    move-result v1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$23$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$23;

    iget-object v0, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$23;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-virtual {v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$23$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$23;

    iget-object v0, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$23;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-virtual {v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$23$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$23;

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$23;->val$action:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void
.end method

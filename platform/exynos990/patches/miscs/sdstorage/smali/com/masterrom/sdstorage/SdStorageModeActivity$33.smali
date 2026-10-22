.class Lcom/masterrom/sdstorage/SdStorageModeActivity$33;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity;->runWork(Ljava/lang/String;Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;Ljava/lang/String;Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

.field final synthetic val$next:Ljava/lang/Runnable;

.field final synthetic val$okMessage:Ljava/lang/String;

.field final synthetic val$work:Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;


# direct methods
.method constructor <init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;Ljava/lang/Runnable;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1391
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$33;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iput-object p2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$33;->val$work:Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;

    iput-object p3, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$33;->val$next:Ljava/lang/Runnable;

    iput-object p4, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$33;->val$okMessage:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1394
    :try_start_0
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$33;->val$work:Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;

    invoke-interface {v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;->run()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 1396
    const-string v1, "MasterROMSdStorage"

    const-string v2, "SD storage mode switch failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1397
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    :cond_0
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1400
    :goto_0
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$33;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$3200(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Lcom/masterrom/sdstorage/SdStorageModeActivity$33$1;

    invoke-direct {v2, p0, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$33$1;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity$33;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

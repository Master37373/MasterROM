.class Lcom/masterrom/sdstorage/SdStorageModeActivity$33;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity;->toPortable(Landroid/os/storage/DiskInfo;Landroid/os/storage/VolumeInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

.field final synthetic val$doIt:Ljava/lang/Runnable;

.field final synthetic val$primaryOnSd:Z


# direct methods
.method constructor <init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;ZLjava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1306
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$33;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iput-boolean p2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$33;->val$primaryOnSd:Z

    iput-object p3, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$33;->val$doIt:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1307
    iget-boolean v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$33;->val$primaryOnSd:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$33;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$33;->val$doIt:Ljava/lang/Runnable;

    invoke-static {v0, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$4100(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/Runnable;)V

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$33;->val$doIt:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :goto_0
    return-void
.end method

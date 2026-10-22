.class Lcom/masterrom/sdstorage/SdStorageModeActivity$29$1;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity$29;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$29;


# direct methods
.method constructor <init>(Lcom/masterrom/sdstorage/SdStorageModeActivity$29;)V
    .locals 0

    .line 1212
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$29$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$29;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1213
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$29$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$29;

    iget-boolean v0, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$29;->val$wantSd:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$29$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$29;

    iget-object v0, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$29;->val$priv:Landroid/os/storage/VolumeInfo;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$29$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$29;

    iget-object v0, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$29;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$3300(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/os/storage/StorageManager;

    move-result-object v0

    const-string v1, "private"

    invoke-virtual {v0, v1}, Landroid/os/storage/StorageManager;->findVolumeById(Ljava/lang/String;)Landroid/os/storage/VolumeInfo;

    move-result-object v0

    .line 1214
    :goto_0
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$29$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$29;

    iget-object v1, v1, Lcom/masterrom/sdstorage/SdStorageModeActivity$29;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$29$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$29;

    iget-boolean p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$29;->val$wantSd:Z

    invoke-static {v1, v0, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$4000(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/VolumeInfo;Z)V

    return-void
.end method

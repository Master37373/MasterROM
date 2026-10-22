.class Lcom/masterrom/sdstorage/SdStorageModeActivity$2;
.super Landroid/os/storage/StorageEventListener;
.source "SdStorageModeActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity;
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

    .line 137
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$2;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-direct {p0}, Landroid/os/storage/StorageEventListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onDiskDestroyed(Landroid/os/storage/DiskInfo;)V
    .locals 0

    .line 140
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$2;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$100(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V

    return-void
.end method

.method public onDiskScanned(Landroid/os/storage/DiskInfo;I)V
    .locals 0

    .line 139
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$2;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$100(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V

    return-void
.end method

.method public onVolumeStateChanged(Landroid/os/storage/VolumeInfo;II)V
    .locals 0

    .line 138
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$2;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$100(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V

    return-void
.end method

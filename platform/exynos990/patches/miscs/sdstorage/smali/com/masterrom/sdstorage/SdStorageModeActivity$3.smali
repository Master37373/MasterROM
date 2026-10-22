.class Lcom/masterrom/sdstorage/SdStorageModeActivity$3;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity;->showGuardHint(Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

.field final synthetic val$disk:Landroid/os/storage/DiskInfo;

.field final synthetic val$priv:Landroid/os/storage/VolumeInfo;


# direct methods
.method constructor <init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/DiskInfo;Landroid/os/storage/VolumeInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 214
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$3;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iput-object p2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$3;->val$disk:Landroid/os/storage/DiskInfo;

    iput-object p3, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$3;->val$priv:Landroid/os/storage/VolumeInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 214
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$3;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$3;->val$disk:Landroid/os/storage/DiskInfo;

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$3;->val$priv:Landroid/os/storage/VolumeInfo;

    invoke-static {v0, v1, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$200(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/DiskInfo;Landroid/os/storage/VolumeInfo;)V

    return-void
.end method

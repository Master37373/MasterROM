.class Lcom/masterrom/sdstorage/SdStorageModeActivity$18;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity;->showMain()V
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

    .line 860
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$18;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iput-object p2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$18;->val$disk:Landroid/os/storage/DiskInfo;

    iput-object p3, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$18;->val$priv:Landroid/os/storage/VolumeInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 861
    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$18;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$18;->val$disk:Landroid/os/storage/DiskInfo;

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$18;->val$priv:Landroid/os/storage/VolumeInfo;

    invoke-static {p1, v0, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$2400(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/DiskInfo;Landroid/os/storage/VolumeInfo;)V

    return-void
.end method

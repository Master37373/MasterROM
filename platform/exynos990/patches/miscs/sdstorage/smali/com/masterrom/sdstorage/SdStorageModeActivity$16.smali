.class Lcom/masterrom/sdstorage/SdStorageModeActivity$16;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


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

.field final synthetic val$onSd:Z

.field final synthetic val$priv:Landroid/os/storage/VolumeInfo;


# direct methods
.method constructor <init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;ZLandroid/os/storage/VolumeInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 856
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$16;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iput-boolean p2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$16;->val$onSd:Z

    iput-object p3, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$16;->val$priv:Landroid/os/storage/VolumeInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 856
    iget-boolean v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$16;->val$onSd:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$16;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$16;->val$priv:Landroid/os/storage/VolumeInfo;

    const/4 v1, 0x0

    invoke-static {v0, p0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$2300(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/VolumeInfo;Z)V

    :cond_0
    return-void
.end method

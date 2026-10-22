.class Lcom/masterrom/sdstorage/SdStorageModeActivity$26;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity;->showInternalReady()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

.field final synthetic val$target:Landroid/os/storage/VolumeInfo;


# direct methods
.method constructor <init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/VolumeInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1152
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$26;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iput-object p2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$26;->val$target:Landroid/os/storage/VolumeInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1154
    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$26;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    new-instance v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$26$1;

    invoke-direct {v0, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$26$1;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity$26;)V

    invoke-static {p1, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$4100(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/Runnable;)V

    return-void
.end method

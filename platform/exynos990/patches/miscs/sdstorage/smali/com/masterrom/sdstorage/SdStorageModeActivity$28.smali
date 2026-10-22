.class Lcom/masterrom/sdstorage/SdStorageModeActivity$28;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity;->confirmFileLocation(Landroid/os/storage/VolumeInfo;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

.field final synthetic val$priv:Landroid/os/storage/VolumeInfo;

.field final synthetic val$wantSd:Z


# direct methods
.method constructor <init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;ZLandroid/os/storage/VolumeInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1180
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$28;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iput-boolean p2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$28;->val$wantSd:Z

    iput-object p3, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$28;->val$priv:Landroid/os/storage/VolumeInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1181
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$28;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    new-instance v1, Lcom/masterrom/sdstorage/SdStorageModeActivity$28$1;

    invoke-direct {v1, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$28$1;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity$28;)V

    invoke-static {v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$4100(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/Runnable;)V

    return-void
.end method

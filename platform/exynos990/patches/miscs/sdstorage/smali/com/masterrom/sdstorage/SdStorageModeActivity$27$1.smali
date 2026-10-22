.class Lcom/masterrom/sdstorage/SdStorageModeActivity$27$1;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity$27;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$27;


# direct methods
.method constructor <init>(Lcom/masterrom/sdstorage/SdStorageModeActivity$27;)V
    .locals 0

    .line 1185
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$27$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$27;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1185
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$27$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$27;

    iget-object v0, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$27;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$27$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$27;

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$27;->val$target:Landroid/os/storage/VolumeInfo;

    const/4 v1, 0x1

    invoke-static {v0, p0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$4000(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/VolumeInfo;Z)V

    return-void
.end method

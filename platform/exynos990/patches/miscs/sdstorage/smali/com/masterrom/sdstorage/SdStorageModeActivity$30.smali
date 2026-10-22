.class Lcom/masterrom/sdstorage/SdStorageModeActivity$30;
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


# direct methods
.method constructor <init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V
    .locals 0

    .line 1218
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$30;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1218
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$30;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$2200(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$30;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$2300(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V

    :cond_0
    return-void
.end method

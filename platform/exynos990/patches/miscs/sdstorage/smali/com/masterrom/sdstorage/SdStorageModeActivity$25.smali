.class Lcom/masterrom/sdstorage/SdStorageModeActivity$25;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity;->confirmToInternal(Landroid/os/storage/DiskInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

.field final synthetic val$diskId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1117
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$25;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iput-object p2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$25;->val$diskId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1118
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$25;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    const-string v1, "Einrichten"

    const-string v2, "Setting up"

    invoke-static {v0, v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$300(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/masterrom/sdstorage/SdStorageModeActivity$25$1;

    invoke-direct {v2, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$25$1;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity$25;)V

    new-instance v3, Lcom/masterrom/sdstorage/SdStorageModeActivity$25$2;

    invoke-direct {v3, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$25$2;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity$25;)V

    const/4 p0, 0x0

    invoke-static {v0, v1, v2, p0, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$3900(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

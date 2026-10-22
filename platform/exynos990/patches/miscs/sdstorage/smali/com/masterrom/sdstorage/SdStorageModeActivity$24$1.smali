.class Lcom/masterrom/sdstorage/SdStorageModeActivity$24$1;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity$24;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$24;


# direct methods
.method constructor <init>(Lcom/masterrom/sdstorage/SdStorageModeActivity$24;)V
    .locals 0

    .line 1087
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$24$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$24;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1089
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$24$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$24;

    iget-object v0, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$24;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$24$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$24;

    iget-object v1, v1, Lcom/masterrom/sdstorage/SdStorageModeActivity$24;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    const-string v2, "Karte wird sicher ausgeh\u00e4ngt \u2026"

    const-string v3, "Safely unmounting the card \u2026"

    invoke-static {v1, v2, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$200(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$300(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;)V

    .line 1090
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$24$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$24;

    iget-object v0, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$24;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$3300(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/os/storage/StorageManager;

    move-result-object v0

    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$24$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$24;

    iget-object v1, v1, Lcom/masterrom/sdstorage/SdStorageModeActivity$24;->val$diskId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/os/storage/StorageManager;->findDiskById(Ljava/lang/String;)Landroid/os/storage/DiskInfo;

    move-result-object v0

    .line 1091
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$24$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$24;

    iget-object v1, v1, Lcom/masterrom/sdstorage/SdStorageModeActivity$24;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iget-object v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$24$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$24;

    iget-object v2, v2, Lcom/masterrom/sdstorage/SdStorageModeActivity$24;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    const/4 v3, 0x0

    invoke-static {v2, v0, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$3400(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/DiskInfo;I)Landroid/os/storage/VolumeInfo;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$3500(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/VolumeInfo;)V

    .line 1092
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$24$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$24;

    iget-object v0, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$24;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$24$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$24;

    iget-object v1, v1, Lcom/masterrom/sdstorage/SdStorageModeActivity$24;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    const-string v2, "Karte wird formatiert und verschl\u00fcsselt \u2026"

    const-string v3, "Formatting and encrypting the card \u2026"

    invoke-static {v1, v2, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$200(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$300(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;)V

    .line 1093
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$24$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$24;

    iget-object v0, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$24;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$3300(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/os/storage/StorageManager;

    move-result-object v0

    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$24$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$24;

    iget-object v1, v1, Lcom/masterrom/sdstorage/SdStorageModeActivity$24;->val$diskId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/os/storage/StorageManager;->partitionPrivate(Ljava/lang/String;)V

    .line 1094
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$24$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$24;

    iget-object v0, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$24;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$24$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$24;

    iget-object v1, v1, Lcom/masterrom/sdstorage/SdStorageModeActivity$24;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    const-string v2, "Karte wird eingebunden \u2026"

    const-string v3, "Mounting the card \u2026"

    invoke-static {v1, v2, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$200(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$300(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;)V

    .line 1095
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$24$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$24;

    iget-object v0, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$24;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$24$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$24;

    iget-object v1, v1, Lcom/masterrom/sdstorage/SdStorageModeActivity$24;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$24$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$24;

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$24;->val$diskId:Ljava/lang/String;

    invoke-static {v1, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$3700(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;)Landroid/os/storage/VolumeInfo;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$3602(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/VolumeInfo;)Landroid/os/storage/VolumeInfo;

    const/4 p0, 0x0

    return-object p0
.end method

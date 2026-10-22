.class Lcom/masterrom/sdstorage/SdStorageModeActivity$32;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity;->toPortable(Landroid/os/storage/DiskInfo;Landroid/os/storage/VolumeInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

.field final synthetic val$disk:Landroid/os/storage/DiskInfo;

.field final synthetic val$fsUuid:Ljava/lang/String;

.field final synthetic val$labels:Ljava/util/List;

.field final synthetic val$pkgs:Ljava/util/List;

.field final synthetic val$primaryOnSd:Z


# direct methods
.method constructor <init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;ZLjava/util/List;Ljava/util/List;Landroid/os/storage/DiskInfo;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1272
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iput-boolean p2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->val$primaryOnSd:Z

    iput-object p3, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->val$pkgs:Ljava/util/List;

    iput-object p4, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->val$labels:Ljava/util/List;

    iput-object p5, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->val$disk:Landroid/os/storage/DiskInfo;

    iput-object p6, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->val$fsUuid:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1273
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iget-boolean v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->val$primaryOnSd:Z

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->val$pkgs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    invoke-static {v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$4302(Lcom/masterrom/sdstorage/SdStorageModeActivity;Z)Z

    .line 1274
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    const-string v1, "Tragbar machen"

    const-string v2, "Make portable"

    invoke-static {v0, v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$300(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;

    invoke-direct {v2, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity$32;)V

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    const-string v3, "Die SD-Karte ist jetzt wieder ein tragbarer Speicher \u2013 ohne Verschl\u00fcsselung und auch in anderen Ger\u00e4ten lesbar."

    const-string v4, "The SD card is portable storage again \u2013 without encryption and readable on other devices."

    .line 1300
    invoke-static {p0, v3, v4}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$300(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 v3, 0x0

    .line 1274
    invoke-static {v0, v1, v2, p0, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$3900(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

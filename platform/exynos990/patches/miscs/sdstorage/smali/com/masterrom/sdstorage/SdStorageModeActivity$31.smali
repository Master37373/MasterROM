.class Lcom/masterrom/sdstorage/SdStorageModeActivity$31;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity;->moveFiles(Landroid/os/storage/VolumeInfo;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

.field final synthetic val$target:Landroid/os/storage/VolumeInfo;

.field final synthetic val$toSd:Z


# direct methods
.method constructor <init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/VolumeInfo;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1224
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$31;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iput-object p2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$31;->val$target:Landroid/os/storage/VolumeInfo;

    iput-boolean p3, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$31;->val$toSd:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1226
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$31;->val$target:Landroid/os/storage/VolumeInfo;

    if-nez v0, :cond_0

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$31;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    const-string v0, "Speicher nicht gefunden."

    const-string v1, "Storage not found."

    invoke-static {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$300(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 1227
    :cond_0
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$31;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iget-boolean v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$31;->val$toSd:Z

    if-eqz v1, :cond_1

    const-string v1, "Fotos, Downloads und andere Dateien kommen auf die SD-Karte \u2026"

    const-string v2, "Photos, downloads and other files are moving to the SD card \u2026"

    invoke-static {v0, v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$300(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 1229
    :cond_1
    const-string v1, "Fotos, Downloads und andere Dateien kommen in den internen Speicher \u2026"

    const-string v2, "Photos, downloads and other files are moving to internal storage \u2026"

    invoke-static {v0, v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$300(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1227
    :goto_0
    invoke-static {v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$400(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;)V

    .line 1231
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$31;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$4200(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/content/pm/PackageManager;

    move-result-object v1

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$31;->val$target:Landroid/os/storage/VolumeInfo;

    invoke-virtual {v1, p0}, Landroid/content/pm/PackageManager;->movePrimaryStorage(Landroid/os/storage/VolumeInfo;)I

    move-result p0

    invoke-static {v0, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$500(Lcom/masterrom/sdstorage/SdStorageModeActivity;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.class Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;


# direct methods
.method constructor <init>(Lcom/masterrom/sdstorage/SdStorageModeActivity$32;)V
    .locals 0

    .line 1274
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1275
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object v0, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$3300(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/os/storage/StorageManager;

    move-result-object v0

    const-string v1, "private"

    invoke-virtual {v0, v1}, Landroid/os/storage/StorageManager;->findVolumeById(Ljava/lang/String;)Landroid/os/storage/VolumeInfo;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1276
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    const-string v0, "Interner Speicher nicht gefunden."

    const-string v1, "Internal storage not found."

    invoke-static {p0, v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$300(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 1277
    :cond_0
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-boolean v1, v1, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->val$primaryOnSd:Z

    if-eqz v1, :cond_1

    .line 1278
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object v1, v1, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iget-object v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object v2, v2, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    const-string v3, "Dateien werden in den internen Speicher verschoben \u2026"

    const-string v4, "Moving files to internal storage \u2026"

    invoke-static {v2, v3, v4}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$300(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$400(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;)V

    .line 1279
    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object v1, v1, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iget-object v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object v2, v2, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$4200(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/pm/PackageManager;->movePrimaryStorage(Landroid/os/storage/VolumeInfo;)I

    move-result v2

    invoke-static {v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$500(Lcom/masterrom/sdstorage/SdStorageModeActivity;I)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    return-object v1

    :cond_1
    const/4 v1, 0x0

    .line 1282
    :goto_0
    iget-object v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object v2, v2, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->val$pkgs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 1283
    iget-object v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object v2, v2, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object v4, v4, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    const-string v5, "App wird verschoben: "

    const-string v6, "Moving app: "

    invoke-static {v4, v5, v6}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$300(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object v4, v4, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->val$labels:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v1, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "/"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object v5, v5, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->val$pkgs:Ljava/util/List;

    .line 1284
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ")"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1283
    invoke-static {v2, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$400(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;)V

    .line 1285
    iget-object v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object v2, v2, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iget-object v3, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object v3, v3, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$4200(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/content/pm/PackageManager;

    move-result-object v3

    iget-object v5, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object v5, v5, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->val$pkgs:Ljava/util/List;

    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v3, v5, v0}, Landroid/content/pm/PackageManager;->movePackage(Ljava/lang/String;Landroid/os/storage/VolumeInfo;)I

    move-result v3

    invoke-static {v2, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$500(Lcom/masterrom/sdstorage/SdStorageModeActivity;I)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 1286
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->val$labels:Ljava/util/List;

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ": "

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    move v1, v4

    goto/16 :goto_0

    .line 1288
    :cond_3
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object v0, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object v1, v1, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    const-string v2, "Karte wird sicher ausgeh\u00e4ngt \u2026"

    const-string v3, "Safely unmounting the card \u2026"

    invoke-static {v1, v2, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$300(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$400(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;)V

    .line 1289
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object v0, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object v1, v1, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iget-object v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object v2, v2, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->val$disk:Landroid/os/storage/DiskInfo;

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$3400(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/DiskInfo;I)Landroid/os/storage/VolumeInfo;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$3500(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/VolumeInfo;)V

    .line 1290
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object v0, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object v1, v1, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    const-string v2, "SD-Karte wird formatiert \u2026"

    const-string v3, "Formatting SD card \u2026"

    invoke-static {v1, v2, v3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$300(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$400(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;)V

    .line 1291
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object v0, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$3300(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/os/storage/StorageManager;

    move-result-object v0

    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object v1, v1, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->val$disk:Landroid/os/storage/DiskInfo;

    invoke-virtual {v1}, Landroid/os/storage/DiskInfo;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/storage/StorageManager;->partitionPublic(Ljava/lang/String;)V

    .line 1292
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object v0, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->val$fsUuid:Ljava/lang/String;

    if-eqz v0, :cond_4

    .line 1294
    :try_start_0
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object v0, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$3300(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/os/storage/StorageManager;

    move-result-object v0

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$32;

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$32;->val$fsUuid:Ljava/lang/String;

    invoke-virtual {v0, p0}, Landroid/os/storage/StorageManager;->forgetVolume(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    .line 1296
    const-string v0, "MasterROMSdStorage"

    const-string v1, "forgetVolume failed"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_4
    :goto_1
    const/4 p0, 0x0

    return-object p0
.end method

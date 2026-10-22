.class public final Lcom/masterrom/storageguard/AdoptedSdGuard;
.super Ljava/lang/Object;
.source "AdoptedSdGuard.java"


# static fields
.field private static final EXTRA_FROM_GUARD:Ljava/lang/String; = "com.masterrom.sdstorage.FROM_GUARD"

.field private static final ROOT_UID:I = 0x0

.field private static final SHELL_UID:I = 0x7d0

.field private static final SYSTEM_UID:I = 0x3e8

.field private static final TAG:Ljava/lang/String; = "MasterROMSdGuard"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static check(Ljava/lang/String;)V
    .locals 11

    .line 34
    const-string v0, "MasterROMSdGuard"

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v1

    .line 35
    invoke-static {v1}, Landroid/os/UserHandle;->getAppId(I)I

    move-result v2

    const/16 v3, 0x3e8

    if-eq v2, v3, :cond_7

    if-eqz v2, :cond_7

    const/16 v3, 0x7d0

    if-ne v2, v3, :cond_0

    goto/16 :goto_4

    .line 39
    :cond_0
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v2

    const/4 v4, 0x0

    .line 41
    :try_start_0
    invoke-static {}, Landroid/app/ActivityThread;->currentActivityThread()Landroid/app/ActivityThread;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/ActivityThread;->getSystemContext()Landroid/app/ContextImpl;

    move-result-object v5

    .line 42
    const-class v6, Landroid/os/storage/StorageManager;

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/os/storage/StorageManager;

    if-eqz p0, :cond_2

    .line 44
    const-string v7, "disk:"

    invoke-virtual {p0, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 45
    invoke-virtual {v6, p0}, Landroid/os/storage/StorageManager;->findVolumeById(Ljava/lang/String;)Landroid/os/storage/VolumeInfo;

    move-result-object v7

    if-eqz v7, :cond_1

    .line 46
    invoke-virtual {v7}, Landroid/os/storage/VolumeInfo;->getDiskId()Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    :cond_1
    const/4 v7, 0x0

    goto :goto_0

    :cond_2
    move-object v7, p0

    :goto_0
    const/4 v8, 0x1

    if-eqz v7, :cond_4

    .line 49
    invoke-virtual {v6}, Landroid/os/storage/StorageManager;->getVolumes()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/os/storage/VolumeInfo;

    .line 50
    invoke-virtual {v9}, Landroid/os/storage/VolumeInfo;->getType()I

    move-result v10

    if-ne v10, v8, :cond_3

    invoke-virtual {v9}, Landroid/os/storage/VolumeInfo;->getDiskId()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    move v6, v8

    goto :goto_1

    :cond_4
    move v6, v4

    :goto_1
    if-eqz v6, :cond_5

    .line 57
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "uid "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " tried to format/repartition "

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " (SD card used as internal storage); refused, opening the SD card page"

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 60
    const-string v7, "com.android.settings"

    const-string v9, "com.masterrom.sdstorage.SdStorageModeActivity"

    invoke-virtual {v1, v7, v9}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 61
    const-string v7, "com.masterrom.sdstorage.FROM_GUARD"

    invoke-virtual {v1, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const/high16 v7, 0x10000000

    .line 62
    invoke-virtual {v1, v7}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 64
    :try_start_1
    sget-object v7, Landroid/os/UserHandle;->CURRENT:Landroid/os/UserHandle;

    invoke-virtual {v5, v1, v7}, Landroid/content/Context;->startActivityAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception v1

    .line 66
    :try_start_2
    const-string v5, "could not open the SD card page"

    invoke-static {v0, v5, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 74
    :cond_5
    :goto_2
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    move v4, v6

    goto :goto_3

    :catchall_1
    move-exception v1

    .line 71
    :try_start_3
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "check "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 74
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    :goto_3
    if-nez v4, :cond_6

    return-void

    .line 78
    :cond_6
    new-instance p0, Ljava/lang/SecurityException;

    const-string v0, "This SD card is used as internal storage. Change it in Settings > SD card (MasterROM)."

    invoke-direct {p0, v0}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw p0

    :catchall_2
    move-exception p0

    .line 74
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 75
    throw p0

    :cond_7
    :goto_4
    return-void
.end method

package com.masterrom.storageguard;

import android.app.ActivityThread;
import android.content.Context;
import android.content.Intent;
import android.os.Binder;
import android.os.UserHandle;
import android.os.storage.StorageManager;
import android.os.storage.VolumeInfo;
import android.util.Log;

/**
 * MasterROM: lives in services.jar and runs at the start of StorageManagerService.format(),
 * partitionPublic(), partitionPrivate() and partitionMixed().
 *
 * An SD card used as internal storage (adopted) holds encrypted data and possibly apps. Apps
 * such as My Files can format it with one tap, which loses all of that. Only the system
 * (Settings with the SD card page, factory reset), root and the shell may change such a card;
 * any other caller is refused and the SD card page in Settings opens with an explanation.
 * Portable cards are not affected. My Files itself is not modified, so app updates keep this.
 */
public final class AdoptedSdGuard {
    private static final String TAG = "MasterROMSdGuard";
    private static final int ROOT_UID = 0;
    private static final int SYSTEM_UID = 1000;
    private static final int SHELL_UID = 2000;
    /** read by SdStorageModeActivity */
    private static final String EXTRA_FROM_GUARD = "com.masterrom.sdstorage.FROM_GUARD";

    private AdoptedSdGuard() { }

    /** @param id disk id ("disk:179,0") or volume id ("private:179,2", "public:179,1") */
    public static void check(String id) {
        final int uid = Binder.getCallingUid();
        final int appId = UserHandle.getAppId(uid);
        if (appId == SYSTEM_UID || appId == ROOT_UID || appId == SHELL_UID) return;

        boolean adopted = false;
        final long token = Binder.clearCallingIdentity();
        try {
            Context ctx = ActivityThread.currentActivityThread().getSystemContext();
            StorageManager sm = ctx.getSystemService(StorageManager.class);
            String diskId = id;
            if (id != null && !id.startsWith("disk:")) {
                VolumeInfo vol = sm.findVolumeById(id);
                diskId = vol != null ? vol.getDiskId() : null;
            }
            if (diskId != null) {
                for (VolumeInfo v : sm.getVolumes()) {
                    if (v.getType() == VolumeInfo.TYPE_PRIVATE && diskId.equals(v.getDiskId())) {
                        adopted = true;
                        break;
                    }
                }
            }
            if (adopted) {
                Log.w(TAG, "uid " + uid + " tried to format/repartition " + id
                        + " (SD card used as internal storage); refused, opening the SD card page");
                Intent i = new Intent();
                i.setClassName("com.android.settings", "com.masterrom.sdstorage.SdStorageModeActivity");
                i.putExtra(EXTRA_FROM_GUARD, true);
                i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                try {
                    ctx.startActivityAsUser(i, UserHandle.CURRENT);
                } catch (Throwable e) {
                    Log.w(TAG, "could not open the SD card page", e);
                }
            }
        } catch (Throwable e) {
            // never break storage handling because of this check
            Log.w(TAG, "check " + id, e);
            adopted = false;
        } finally {
            Binder.restoreCallingIdentity(token);
        }

        if (adopted) {
            throw new SecurityException("This SD card is used as internal storage. "
                    + "Change it in Settings > SD card (MasterROM).");
        }
    }
}

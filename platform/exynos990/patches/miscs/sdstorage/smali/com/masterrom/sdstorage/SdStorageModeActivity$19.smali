.class Lcom/masterrom/sdstorage/SdStorageModeActivity$19;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity;->showMain()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

.field final synthetic val$disk:Landroid/os/storage/DiskInfo;


# direct methods
.method constructor <init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/DiskInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 891
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$19;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iput-object p2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$19;->val$disk:Landroid/os/storage/DiskInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 892
    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$19;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$19;->val$disk:Landroid/os/storage/DiskInfo;

    invoke-static {p1, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$2500(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/os/storage/DiskInfo;)V

    return-void
.end method

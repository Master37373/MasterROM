.class Lcom/masterrom/sdstorage/SdStorageModeActivity$22;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity;->requireUnlocked(Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

.field final synthetic val$first:Landroid/content/pm/UserInfo;


# direct methods
.method constructor <init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;Landroid/content/pm/UserInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1021
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$22;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iput-object p2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$22;->val$first:Landroid/content/pm/UserInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1022
    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$22;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$22;->val$first:Landroid/content/pm/UserInfo;

    iget p0, p0, Landroid/content/pm/UserInfo;->id:I

    invoke-static {p1, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$2900(Lcom/masterrom/sdstorage/SdStorageModeActivity;I)V

    return-void
.end method

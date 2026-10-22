.class Lcom/masterrom/sdstorage/SdStorageModeActivity$14;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity;->showSheet(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

.field final synthetic val$onPos:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 757
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$14;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iput-object p2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$14;->val$onPos:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 759
    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$14;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$1800(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    .line 760
    :cond_0
    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$14;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$1802(Lcom/masterrom/sdstorage/SdStorageModeActivity;Z)Z

    .line 761
    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$14;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$1902(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    .line 762
    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$14;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$2000(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V

    .line 763
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$14;->val$onPos:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

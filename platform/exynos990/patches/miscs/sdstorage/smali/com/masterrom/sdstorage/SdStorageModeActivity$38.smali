.class Lcom/masterrom/sdstorage/SdStorageModeActivity$38;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity;->showResult(ZLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

.field final synthetic val$next:Ljava/lang/Runnable;

.field final synthetic val$okMsg:Ljava/lang/String;

.field final synthetic val$rev:Z

.field final synthetic val$title:Ljava/lang/String;

.field final synthetic val$work:Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;


# direct methods
.method constructor <init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;ZLjava/lang/String;Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1467
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$38;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iput-boolean p2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$38;->val$rev:Z

    iput-object p3, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$38;->val$title:Ljava/lang/String;

    iput-object p4, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$38;->val$work:Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;

    iput-object p5, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$38;->val$okMsg:Ljava/lang/String;

    iput-object p6, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$38;->val$next:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1469
    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$38;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    new-instance v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$38$1;

    invoke-direct {v0, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$38$1;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity$38;)V

    invoke-static {p1, v0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$4100(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/Runnable;)V

    return-void
.end method

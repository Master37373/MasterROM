.class Lcom/masterrom/sdstorage/SdStorageModeActivity$37$1;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity$37;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$37;


# direct methods
.method constructor <init>(Lcom/masterrom/sdstorage/SdStorageModeActivity$37;)V
    .locals 0

    .line 1438
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$37$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$37;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1438
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$37$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$37;

    iget-object v0, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$37;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$37$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$37;

    iget-boolean v1, v1, Lcom/masterrom/sdstorage/SdStorageModeActivity$37;->val$rev:Z

    invoke-static {v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$4302(Lcom/masterrom/sdstorage/SdStorageModeActivity;Z)Z

    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$37$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$37;

    iget-object v0, v0, Lcom/masterrom/sdstorage/SdStorageModeActivity$37;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iget-object v1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$37$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$37;

    iget-object v1, v1, Lcom/masterrom/sdstorage/SdStorageModeActivity$37;->val$title:Ljava/lang/String;

    iget-object v2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$37$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$37;

    iget-object v2, v2, Lcom/masterrom/sdstorage/SdStorageModeActivity$37;->val$work:Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;

    iget-object v3, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$37$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$37;

    iget-object v3, v3, Lcom/masterrom/sdstorage/SdStorageModeActivity$37;->val$okMsg:Ljava/lang/String;

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$37$1;->this$1:Lcom/masterrom/sdstorage/SdStorageModeActivity$37;

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$37;->val$next:Ljava/lang/Runnable;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$3900(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

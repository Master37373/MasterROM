.class Lcom/masterrom/sdstorage/SdStorageModeActivity$6;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Landroid/view/View$OnScrollChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity;->buildFrame()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;


# direct methods
.method constructor <init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;)V
    .locals 0

    .line 401
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$6;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrollChange(Landroid/view/View;IIII)V
    .locals 0

    .line 403
    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$6;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p1, p3}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$800(Lcom/masterrom/sdstorage/SdStorageModeActivity;I)V

    .line 404
    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$6;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$1000(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/widget/ScrollView;

    move-result-object p1

    iget-object p2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$6;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$900(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Ljava/lang/Runnable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/ScrollView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 405
    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$6;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$1000(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/widget/ScrollView;

    move-result-object p1

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$6;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$900(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Ljava/lang/Runnable;

    move-result-object p0

    const-wide/16 p2, 0x5a

    invoke-virtual {p1, p0, p2, p3}, Landroid/widget/ScrollView;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

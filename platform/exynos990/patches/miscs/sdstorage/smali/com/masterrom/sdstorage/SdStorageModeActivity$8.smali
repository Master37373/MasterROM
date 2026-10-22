.class Lcom/masterrom/sdstorage/SdStorageModeActivity$8;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


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

    .line 421
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$8;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    sub-int/2addr p5, p3

    sub-int/2addr p9, p7

    if-eq p5, p9, :cond_0

    .line 423
    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$8;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$1300(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/widget/LinearLayout;

    move-result-object p1

    invoke-virtual {p1, p5}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 424
    :cond_0
    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$8;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$1200(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$8;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$1000(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/widget/ScrollView;

    move-result-object p1

    new-instance p2, Lcom/masterrom/sdstorage/SdStorageModeActivity$8$1;

    invoke-direct {p2, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity$8$1;-><init>(Lcom/masterrom/sdstorage/SdStorageModeActivity$8;)V

    invoke-virtual {p1, p2}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    :cond_1
    return-void
.end method

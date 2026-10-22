.class Lcom/masterrom/sdstorage/SdStorageModeActivity$10;
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

    .line 472
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$10;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 474
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$10;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$1100(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/widget/ScrollView;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/ScrollView;->getScrollY()I

    move-result p1

    invoke-static {p0, p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$900(Lcom/masterrom/sdstorage/SdStorageModeActivity;I)V

    return-void
.end method

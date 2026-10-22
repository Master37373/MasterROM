.class Lcom/masterrom/sdstorage/SdStorageModeActivity$5;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

    .line 373
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$5;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 373
    iget-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$5;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$700(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$5;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-virtual {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->finish()V

    :cond_0
    return-void
.end method

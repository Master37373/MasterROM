.class Lcom/masterrom/sdstorage/SdStorageModeActivity$14;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Landroid/window/OnBackInvokedCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity;->updateBackCallback()V
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

    .line 756
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$14;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBackInvoked()V
    .locals 0

    .line 756
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$14;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$700(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Z

    return-void
.end method

.class Lcom/masterrom/sdstorage/SdStorageModeActivity$3;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Lcom/masterrom/sdstorage/SdStorageModeActivity$Work;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/sdstorage/SdStorageModeActivity;->resumeMove(Landroid/content/Intent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

.field final synthetic val$moveId:I


# direct methods
.method constructor <init>(Lcom/masterrom/sdstorage/SdStorageModeActivity;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 199
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$3;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iput p2, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$3;->val$moveId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 201
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$3;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    const-string v1, "Fotos, Downloads und andere Dateien werden verschoben \u2026"

    const-string v2, "Photos, downloads and other files are being moved \u2026"

    invoke-static {v0, v1, v2}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$200(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$300(Lcom/masterrom/sdstorage/SdStorageModeActivity;Ljava/lang/String;)V

    .line 203
    iget-object v0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$3;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    iget p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$3;->val$moveId:I

    invoke-static {v0, p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$400(Lcom/masterrom/sdstorage/SdStorageModeActivity;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

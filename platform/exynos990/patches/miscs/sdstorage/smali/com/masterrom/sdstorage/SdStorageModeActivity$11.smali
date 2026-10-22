.class Lcom/masterrom/sdstorage/SdStorageModeActivity$11;
.super Ljava/lang/Object;
.source "SdStorageModeActivity.java"

# interfaces
.implements Landroid/view/View$OnApplyWindowInsetsListener;


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

    .line 485
    iput-object p1, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$11;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 2

    .line 487
    invoke-static {}, Landroid/view/WindowInsets$Type;->systemBars()I

    move-result p1

    invoke-static {}, Landroid/view/WindowInsets$Type;->displayCutout()I

    move-result v0

    or-int/2addr p1, v0

    invoke-virtual {p2, p1}, Landroid/view/WindowInsets;->getInsets(I)Landroid/graphics/Insets;

    move-result-object p1

    .line 488
    iget-object p0, p0, Lcom/masterrom/sdstorage/SdStorageModeActivity$11;->this$0:Lcom/masterrom/sdstorage/SdStorageModeActivity;

    invoke-static {p0}, Lcom/masterrom/sdstorage/SdStorageModeActivity;->access$1600(Lcom/masterrom/sdstorage/SdStorageModeActivity;)Landroid/widget/LinearLayout;

    move-result-object p0

    iget p2, p1, Landroid/graphics/Insets;->left:I

    iget v0, p1, Landroid/graphics/Insets;->top:I

    iget v1, p1, Landroid/graphics/Insets;->right:I

    iget p1, p1, Landroid/graphics/Insets;->bottom:I

    invoke-virtual {p0, p2, v0, v1, p1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 489
    sget-object p0, Landroid/view/WindowInsets;->CONSUMED:Landroid/view/WindowInsets;

    return-object p0
.end method

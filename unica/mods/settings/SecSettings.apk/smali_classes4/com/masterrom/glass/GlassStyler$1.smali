.class Lcom/masterrom/glass/GlassStyler$1;
.super Ljava/lang/Object;
.source "GlassStyler.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/masterrom/glass/GlassStyler;->apply(Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$dd:F

.field final synthetic val$dk:Z

.field final synthetic val$l:Landroid/view/ViewGroup;


# direct methods
.method constructor <init>(Landroid/view/ViewGroup;ZF)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 93
    iput-object p1, p0, Lcom/masterrom/glass/GlassStyler$1;->val$l:Landroid/view/ViewGroup;

    iput-boolean p2, p0, Lcom/masterrom/glass/GlassStyler$1;->val$dk:Z

    iput p3, p0, Lcom/masterrom/glass/GlassStyler$1;->val$dd:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 2

    .line 95
    iget-object v0, p0, Lcom/masterrom/glass/GlassStyler$1;->val$l:Landroid/view/ViewGroup;

    invoke-static {v0}, Lcom/masterrom/glass/GlassStyler;->noSidePaddingFill(Landroid/view/ViewGroup;)V

    .line 96
    iget-object v0, p0, Lcom/masterrom/glass/GlassStyler$1;->val$l:Landroid/view/ViewGroup;

    iget-boolean v1, p0, Lcom/masterrom/glass/GlassStyler$1;->val$dk:Z

    iget p0, p0, Lcom/masterrom/glass/GlassStyler$1;->val$dd:F

    invoke-static {v0, v1, p0}, Lcom/masterrom/glass/GlassStyler;->styleChildren(Landroid/view/ViewGroup;ZF)V

    const/4 p0, 0x1

    return p0
.end method

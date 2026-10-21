.class final Lcom/masterrom/glass/GlassStyler$CardsDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "GlassStyler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/masterrom/glass/GlassStyler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "CardsDrawable"
.end annotation


# instance fields
.field private final fill:Landroid/graphics/Paint;

.field private final list:Landroid/view/ViewGroup;

.field private final r:Landroid/graphics/RectF;

.field private final radius:F

.field private final stroke:Landroid/graphics/Paint;


# direct methods
.method constructor <init>(Landroid/view/ViewGroup;ZF)V
    .locals 3

    .line 337
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 332
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/masterrom/glass/GlassStyler$CardsDrawable;->fill:Landroid/graphics/Paint;

    .line 333
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v2, p0, Lcom/masterrom/glass/GlassStyler$CardsDrawable;->stroke:Landroid/graphics/Paint;

    .line 335
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/masterrom/glass/GlassStyler$CardsDrawable;->r:Landroid/graphics/RectF;

    .line 338
    iput-object p1, p0, Lcom/masterrom/glass/GlassStyler$CardsDrawable;->list:Landroid/view/ViewGroup;

    const/high16 p1, 0x41d00000    # 26.0f

    mul-float/2addr p1, p3

    .line 339
    iput p1, p0, Lcom/masterrom/glass/GlassStyler$CardsDrawable;->radius:F

    if-eqz p2, :cond_0

    const p0, 0x12ffffff

    goto :goto_0

    :cond_0
    const p0, -0x57000001

    .line 340
    :goto_0
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 341
    sget-object p0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, p0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const p0, 0x3f4ccccd    # 0.8f

    mul-float/2addr p3, p0

    .line 342
    invoke-virtual {v2, p3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    if-eqz p2, :cond_1

    const p0, 0x21ffffff

    goto :goto_1

    :cond_1
    const p0, -0x14000001

    .line 343
    :goto_1
    invoke-virtual {v2, p0}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 9

    .line 347
    iget-object v0, p0, Lcom/masterrom/glass/GlassStyler$CardsDrawable;->list:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    :goto_0
    if-gt v2, v0, :cond_4

    if-ge v2, v0, :cond_0

    .line 350
    iget-object v4, p0, Lcom/masterrom/glass/GlassStyler$CardsDrawable;->list:Landroid/view/ViewGroup;

    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    goto :goto_1

    :cond_0
    const/4 v4, 0x0

    :goto_1
    if-eqz v4, :cond_2

    .line 351
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-nez v5, :cond_2

    invoke-static {v4}, Lcom/masterrom/glass/GlassStyler;->kind(Landroid/view/View;)I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_2

    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    move-result v5

    if-lez v5, :cond_2

    .line 353
    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v4}, Landroid/view/View;->getTranslationY()F

    move-result v7

    add-float/2addr v5, v7

    .line 354
    invoke-virtual {v4}, Landroid/view/View;->getBottom()I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v4}, Landroid/view/View;->getTranslationY()F

    move-result v8

    add-float/2addr v7, v8

    if-nez v3, :cond_1

    .line 356
    iget-object v3, p0, Lcom/masterrom/glass/GlassStyler$CardsDrawable;->r:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {v4}, Landroid/view/View;->getRight()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v3, v8, v5, v4, v7}, Landroid/graphics/RectF;->set(FFFF)V

    move v3, v6

    goto :goto_2

    .line 359
    :cond_1
    iget-object v5, p0, Lcom/masterrom/glass/GlassStyler$CardsDrawable;->r:Landroid/graphics/RectF;

    iget v6, v5, Landroid/graphics/RectF;->left:F

    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    move-result v8

    int-to-float v8, v8

    invoke-static {v6, v8}, Ljava/lang/Math;->min(FF)F

    move-result v6

    iput v6, v5, Landroid/graphics/RectF;->left:F

    .line 360
    iget-object v5, p0, Lcom/masterrom/glass/GlassStyler$CardsDrawable;->r:Landroid/graphics/RectF;

    iget v6, v5, Landroid/graphics/RectF;->right:F

    invoke-virtual {v4}, Landroid/view/View;->getRight()I

    move-result v4

    int-to-float v4, v4

    invoke-static {v6, v4}, Ljava/lang/Math;->max(FF)F

    move-result v4

    iput v4, v5, Landroid/graphics/RectF;->right:F

    .line 361
    iget-object v4, p0, Lcom/masterrom/glass/GlassStyler$CardsDrawable;->r:Landroid/graphics/RectF;

    iput v7, v4, Landroid/graphics/RectF;->bottom:F

    goto :goto_2

    :cond_2
    if-eqz v3, :cond_3

    .line 364
    iget-object v3, p0, Lcom/masterrom/glass/GlassStyler$CardsDrawable;->r:Landroid/graphics/RectF;

    iget v4, p0, Lcom/masterrom/glass/GlassStyler$CardsDrawable;->radius:F

    iget-object v5, p0, Lcom/masterrom/glass/GlassStyler$CardsDrawable;->fill:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4, v4, v5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 365
    iget-object v3, p0, Lcom/masterrom/glass/GlassStyler$CardsDrawable;->r:Landroid/graphics/RectF;

    iget v4, p0, Lcom/masterrom/glass/GlassStyler$CardsDrawable;->radius:F

    iget-object v5, p0, Lcom/masterrom/glass/GlassStyler$CardsDrawable;->stroke:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4, v4, v5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    move v3, v1

    :cond_3
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    :cond_4
    return-void
.end method

.method public getOpacity()I
    .locals 0

    const/4 p0, -0x3

    return p0
.end method

.method public setAlpha(I)V
    .locals 0

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    return-void
.end method

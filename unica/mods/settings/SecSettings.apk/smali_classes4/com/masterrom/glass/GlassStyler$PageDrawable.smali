.class final Lcom/masterrom/glass/GlassStyler$PageDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "GlassStyler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/masterrom/glass/GlassStyler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "PageDrawable"
.end annotation


# instance fields
.field private final dark:Z

.field private final paint:Landroid/graphics/Paint;


# direct methods
.method constructor <init>(Z)V
    .locals 2

    .line 308
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 306
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/masterrom/glass/GlassStyler$PageDrawable;->paint:Landroid/graphics/Paint;

    .line 308
    iput-boolean p1, p0, Lcom/masterrom/glass/GlassStyler$PageDrawable;->dark:Z

    return-void
.end method

.method private spot(Landroid/graphics/Canvas;FFFI)V
    .locals 9

    .line 320
    iget-object v0, p0, Lcom/masterrom/glass/GlassStyler$PageDrawable;->paint:Landroid/graphics/Paint;

    new-instance v8, Landroid/graphics/RadialGradient;

    const v1, 0xffffff

    and-int/2addr v1, p5

    filled-new-array {p5, v1}, [I

    move-result-object v5

    const/4 v6, 0x0

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    move-object v1, v8

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v1 .. v7}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    invoke-virtual {v0, v8}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 321
    iget-object p0, p0, Lcom/masterrom/glass/GlassStyler$PageDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, p3, p4, p0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 9

    .line 311
    invoke-virtual {p0}, Lcom/masterrom/glass/GlassStyler$PageDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 312
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    .line 313
    iget-boolean v2, p0, Lcom/masterrom/glass/GlassStyler$PageDrawable;->dark:Z

    if-eqz v2, :cond_0

    const v2, -0xf8f7f4

    goto :goto_0

    :cond_0
    const v2, -0xd0b08

    :goto_0
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->drawColor(I)V

    const/high16 v2, -0x41800000    # -0.25f

    mul-float v5, v1, v2

    const v2, -0x42333333    # -0.1f

    mul-float v6, v0, v2

    const v2, 0x3f8ccccd    # 1.1f

    mul-float v7, v1, v2

    .line 314
    iget-boolean v2, p0, Lcom/masterrom/glass/GlassStyler$PageDrawable;->dark:Z

    if-eqz v2, :cond_1

    const v2, 0x387b6cff

    goto :goto_1

    :cond_1
    const v2, 0x575b6cff

    :goto_1
    move v8, v2

    move-object v3, p0

    move-object v4, p1

    invoke-direct/range {v3 .. v8}, Lcom/masterrom/glass/GlassStyler$PageDrawable;->spot(Landroid/graphics/Canvas;FFFI)V

    const v2, 0x3f866666    # 1.05f

    mul-float v5, v1, v2

    const v2, 0x3e4ccccd    # 0.2f

    mul-float v6, v0, v2

    const/high16 v2, 0x3f800000    # 1.0f

    mul-float v7, v1, v2

    .line 315
    iget-boolean v2, p0, Lcom/masterrom/glass/GlassStyler$PageDrawable;->dark:Z

    if-eqz v2, :cond_2

    const v2, 0x302ed3c6

    goto :goto_2

    :cond_2
    const v2, 0x4214b5c9

    :goto_2
    move v8, v2

    move-object v3, p0

    move-object v4, p1

    invoke-direct/range {v3 .. v8}, Lcom/masterrom/glass/GlassStyler$PageDrawable;->spot(Landroid/graphics/Canvas;FFFI)V

    const v2, 0x3e99999a    # 0.3f

    mul-float v5, v1, v2

    const v2, 0x3f733333    # 0.95f

    mul-float v6, v0, v2

    const v0, 0x3f99999a    # 1.2f

    mul-float v7, v1, v0

    .line 316
    iget-boolean v0, p0, Lcom/masterrom/glass/GlassStyler$PageDrawable;->dark:Z

    if-eqz v0, :cond_3

    const v0, 0x303e91ff

    goto :goto_3

    :cond_3
    const v0, 0x380a72e6

    :goto_3
    move v8, v0

    move-object v3, p0

    move-object v4, p1

    invoke-direct/range {v3 .. v8}, Lcom/masterrom/glass/GlassStyler$PageDrawable;->spot(Landroid/graphics/Canvas;FFFI)V

    return-void
.end method

.method public getOpacity()I
    .locals 0

    const/4 p0, -0x1

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

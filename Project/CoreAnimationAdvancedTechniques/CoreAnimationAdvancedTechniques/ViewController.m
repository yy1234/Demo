//
//  ViewController.m
//  CoreAnimationAdvancedTechniques
//
//  Created by yang on 2019/3/25.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//
#import "ViewController.h"

@interface ViewController ()<CALayerDelegate>

@property (nonatomic,strong)UIView *layerView;
@property (weak, nonatomic) IBOutlet UIView *coneView;
@property (weak, nonatomic) IBOutlet UIView *shipView;
@property (weak, nonatomic) IBOutlet UIView *igloopView;
@property (weak, nonatomic) IBOutlet UIView *anchorView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.grayColor;
    [self initUI];
}



- (void)initUI {
//    CALayer *blueLayer = [CALayer layer];
//    blueLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
//    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
//    blueLayer.delegate = self;
//    
//    //ensure that layer backing image uses correct scale
//    blueLayer.contentsScale = [UIScreen mainScreen].scale; //add layer to our view
//    [self.layerView.layer addSublayer:blueLayer];
//    //force layer to redraw
//    [blueLayer display];

    /*f
     虽然contents属性是对应的id属性的，但是他只是能接受CGImageRef这个参数，这个是s指向CGImage的指针
     */
//    UIImage *image = [UIImage imageNamed:@"apple.jpg"];
//    self.layerView.layer.contents = (__bridge id)image.CGImage;
   
    /*
     contentsGravity类似于UIView中的cotentMode
     kCAGravityCenter
     kCAGravityTop
     kCAGravityBottom
     kCAGravityLeft
     kCAGravityRight
     kCAGravityTopLeft
     kCAGravityTopRight
     kCAGravityBottomLeft
     kCAGravityBottomRight
     kCAGravityResize
     kCAGravityResizeAspect
     kCAGravityResizeAspectFill
     kCAGravityResizeAspect类似于UIViewContentModeScaleAspectFit
     */
//    self.layerView.layer.contentsGravity = kCAGravityResizeAspect;
    self.layerView.layer.contentsGravity = kCAGravityCenter;
    
    /*
     如果contentsScale设置为1.0，将会以每个点1个像素绘制图片，如果设置为2.0，则会以每个点2个像素绘制图片，这就是我们熟知的Retina屏幕
     设置contentsGravity为kCAGravityResizeAspect时候，此属性无效
     UIView有一个类似功能但是非常少用到的contentScaleFactor属性。
     */
//    self.layerView.layer.contentsScale = 0.5;
    
    /*
     上面设置contentsScale为0.5的时候，视图会超出边界显示，UIView有一个叫做clipsToBounds的属性可以用来决定是否显示超出边界的内容，CALayer对应的属性叫做masksToBounds，把它设置为YES
     */
    self.layerView.layer.masksToBounds = YES;
    
    
    /*
     contentsRect
     CALayer的contentsRect属性允许我们在图层边框里显示寄宿图的一个子域。这涉及到图片是如何显示和拉伸的，所以要比contentsGravity灵活多了
     和bounds，frame不同，contentsRect使用的是单位坐标，单位坐标指定在0-1之间，是一个相对值。（而像素和点是相对值）
     
     点 —— 在iOS和Mac OS中最常见的坐标体系。点就像是虚拟的像素，也被称作逻辑像素。在标准清晰度的设备上，一个点就是一个像素，但是在Retina设备上，一个点等于2*2个像素。iOS用点作为屏幕的坐标测算体系就是为了在Retina设备和普通设备上能有一致的视觉效果。
     像素 —— 物理像素坐标并不会用来屏幕布局，但是它们在处理图片时仍然是相关的。UIImage可以识别屏幕分辨，并以点为单位指定其大小。但是一些底层的图片表示如CGImage就会使用像素，所以你要清楚在Retina设备和普通设备上，它们表现出来了不同的大小。
     单位 —— 对于与图片大小或是图层边界相关的显示，单位坐标是一个方便的度量方式， 当大小改变的时候，也不需要再次调整。单位坐标在OpenGL这种纹理坐标系统中用得很多，Core Animation中也用到了单位坐标。
     */
    self.layerView.layer.contentsRect = CGRectMake(0, 0, 1, 1);
    
    
    UIImage *sprites = [UIImage imageNamed:@"Sprites.png"];
    //set igloo sprite
    [self addSpriteImage:sprites withContentRect:CGRectMake(0, 0, 0.5, 0.5) ￼toLayer:self.igloopView.layer];
    //set cone sprite
    [self addSpriteImage:sprites withContentRect:CGRectMake(0.5, 0, 0.5, 0.5) ￼toLayer:self.coneView.layer];

    //set anchor sprite
    [self addSpriteImage:sprites withContentRect:CGRectMake(0.5, 0, 0.5, 0.5) ￼toLayer:self.anchorView.layer];
    //set spaceship sprite
    [self addSpriteImage:sprites withContentRect:CGRectMake(0.5, 0.5, 0.5, 0.5) ￼toLayer:self.shipView.layer];
    
}

- (void)addSpriteImage:(UIImage *)image withContentRect:(CGRect)rect ￼toLayer:(CALayer *)layer
{
    //set image
    layer.contents = (__bridge id)image.CGImage;
    
    //scale contents to fit
    layer.contentsGravity = kCAGravityResizeAspect;
    
    //set contentsRect
    /*
     自定义显示范围
     */
    layer.contentsRect = rect;
}

#pragma mark CALayerDelegate
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    //UIView实现-drawRect:会分配一个j寄宿图到原来的视图上，大小尺寸为这个寄宿图的像素尺寸等于视图大小乘以 contentsScale的值。
    /*
     -drawRect:底层还是操作CALayer,CALayer有一个可选的delegate属性当需要被重绘时，CALayer会请求它的代理给它一个寄宿图来显示。它通过调用下面这个方法做到的:
     
     (void)displayLayer:(CALayer *)layer;
     趁着这个机会，如果代理想直接设置contents属性的话，它就可以这么做，不然没有别的方法可以调用了。如果代理不实现-displayLayer:方法，CALayer就会转而尝试调用下面这个方法：
     - (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx;
     在调用这个方法之前，CALayer创建了一个合适尺寸的空寄宿图（尺寸由bounds和contentsScale决定）和一个Core Graphics的绘制上下文环境，为绘制寄宿图做准备，它作为ctx参数传入。
     */
    //draw a thick red circle
    CGContextSetLineWidth(ctx, 10.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}
#pragma mark lazyload
- (UIView *)layerView {
    if (!_layerView) {
        _layerView = [[UIView alloc] init];
        _layerView.frame = CGRectMake(0, 0, 200, 200);
        _layerView.center = self.view.center;
        _layerView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_layerView];
    }
    return _layerView;
}

@end

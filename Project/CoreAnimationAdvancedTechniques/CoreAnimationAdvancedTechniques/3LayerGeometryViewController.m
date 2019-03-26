//
//  3LayerGeometryViewController.m
//  CoreAnimationAdvancedTechniques
//
//  Created by yang on 2019/3/26.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "3LayerGeometryViewController.h"

@interface _LayerGeometryViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *hourHand;
@property (nonatomic, weak) IBOutlet UIImageView *minuteHand;
@property (nonatomic, weak) IBOutlet UIImageView *secondHand;
@property (nonatomic, weak) NSTimer *timer;

@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UIView *reView;


@property (strong,nonatomic) UIView *layerView;
@property (strong,nonatomic) CALayer *blueLayer;


@end

@implementation _LayerGeometryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    #pragma mark anchorPoint
    /*
     锚点：anchorPoint
     1、position是layer中的anchorPoint在superLayer中的位置坐标。
     2、互不影响原则：单独修改position与anchorPoint中任何一个属性都不影响另一个属性。
     3、frame、position与anchorPoint有以下关系：
     
     frame.origin.x = position.x - anchorPoint.x * bounds.size.width；
     frame.origin.y = position.y - anchorPoint.y * bounds.size.height；
     */
    CALayer *layer = [[CALayer alloc] init];
    layer.frame = CGRectMake(10, 10, 40, 50);
    layer.backgroundColor = [UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:layer];
    NSLog(@"修改anchorPoint之前%@=====position====%@",NSStringFromCGRect(layer.frame),NSStringFromCGPoint(layer.position));

    layer.anchorPoint = CGPointMake(0, 0);
    NSLog(@"修改anchorPoint之后%@=====position====%@",NSStringFromCGRect(layer.frame),NSStringFromCGPoint(layer.position));
 
    self.secondHand.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.minuteHand.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.hourHand.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    
    //start timer
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    //set initial hand positions
    [self tick];
    
#pragma mark zPosition
    
    /*
     图层的三维坐标，zPosition和anchorPointZ
     还能控制tr图层之间的顺序
     zPosition属性可以明显改变屏幕上图层的顺序，但不能改变触摸事件被处理的顺序。
     这意味着如果改变了图层的z轴顺序，你会发现将不能够检测到最前方的视图点击事件，这是因为被另一个图层遮盖住了
     */
    self.greenView.layer.zPosition = 1;
    NSLog(@"greenZpostion%f======redXPostion%f",self.greenView.layer.zPosition,self.reView.layer.zPosition);
    
    
    
#pragma mark containsPoint:和-hitTest: layer事件处理
    self.blueLayer = [CALayer layer];
    self.blueLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    self.blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    //add it to our view
    [self.layerView.layer addSublayer:self.blueLayer];
    
    
}

- (void)tick
{
    //convert time to hours, minutes and seconds
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSUInteger units = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    CGFloat hoursAngle = (components.hour / 12.0) * M_PI * 2.0;
    //calculate hour hand angle //calculate minute hand angle
    CGFloat minsAngle = (components.minute / 60.0) * M_PI * 2.0;
    //calculate second hand angle
    CGFloat secsAngle = (components.second / 60.0) * M_PI * 2.0;
    //rotate hands
    self.hourHand.transform = CGAffineTransformMakeRotation(hoursAngle);
    self.minuteHand.transform = CGAffineTransformMakeRotation(minsAngle);
    self.secondHand.transform = CGAffineTransformMakeRotation(secsAngle);
}
#pragma mark containsPoint:和-hitTest: layer事件处理
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   /*
    containsPoint
    
    CGPoint point = [[touches anyObject] locationInView: self.view];
    point = [self.layerView.layer convertPoint:point fromLayer:self.view.layer];
    if ([self.layerView.layer containsPoint:point]) {
    point = [self.blueLayer convertPoint:point fromLayer:self.layerView.layer];
    if ([self.blueLayer containsPoint:point]) {
    [[[UIAlertView alloc] initWithTitle:@"Inside Blue Layer"
    message:nil
    delegate:nil
    cancelButtonTitle:@"OK"
    otherButtonTitles:nil] show];
    
    }else {
    [[[UIAlertView alloc] initWithTitle:@"Inside orange Layer"
    message:nil
    delegate:nil
    cancelButtonTitle:@"OK"
    otherButtonTitles:nil] show];
    }
    }
    */
    
    
    /*
     -hitTest:方法同样接受一个CGPoint类型参数，而不是BOOL类型，它返回图层本身，或者包含这个坐标点的叶子节点图层。这意味着不再需要像使用-containsPoint:那样，人工地在每个子图层变换或者测试点击的坐标。如果这个点在最外面图层的范围之外
     */
    CGPoint point = [[touches anyObject] locationInView: self.view];
    CALayer *layer = [self.layerView.layer hitTest:point];
    if (layer == self.blueLayer) {
        [[[UIAlertView alloc] initWithTitle:@"Inside Blue Layer"
                                    message:nil
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    } else if (layer == self.layerView.layer) {
        [[[UIAlertView alloc] initWithTitle:@"Inside orange Layer"
                                    message:nil
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
    
    
    
    
}
#pragma mark lazyload
- (UIView *)layerView {
    if (!_layerView) {
        _layerView = [[UIView alloc] init];
        _layerView.frame = CGRectMake(100, 500, 200, 200);
        _layerView.backgroundColor = [UIColor orangeColor];
        [self.view addSubview:_layerView];
    }
    return _layerView;
}


@end

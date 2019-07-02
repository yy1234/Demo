//
//  ViewController.m
//  时钟效果
//
//  Created by yang on 2019/5/6.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "ViewController.h"
#define angle2Rad(angle) ((angle) / 180.0 * M_PI)

//每一秒旋转6度
#define perSecondA 6

//每一分旋转
#define perMinA 6

//每一小时旋转30
#define perHourA 30
//第一分时针旋转的度数
#define perMinHour 0.5


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *clockView;

@property (nonatomic,strong)CALayer *secondL;

@property (nonatomic,strong)CALayer *minuteL;

@property (nonatomic,strong)CALayer *hourL;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addhour];
    [self addMint];
    [self addSecond];
}


- (void)addSecond {
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 1, 80);
    layer.position = CGPointMake(self.clockView.bounds.size.width * 0.5, self.clockView.bounds.size.height * 0.5);
    //锚点向下移动
    layer.anchorPoint = CGPointMake(0.5, 1);
    self.secondL = layer;
    [self.clockView.layer addSublayer:layer];
     [self timeChange];
    [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self timeChange];
    }];
}




- (void)timeChange {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmp = [calendar components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour fromDate:[NSDate date]];

    
    //获取当前是多少秒
    NSInteger curSecond =  cmp.second;
    //获取当前是多少分
    NSInteger curMinute =  cmp.minute;
    
    //获取当前是多少小时
    NSInteger curHour = cmp.hour;
    
    
    //秒针旋转多少度.
    CGFloat angle = curSecond * perSecondA;
    self.secondL.transform = CATransform3DMakeRotation(angle2Rad(angle), 0, 0, 1);
    
    
    //让分针开始旋转
    CGFloat minuteA = curMinute * perMinA;
    self.minuteL.transform =  CATransform3DMakeRotation(angle2Rad(minuteA), 0, 0, 1);
    
    //让时针开始旋转
    CGFloat hourA = curHour * perHourA + curMinute * perMinHour;
    self.hourL.transform =  CATransform3DMakeRotation(angle2Rad(hourA), 0, 0, 1);
    
}
- (void)addMint {
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor blackColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 3, 70);
    layer.position = CGPointMake(self.clockView.bounds.size.width * 0.5, self.clockView.bounds.size.height * 0.5);
    //锚点向下移动
    layer.anchorPoint = CGPointMake(0.5, 1);
    self.minuteL = layer;
    [self.clockView.layer addSublayer:layer];
}


- (void)addhour {
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor blackColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 3, 50);
    layer.position = CGPointMake(self.clockView.bounds.size.width * 0.5, self.clockView.bounds.size.height * 0.5);
    //锚点向下移动
    layer.anchorPoint = CGPointMake(0.5, 1);
    self.hourL = layer;
    [self.clockView.layer addSublayer:layer];
}

@end

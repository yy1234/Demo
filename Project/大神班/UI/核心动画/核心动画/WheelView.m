//
//  WheelView.m
//  核心动画
//
//  Created by yang on 2019/5/8.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "WheelView.h"
#import "wheelBtn.h"

@interface WheelView()
@property (nonatomic,strong)UIImageView *baseImageView;

@property (nonatomic,strong)UIImageView *wheelImageView;


@property (nonatomic,strong)UIButton *startbtn;


@property (nonatomic,strong)wheelBtn *preBtn;


@property (nonatomic,strong)CADisplayLink *link;
@end

@implementation WheelView



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setView];
        [self setUp];
    }
    return self;
}

-(CADisplayLink *)link {
    if (!_link) {
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    }
    return _link;
}


- (void)update {
    
}
- (void)setView {
   
    self.baseImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    self.baseImageView.image = [UIImage imageNamed:@"LuckyBaseBackground"];
    [self addSubview:self.baseImageView];
    
    self.wheelImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    self.wheelImageView.image = [UIImage imageNamed:@"LuckyRotateWheel"];
    [self addSubview:self.wheelImageView];
    
    
    self.startbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.startbtn.bounds = CGRectMake(0, 0, 70, 70);
    [self.startbtn setBackgroundImage:[UIImage imageNamed:@"LuckyCenterButton"] forState:UIControlStateNormal];
    [self.startbtn setBackgroundImage:[UIImage imageNamed:@"LuckyCenterButtonPressed"] forState:UIControlStateSelected];
    [self.startbtn addTarget:self action:@selector(setartBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.startbtn.center = self.center;
    [self insertSubview:self.startbtn atIndex:self.subviews.count];

    self.baseImageView.userInteractionEnabled = YES;
    self.wheelImageView.userInteractionEnabled = YES;
}




- (void)setUp {
    CGFloat btnW = 68;
    CGFloat btnH = 143;
    CGFloat angle = 0.0;
    //加载原始图片
    UIImage *oriImage = [UIImage imageNamed:@"LuckyAstrology"];
    UIImage *oriSelImage = [UIImage imageNamed:@"LuckyAstrologyPressed"];
    //获取像素比例
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat clipW = oriImage.size.width/12 * scale;
    CGFloat clipH = oriImage.size.height * scale;
    CGFloat clipX = 0;
    CGFloat clipY = 0;
    
    
    for (int i = 0; i < 12; i++) {
        wheelBtn *btn = [wheelBtn buttonWithType:UIButtonTypeCustom];
        btn.bounds = CGRectMake(0, 0, btnW, btnH);
        btn.layer.position = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height *0.5);
        btn.layer.anchorPoint = CGPointMake(0.5, 1.0);
//        btn.backgroundColor = [UIColor redColor];
        [self.wheelImageView addSubview:btn];
        
        clipX = i * clipW;
        CGRect rect = CGRectMake(clipX, clipY, clipW, clipH);
        //裁剪正常状态下的图片(X情况下没有3X图，会导致图片切割的不正常)
        CGImageRef clipImage = CGImageCreateWithImageInRect(oriImage.CGImage, rect);
        UIImage *clipNewImage = [UIImage imageWithCGImage:clipImage];
        [btn setImage:clipNewImage forState:UIControlStateNormal];
        
         //裁剪选中状态下的图片
        CGImageRef clipSelectImage = CGImageCreateWithImageInRect(oriSelImage.CGImage, rect);
        UIImage *clipSelImage = [UIImage imageWithCGImage:clipSelectImage];
        [btn setImage:clipSelImage forState:UIControlStateSelected];
        
        
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        //旋转图片
        btn.transform = CGAffineTransformMakeRotation(angle / 180.0 * M_PI);
        angle +=30;
        if (i == 0) {
            [self click:btn];
        }
    }
    
    
}

- (void)setartBtnClick:(UIButton *)sender {
    
}

- (void)click:(UIButton *)sender {
    if (sender  == self.preBtn) {
        return;
    }
    self.preBtn.selected = NO;
    sender.selected = YES;
    self.preBtn = sender;

}

@end

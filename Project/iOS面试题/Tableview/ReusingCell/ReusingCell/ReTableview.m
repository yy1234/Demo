//
//  ReTableview.m
//  ReusingCell
//
//  Created by yang on 2019/4/26.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//


#import "ReTableview.h"
#import "ViewReusePool.h"
@interface ReTableview()

@property (nonatomic,strong)UIView *containerView;

@property (nonatomic,strong)ViewReusePool *reusePool;
@end
@implementation ReTableview

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initUI];
    }
    return self;
}


- (void)initUI {
    
}

-(void)reloadData {
    [super reloadData];
    self.containerView.backgroundColor = UIColor.grayColor;
    [self.reusePool reset];
    [self reloadIndexedBar];
}

- (void)reloadIndexedBar {
    // 获取字母索引条的显示内容
    NSArray <NSString *> *arrayTitles = nil;
    if ([self.indexDelegate respondsToSelector:@selector(indexTitlesForIndexTableView:)]) {
        arrayTitles = [self.indexDelegate indexTitlesForIndexTableView:self];
    }
    if (!arrayTitles && arrayTitles.count !=0) {
        self.containerView.hidden = YES;
        return;
    }
    NSInteger count = arrayTitles.count;
    CGFloat buttonWidth = 60;
    CGFloat buttonHeight = self.frame.size.height / count;
    for (NSInteger i = 0; i < arrayTitles.count; i++) {
        NSString *title = arrayTitles[i];
        UIButton *btn = (UIButton *)[self.reusePool dequeueReusableView];
        if (btn == nil) {
            btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.backgroundColor = UIColor.whiteColor;
            [self.reusePool addUsingView:btn];
            NSLog(@"创建了");
        }else{
            NSLog(@"重用了");

        }
        [self.containerView addSubview:btn];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setFrame:CGRectMake(0, i * buttonHeight, buttonWidth, buttonHeight)];

    }
    self.containerView.hidden = NO;
    self.containerView.frame = CGRectMake(self.frame.origin.x + self.frame.size.width - buttonWidth, self.frame.origin.y, buttonWidth, self.frame.size.height);
}


-(UIView *)containerView {
    if (!_containerView) {
        _containerView = [[UIView alloc] init];
        _containerView.backgroundColor = [UIColor greenColor];
        [self.superview insertSubview:_containerView aboveSubview:self];
    }
    return _containerView;

}

-(ViewReusePool *)reusePool {
    if (!_reusePool) {
        _reusePool = [[ViewReusePool alloc] init];
     }
    return _reusePool;
}

@end

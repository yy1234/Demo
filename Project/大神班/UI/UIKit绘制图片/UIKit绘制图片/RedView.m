//
//  RedView.m
//  UIKit绘制图片
//
//  Created by yang on 2019/5/5.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "RedView.h"

@implementation RedView

- (void)drawRect:(CGRect)rect {

    
//    UIImage *image = [UIImage imageNamed:@"黄人"];
    //直接把图片绘制的图片里面
//    [image drawAtPoint:CGPointMake(0, 0)];
    //把图片填充到里面
//    [image drawInRect:self.bounds];
    
    //重复填满
//     UIImage *image = [UIImage imageNamed:@"001"];
//     [image drawAsPatternInRect:self.bounds];
    
    
    
    [[UIColor blueColor] set];
    UIRectFill(CGRectMake(10, 10, 100, 100));
//    UIRectClip(CGRectMake(10, 10, 100, 100));

}



- (void)drawText {
    NSString *text = @"YYYYYYYYYYYYYYYYYYYYYY";
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSFontAttributeName] = [UIFont systemFontOfSize:25];
    //这个不会自动换行
    //    [text drawAtPoint:CGPointMake(0, 0) withAttributes:dic];
    
    //这个绘制会自动换行
    [text drawInRect:self.bounds withAttributes:dic];
    
}
@end

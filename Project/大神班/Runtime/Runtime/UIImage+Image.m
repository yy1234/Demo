//
//  UIImage+Image.m
//  Runtime
//
//  Created by yang on 2019/5/4.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "UIImage+Image.h"
#import <objc/message.h>

@implementation UIImage (Image)
+ (void)load {
    
    // 交换方法实现,方法都是定义在类里面
    // class_getMethodImplementation:获取方法实现
    // class_getInstanceMethod:获取对象
    // class_getClassMethod:获取类方法
    // IMP:方法实现
    
    // imageNamed
    // Class:获取哪个类方法
    // SEL:获取方法编号,根据SEL就能去对应的类找方法
  Method imageMethod =  class_getClassMethod([UIImage class], @selector(imageNamed:));
    
    Method yy_imageMethod =  class_getClassMethod([UIImage class], @selector(yy_imageNamed:));
    method_exchangeImplementations(imageMethod, yy_imageMethod);

}

+(UIImage*)yy_imageNamed:(NSString *)imageName {
    UIImage *image = [UIImage yy_imageNamed:imageName];
    
    if (image == nil) {
        NSLog(@"图片为空");
    }
    return image;
}
@end

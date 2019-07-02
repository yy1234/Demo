//
//  ViewController.m
//  Runtime
//
//  Created by yang on 2019/5/4.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>
#import "Persion.h"
#import "UIImage+Image.h"
#import "NSObject+objc.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Persion *p = [[Persion alloc] init];
    //对象方法调用
    objc_msgSend(p, @selector(eat:),@"香蕉");
    //类方法调用
    objc_msgSend([Persion class], @selector(run:),@"操场");

    //添加了方法
   id ss =  [p performSelector:@selector(buy:) withObject:@"香蕉"];
    NSLog(@"%@",ss);
    
    //交换方法
    [UIImage imageNamed:@"123"];
    
    
    //添加属性
    NSObject *obj = [[NSObject alloc] init];
    obj.name = @"小名";
    NSLog(@"%@",obj.name);
}


@end

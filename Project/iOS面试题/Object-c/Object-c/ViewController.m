//
//  ViewController.m
//  Object-c
//
//  Created by yang on 2019/4/28.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "ViewController.h"
#import "Persion+MyCategory.h"
#import "Persion.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Persion *per = [[Persion alloc] init];
    per.name = @"sss";
    NSLog(@"%@", per.name);
    
    
    
    
}


@end

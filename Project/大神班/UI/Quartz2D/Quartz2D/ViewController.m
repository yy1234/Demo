//
//  ViewController.m
//  Quartz2D
//
//  Created by yang on 2019/5/5.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "ViewController.h"
#import "RedView.h"
@interface ViewController ()
@property (nonatomic,strong)RedView *redView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.redView = [[RedView alloc] initWithFrame:CGRectMake(90, 90, 250, 250)];
    [self.view addSubview:self.redView];
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s",__func__);

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%s",__func__);

}


@end

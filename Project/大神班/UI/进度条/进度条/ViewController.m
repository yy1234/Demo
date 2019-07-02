//
//  ViewController.m
//  进度条
//
//  Created by yang on 2019/5/5.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "ViewController.h"
#import "ProcessView.h"
#import "PieView.h"
@interface ViewController ()
@property (nonatomic,strong)ProcessView *processView;

@property (nonatomic,strong)UILabel *label;

@property (nonatomic,strong)PieView *pieView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //processView
    self.processView = [[ProcessView alloc] initWithFrame: CGRectMake(90, 90, 200, 200)];
    self.processView.backgroundColor = UIColor.orangeColor;
    
    self.label = [[UILabel alloc] init];
    self.label.frame = CGRectMake(self.processView.frame.size.width/2, self.processView.frame.size.height/2, 60, 50);
    self.label.text = @"0.00%";
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(90 , CGRectGetMaxY(self.processView.frame), 200, 200)];
    [slider addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:slider];
    [self.view addSubview:self.processView];
    [self.processView addSubview:self.label];
    
    
    //pieview
    self.pieView = [[PieView alloc] initWithFrame:CGRectMake(50, 500, 200, 200)];
    [self.view addSubview:self.pieView];
    self.pieView.backgroundColor = UIColor.grayColor;
    
    
    
}



- (void)valueChange: (UISlider *)sender {
    NSLog(@"%f",sender.value);
    self.label.text = [NSString stringWithFormat:@"%.2f%%",sender.value * 100];
    self.processView.process = sender.value;
}

@end

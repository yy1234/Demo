//
//  ViewController.m
//  Event
//
//  Created by yang on 2019/4/25.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "ViewController.h"
#import "CustomBtn.h"
@interface ViewController ()
@property (nonatomic,strong)CustomBtn *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btn = [[CustomBtn alloc] initWithFrame:CGRectMake(UIScreen.mainScreen.bounds.size.width/2, UIScreen.mainScreen.bounds.size.height/2, 100, 100)];
    [self.btn addTarget:self action:@selector(clickaction) forControlEvents:UIControlEventTouchUpInside];
    self.btn.backgroundColor = UIColor.purpleColor;
    [self.view addSubview:self.btn];

    
}



- (void)clickaction {
    NSLog(@"click");
}


@end

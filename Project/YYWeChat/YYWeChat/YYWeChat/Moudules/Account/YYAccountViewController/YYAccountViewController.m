//
//  YYAccountViewController.m
//  YYWeChat
//
//  Created by yang on 2019/7/8.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "YYAccountViewController.h"
#import "YYLoginViewController.h"
#import "YYRegiterViewController.h"
#import "YYUserHelper.h"

#define     HEIGHT_BUTTON       50
#define     EDGE_BUTTON         35

typedef  NS_ENUM(NSInteger,YYAcountBrttonType){
    YYAcountBrttonTypeRegistion = 1,
    YYAcountBrttonTypeLogin = 2,    
    YYAcountBrttonTypeTest = 3
};
@interface YYAccountViewController ()
@property (nonatomic,strong)UIImageView *imageView;
@end

@implementation YYAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGSize screenSize = UIScreen.mainScreen.bounds.size;
    NSString *viewOrientation = @"Portrait";
    NSString *launchImageName = nil;
    NSArray *launchImages = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary* dict in launchImages) {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, screenSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]]) {
            launchImageName = dict[@"UILaunchImageName"];
        }
    }
    
    [self.view addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    self.imageView.image = [UIImage imageNamed:launchImageName];
    
    //登录
    UIButton *registionBtn = [self setCommonBtnTitle:@"注册" bgColor:UIColor.redColor tag:YYAcountBrttonTypeRegistion];
    [self.view addSubview:registionBtn];
    [registionBtn  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(EDGE_BUTTON);
        make.bottom.mas_equalTo(-EDGE_BUTTON * 2);
        make.width.mas_equalTo((UIScreen.mainScreen.bounds.size.width - EDGE_BUTTON * 3) / 2);
        make.height.mas_equalTo(HEIGHT_BUTTON);
    }];
    
    //注册
    UIButton *loginBtn = [self setCommonBtnTitle:@"登录" bgColor:UIColor.greenColor tag:YYAcountBrttonTypeLogin];
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-EDGE_BUTTON);
        make.size.and.bottom.mas_equalTo(registionBtn);
    }];
    
    // 测试按钮
    UIButton *testButton = [self setCommonBtnTitle:@"使用测试按钮登录" bgColor:UIColor.clearColor tag:YYAcountBrttonTypeTest];
    [testButton.titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
    [self.view addSubview:testButton];
    [testButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-5);
        make.left.mas_equalTo(EDGE_BUTTON);
        make.right.mas_equalTo(-EDGE_BUTTON);
        make.height.mas_equalTo(HEIGHT_BUTTON);
    }];
}

#pragma mark lazy laod
-(UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}


#pragma mark common method
- (UIButton *)setCommonBtnTitle:(NSString *)title bgColor:(UIColor *)color tag:(NSInteger)tag {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:color];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:19.0];
    btn.layer.cornerRadius = 5;
    btn.tag = tag;
    [btn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

#pragma mark action
- (void)clickAction: (UIButton *)sender {
    if (sender.tag == YYAcountBrttonTypeRegistion) {
        YYRegiterViewController *regiterVc = [[YYRegiterViewController alloc] init];
        TLWeakSelf(regiterVc);
        TLWeakSelf(self)
        regiterVc.loginSuccess = ^{
            [weakregiterVc dismissViewControllerAnimated:YES completion:^{
                if (weakself.loginSus) {
                    weakself.loginSus();
                }
            }];
        };
        [self presentViewController:regiterVc animated:YES completion:nil];

    }else if (sender.tag == YYAcountBrttonTypeLogin){
        YYLoginViewController *loginVC = [[YYLoginViewController alloc] init];
        TLWeakSelf(loginVC);
        TLWeakSelf(self)
        loginVC.loginSuccess = ^{
            [weakloginVC dismissViewControllerAnimated:YES completion:^{
                if (weakself.loginSus) {
                    weakself.loginSus();
                }
            }];
        };
        [self presentViewController:loginVC animated:YES completion:nil];
        
    }else if (sender.tag == YYAcountBrttonTypeTest){
        [[YYUserHelper shareInstance] loginTestAccount];
        if (self.loginSus) {
            self.loginSus();
        }
        
    }
 
}
@end

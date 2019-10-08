//
//  YYShortcutMethod.m
//  YYWeChat
//
//  Created by yang on 2019/7/8.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "YYShortcutMethod.h"

//@implementation YYShortcutMethod
//
//@end
UINavigationController *addNavgationController(UIViewController *viewController){
    
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:viewController];
    return navC;
}

void initTabBarItem(UITabBarItem *tabBarItem, NSString *tilte, NSString *image, NSString *imageHL) {
    [tabBarItem setTitle:tilte];
    [tabBarItem setImage:[UIImage imageNamed:image]];
    UIImage *selectImage = [UIImage imageNamed:imageHL];
    tabBarItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorGreenHL] } forState:UIControlStateHighlighted];
    
}

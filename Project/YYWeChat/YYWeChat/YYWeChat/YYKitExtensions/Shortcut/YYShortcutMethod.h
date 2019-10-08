//
//  YYShortcutMethod.h
//  YYWeChat
//
//  Created by yang on 2019/7/8.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//NS_ASSUME_NONNULL_BEGIN

//@interface YYShortcutMethod : NSObject
//
//@end

/**
 
 为ViewController添加navController
 */
UINavigationController *addNavgationController(UIViewController *viewController);

/**
 * 初始化tabBarItem
 */
void initTabBarItem(UITabBarItem *tabBarItem, NSString *tilte, NSString *image, NSString *imageHL);
//NS_ASSUME_NONNULL_END

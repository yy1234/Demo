//
//  AppDelegate.m
//  KVC&&KVO
//
//  Created by yang on 2019/3/15.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "AppDelegate.h"
#import "Persion.h"
#import "Book.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    Persion *persion = [[Persion alloc] init];
    Book *book = [[Book alloc] init];
    [persion addObserver:book forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
//    persion.name = @"2";
    /*
     kvo实现原理
     系统观察者模式的实现
     利用isa婚鞋技术，重写原有类的set方法，再把原有类的指针指向新的子类
     */
    //通过kvc触发kvo
    [persion setValue:@"2" forKey:@"name"];
    
    //给属性赋值是不能触发kvo的，只能重写相关的方法，手动触发
    [persion increase];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

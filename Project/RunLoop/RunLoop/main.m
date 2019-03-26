//
//  main.m
//  RunLoop
//
//  Created by yang on 2019/3/20.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSLog(@"开始");
        int app = UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        NSLog(@"结束");
        return app;
    }
}

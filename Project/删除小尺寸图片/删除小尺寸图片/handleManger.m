//
//  handleManger.m
//  删除小尺寸图片
//
//  Created by yang on 2019/6/25.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "handleManger.h"

@implementation handleManger



- (void)handle {
    // 工程目录
    NSString *BASE_PATH = @"Image";
    NSFileManager *myFileManager = [NSFileManager defaultManager];
    NSDirectoryEnumerator *myDirectoryEnumerator = [myFileManager enumeratorAtPath:BASE_PATH];
    
    BOOL isDir = NO;
    BOOL isExist = NO;
    
    //列举目录内容，可以遍历子目录
    for (NSString *path in myDirectoryEnumerator.allObjects) {
        
        NSLog(@"%@", path);  // 所有路径
        
        isExist = [myFileManager fileExistsAtPath:[NSString stringWithFormat:@"%@/%@", BASE_PATH, path] isDirectory:&isDir];
        if (isDir) {
            NSLog(@"%@", path);    // 目录路径
        } else {
            NSLog(@"%@", path);    // 文件路径
        }
    }

}
@end

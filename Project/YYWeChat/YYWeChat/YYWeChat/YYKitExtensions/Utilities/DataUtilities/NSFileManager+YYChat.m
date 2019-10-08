//
//  NSFileManager+YYChat.m
//  YYWeChat
//
//  Created by yang on 2019/7/14.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "NSFileManager+YYChat.h"
#import "NSFileManager+Paths.h"
#import "YYUserHelper.h"
@implementation NSFileManager (YYChat)
+ (NSString *)pathDBCommon {
    NSString *path = [NSString stringWithFormat:@"%@/User/%@/Setting/DB",[NSFileManager documentsPath],[YYUserHelper shareInstance].userID];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSError *error;
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
            DDLogError(@"File Create Failed: %@", path);
        }
    
    }
    return [path stringByAppendingPathComponent:@"common.sqlite3"];
}

+ (NSString *)pathDBMessage {
    NSString *path = [NSString stringWithFormat:@"%@/User/%@/Chat/DB/", [NSFileManager documentsPath], [YYUserHelper shareInstance].userID];
    NSError *error;
    if ([[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error]) {
        if (error) {
            DDLogError(@"File Create Failed: %@", path);
        }
    }
    return  [path stringByAppendingString:@"message.sqlite3"];
}
@end

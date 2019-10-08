//
//  YYDBManger.m
//  YYWeChat
//
//  Created by yang on 2019/7/14.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "YYDBManger.h"
#import <FMDB/FMDB.h>
#import "YYUserHelper.h"
#import "NSFileManager+YYChat.h"

static YYDBManger *manger;
@implementation YYDBManger

+ (YYDBManger *)sharedInstance {
    static dispatch_once_t onceToken;
    NSString *userID = [[YYUserHelper alloc] init].userID;
    dispatch_once(&onceToken, ^{
        manger = [[YYDBManger alloc] initWithUserID:userID];
    });
    return manger;
}


- (instancetype)initWithUserID: (NSString *)userID {
    if (self = [super init]) {
        NSString *commonQueuePath = [NSFileManager pathDBCommon];
        self.commonQueue = [FMDatabaseQueue databaseQueueWithPath:commonQueuePath];
        NSString *messageQueuePath = [NSFileManager pathDBMessage];
        self.messageQueue = [FMDatabaseQueue databaseQueueWithPath:messageQueuePath];
    }
    return self;
}

@end

//
//  YYDBManger.h
//  YYWeChat
//
//  Created by yang on 2019/7/14.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FMDatabaseQueue;
NS_ASSUME_NONNULL_BEGIN

@interface YYDBManger : NSObject

/**
 除IM相关的队列
 */
@property (nonatomic,strong)FMDatabaseQueue *commonQueue;
/**
消息队列
 */
@property (nonatomic,strong)FMDatabaseQueue *messageQueue;

+ (YYDBManger *)sharedInstance;

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END

//
//  YYDBBaseStore.h
//  YYWeChat
//
//  Created by yang on 2019/7/14.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB/FMDB.h>
NS_ASSUME_NONNULL_BEGIN

@interface YYDBBaseStore : NSObject
///数据库中的操作队列(从YYDBManger.获取，默认使用commonQueue)
@property (nonatomic,weak) FMDatabaseQueue *dbQueue;

///创建表
- (BOOL)createTable: (NSString *)tableName withSQL:(NSString *)sqlString;
/// 执行带数组参数的sql语句 (增，删，改)
- (BOOL)excuteSQL: (NSString *)sqlString withArrParameter:(NSArray*)arrParameter;

/*
 *  执行带字典参数的sql语句 (增，删，改)
 */
-(BOOL)excuteSQL:(NSString*)sqlString withDicParameter:(NSDictionary*)dicParameter;

/*
 *  执行格式化的sql语句 (增，删，改)
 */
- (BOOL)excuteSQL:(NSString *)sqlString,...;

/**
 *  执行查询指令
 */
- (void)excuteQuerySQL:(NSString*)sqlStr resultBlock:(void(^)(FMResultSet * rsSet))resultBlock;
@end

NS_ASSUME_NONNULL_END

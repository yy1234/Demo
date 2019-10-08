//
//  YYDBBaseStore.m
//  YYWeChat
//
//  Created by yang on 2019/7/14.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "YYDBBaseStore.h"
#import "YYDBManger.h"

@implementation YYDBBaseStore
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dbQueue = [YYDBManger sharedInstance].commonQueue;
    }
    return self;
}

///创建表
- (BOOL)createTable: (NSString *)tableName withSQL:(NSString *)sqlString{
    __block BOOL ok = YES;
    [self.dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
        if (![db tableExists:tableName]) {
            ok = [db executeUpdate:sqlString];
        }
    }];
    return ok;
}
/// 执行带数组参数的sql语句 (增，删，改)
- (BOOL)excuteSQL: (NSString *)sqlString withArrParameter:(NSArray*)arrParameter{
    __block BOOL ok = NO;
    if (self.dbQueue) {
        [self.dbQueue inDatabase:^(FMDatabase * db) {
            ok = [db executeUpdate:sqlString withArgumentsInArray:arrParameter];
        }];
    }
    return ok;
}

/*
 *  执行带字典参数的sql语句 (增，删，改)
 */
-(BOOL)excuteSQL:(NSString*)sqlString withDicParameter:(NSDictionary*)dicParameter{
    __block BOOL ok = NO;
    if (self.dbQueue) {
        [self.dbQueue inDatabase:^(FMDatabase *db) {
            ok = [db executeUpdate:sqlString withParameterDictionary:dicParameter];
        }];
    }
    return ok;
}

/*
 *  执行格式化的sql语句 (增，删，改)
 */
- (BOOL)excuteSQL:(NSString *)sqlString,...{
    __block BOOL ok = NO;
    if (self.dbQueue) {
        va_list args;
        va_list *p_args;
        va_start(args, sqlString);
        [self.dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
            ok = [db executeUpdate:sqlString withVAList:*p_args];
        }];
        va_end(args);
    }
    
    return ok;
}

/**
 *  执行查询指令
 */
- (void)excuteQuerySQL:(NSString*)sqlStr resultBlock:(void(^)(FMResultSet * rsSet))resultBlock{
    if (self.dbQueue) {
        [self.dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
            FMResultSet * retSet = [db executeQuery:sqlStr];
            if (resultBlock) {
                resultBlock(retSet);
            }
        }];
    }
}
@end

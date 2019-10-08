//
//  YYDBUserStore.m
//  YYWeChat
//
//  Created by yang on 2019/7/14.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "YYDBUserStore.h"
#import "YYDBManger.h"
#import "YYDBUserStoreSQL.h"
#import "YYUser.h"
@implementation YYDBUserStore
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dbQueue = [YYDBManger sharedInstance].commonQueue;
        BOOL ok  = [self createTable];
        if (!ok) {
            DDLogError(@"DB: 用户表创建失败");
        }
    }
    return self;
}

- (BOOL)createTable{
    NSString *sqlString = [NSString stringWithFormat:SQL_CREATE_USER_TABLE,USER_TABLE_NAME];
    return  [self createTable:USER_TABLE_NAME withSQL:sqlString];
}
///更新用户信息
- (BOOL)updateUser: (YYUser *)user{
    NSString *sqlString = [NSString stringWithFormat:SQL_UPDATE_USER, USER_TABLE_NAME];
    NSArray *arrPara = [NSArray arrayWithObjects:
                        TLNoNilString(user.userID),
                        TLNoNilString(user.username),
                        TLNoNilString(user.nikeName),
                        TLNoNilString(user.avatarURL),
                        TLNoNilString(user.remarkName),
                        @"", @"", @"", @"", @"", nil];
    BOOL ok = [self excuteSQL:sqlString withArrParameter:arrPara];
    return ok;
}

////获取用户信息
- (YYUser *)userByID: (NSString *)userID{
    NSString *sqlString = [[NSString alloc] initWithFormat:SQL_SELECT_USER_BY_ID,USER_TABLE_NAME,userID];
    __block YYUser *user;
    [self excuteQuerySQL:sqlString resultBlock:^(FMResultSet * rsSet) {
        while ([rsSet next]) {
            user = [self p_createUserByFMResultSet:rsSet];
        }
        [rsSet close];
    }];
    return user;
}


//
////查询所有用户的信息
//- (NSArray *)userData{
//    
//}
//
////删除用户
//- (BOOL)deleteUserByUid: (NSString *)uid{
//    
//}
#pragma mark - #Private Method
- (YYUser *)p_createUserByFMResultSet:(FMResultSet *)retSet {
    YYUser *user = [[YYUser alloc] init];
    user.userID = [retSet stringForColumn:@"uid"];
    user.username = [retSet stringForColumn:@"username"];
    user.nikeName = [retSet stringForColumn:@"nikename"];
    user.avatarURL = [retSet stringForColumn:@"avatar"];
    user.remarkName = [retSet stringForColumn:@"remark"];
    return user;
}
@end

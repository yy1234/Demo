//
//  YYUserManager.m
//  YYWeChat
//
//  Created by yang on 2019/7/12.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "YYUserHelper.h"
#import "YYDBUserStore.h"
#import "YYUser.h"
#import "YYUserChatSetting.h"
#import "YYUserSetting.h"
#import "YYUserDetail.h"

@implementation YYUserHelper
@synthesize user = _user;

+ (YYUserHelper *)shareInstance {
    static dispatch_once_t onceToken;
    static YYUserHelper *manger = nil;
    dispatch_once(&onceToken, ^{
        manger = [[self alloc] init];
    });
    return manger;
}

- (void)loginTestAccount
{
    YYUser *user = [[YYUser alloc] init];
    user.userID = @"1000";
    user.avatarURL = @"http://p1.qq181.com/cms/120506/2012050623111097826.jpg";
    user.nikeName = @"李伯坤";
    user.username = @"li-bokun";
    user.detailInfo.qqNumber = @"1159197873";
    user.detailInfo.email = @"libokun@126.com";
    user.detailInfo.location = @"山东 滨州";
    user.detailInfo.sex = @"男";
    user.detailInfo.motto = @"Hello world!";
    user.detailInfo.momentsWallURL = @"http://pic1.win4000.com/wallpaper/c/5791e49b37a5c.jpg";
    [[NSUserDefaults standardUserDefaults] setObject:@"1000" forKey:@"loginUid"];

    [self setUser:user];
}

-(void)setUser:(YYUser *)user {
    _user = user;
    YYDBUserStore *userStore = [[YYDBUserStore alloc] init];
    if (![userStore updateUser:user]) {
        DDLogError(@"登录存储数据失败");
    }
    [[NSUserDefaults standardUserDefaults] setObject:user.userID forKey:@"loginUid"];

}

- (YYUser *)user{
    if (!_user) {
        if (self.userID.length > 0) {
            YYDBUserStore *userStore = [[YYDBUserStore alloc] init];
            _user = [userStore userByID:self.userID];
            _user.detailInfo.momentsWallURL = @"http://pic1.win4000.com/wallpaper/c/5791e49b37a5c.jpg";
            if (!_user) {
                [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"loginUid"];
            }
        }
    }
    return _user;
}
- (NSString *)userID {
    NSString *uid = [[NSUserDefaults standardUserDefaults] objectForKey:@"loginUid"];
    return uid;
}


- (BOOL)isLogin
{
    return self.user.userID.length > 0;
}
@end

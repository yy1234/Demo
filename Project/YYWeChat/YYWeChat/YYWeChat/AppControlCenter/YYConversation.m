//
//  YYConversation.m
//  YYWeChat
//
//  Created by yang on 2019/7/20.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "YYConversation.h"

@implementation YYConversation

- (BOOL)isRead{
    return self.unreadCount <= 0;
}
- (NSString *)bageValue {
    if (self.isRead) {
        return nil;
    }
    if (self.convType == YYConversationTypePersonal || self.convType == YYConversationTypePersonal) {
        return  self.unreadCount <= 99 ? @(self.unreadCount).stringValue : @"99+";
    }else {
        return @"";
    }
}

@end

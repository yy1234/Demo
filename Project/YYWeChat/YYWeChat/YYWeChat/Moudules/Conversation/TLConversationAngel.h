//
//  TLConversationAngel.h
//  YYWeChat
//
//  Created by yang on 2019/9/29.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "ZZFLEXAngel.h"
typedef NS_ENUM(NSInteger,TLConversationSectionTag) {
       TLConversationSectionTagAlert,
       TLConversationSectionTagTopArticle,
       TLConversationSectionTagPlay,
       TLConversationSectionTagTopConversation,
       TLConversationSectionTagConv,
};

typedef NS_ENUM(NSInteger, TLConversationCellTag) {
    TLConversationCellTagNoNet,
};

NS_ASSUME_NONNULL_BEGIN

@interface TLConversationAngel : ZZFLEXAngel

- (instancetype)initWithHostView:(__kindof UIScrollView *)hostView badgeStatusChangeAction:(void (^)(NSString *badge))badgeStatusChangeAction;

@end

NS_ASSUME_NONNULL_END

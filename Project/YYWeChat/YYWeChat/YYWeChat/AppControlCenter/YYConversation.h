//
//  YYConversation.h
//  YYWeChat
//
//  Created by yang on 2019/7/20.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef  NS_ENUM(NSInteger,YYConversationType) {
    YYConversationTypePersonal,  //个人
    YYConversationTypeGroup,       //群聊
    YYConversationTypePublic,       //公众号
    TLConversationTypeServerGroup,  // 服务组（订阅号、企业号）
};

typedef  NS_ENUM(NSInteger,YYMessageRemingType) {
    YYMessageRemingTypeNomal, //正常接收
    YYMessageRemingTypeClose,  //不提示
    YYMessageRemingTypeNotLook, //不看
    YYMessageRemingTypeUnlike   //不喜欢
};
NS_ASSUME_NONNULL_BEGIN

@interface YYConversation : NSObject

/**
 会话类型（个人，讨论组，企业号）
 */
@property (nonatomic, assign)YYConversationType convType;

/**
 消息提醒类型
 */
@property (nonatomic, assign)YYMessageRemingType remindType;

//用户名
@property (nonatomic,copy)NSString *partnerID;
/**
 头像网络地址
 */
@property (nonatomic,copy)NSString *avatarURL;


/**
 本地地址
 */
@property (nonatomic,copy)NSString *avatarPath;

/**
 时间
 */
@property (nonatomic,strong)NSDate *date;

//消息展示的内容
@property (nonatomic,copy)NSString *content;
/**
 消息未读数量
 */
@property (nonatomic,assign)NSInteger unreadCount;
@property (nonatomic,copy,readonly)NSString *bageValue;
@property (nonatomic,assign,readonly)BOOL isRead;




@end

NS_ASSUME_NONNULL_END

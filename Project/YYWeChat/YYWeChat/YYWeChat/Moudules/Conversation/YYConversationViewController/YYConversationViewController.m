//
//  YYConversationViewController.m
//  YYWeChat
//
//  Created by yang on 2019/7/8.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "YYConversationViewController.h"
#import "TLAddMenuView.h"
#import "TLConversationAngel.h"
#import "TLNetworkStatusManager.h"
#import "TLNetworkStatusManager.h"

@interface YYConversationViewController ()

@property (nonatomic,strong)UITableView *tableView;

/// 列表数据及控制中心
@property (nonatomic, strong) TLConversationAngel *listAngel;

@property (nonatomic,strong)TLAddMenuView *addMenuView;
@end

@implementation YYConversationViewController{
     TLNetworkStatusManager *networkStatusManger;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        initTabBarItem(self.tabBarItem, LOCSTR(@"微信"), @"tabbar_mainframe", @"tabbar_mainframeHL");
    }
    return self;
}
- (void)loadView {
    [super loadView];
    //设置标题
    [self p_setNavTitleWithStatesString:nil];
    
    //初始化界面视图控件
    [self p_loadUI];
    //初始化列表模块
    [self p_initListMoudule];
}
- (void)viewDidLoad {
    [super viewDidLoad];


}

#pragma mark - # Private Methods
- (void)p_loadUI {
    //tableview
    self.tableView = self.view.addTableView(1)
    .backgroundColor([UIColor whiteColor])
    .tableHeaderView([UIView new])
    .separatorStyle(UITableViewCellSeparatorStyleNone)
    .masonry(^ (MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    })
    .view;
 
    //顶部的logo
    self.tableView.addImageView(1001)
    .image(TLImage(@"conv_wechat_icon"))
    .masonry(^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.tableView);
        make.bottom.mas_equalTo(self.tableView.mas_top).mas_offset(-35);
    });
    
    //右侧按钮
    @weakify(self);
    [self addRightBarButtonWithImage:TLImage(@"nav_add") actionBlick:^{
        
        
    }];
    
}

/// 更新会话模块的信息
- (void)p_updateConvsationModuleWithData:(NSArray *)data {
 
}

/// 开始网络监控
- (void)p_startNetworkMonitoring
{
    networkStatusManger = [[TLNetworkStatusManager alloc] init];
    [networkStatusManger startNetworkStatusMonitoring];
    @weakify(self);
    [networkStatusManger setNetworkChangedBlock:^(TLNetworkStatus status){
        @strongify(self);
        self.listAngel.sectionForTag(TLConversationSectionTagAlert).clear();
        if (status == TLNetworkStatusNone) {
            [self.navigationItem setTitle:LOCSTR(@"未连接")];
            self.listAngel.addCell(@"TLConversationNoNetCell").toSection(TLConversationSectionTagAlert).viewTag(TLConversationCellTagNoNet);
        }
        else {
            [self p_setNavTitleWithStatesString:nil];
        }
        [self.tableView reloadData];
    }];
}
- (void)p_initListMoudule {
    @weakify(self);
    self.listAngel = [[TLConversationAngel alloc] initWithHostView:self.tableView badgeStatusChangeAction:^(NSString * _Nonnull badge) {
        @strongify(self);
         [self.tabBarItem setBadgeValue:badge];
    }];
    
    //搜索，网络失败
    self.listAngel.addSection(TLConversationSectionTagAlert);
    //置顶文章
    self.listAngel.addSection(TLConversationSectionTagTopArticle);
    //播放内容
    self.listAngel.addSection(TLConversationSectionTagPlay);
    //置顶会话
    self.listAngel.addSection(TLConversationSectionTagTopConversation);
    //普通回话
    self.listAngel.addSection(TLConversationSectionTagConv);
    [self.tableView reloadData];
    
    
}
- (void)p_setNavTitleWithStatesString:(NSString *)statusString {
    NSString *title = LOCSTR(@"微信");
    title = statusString.length > 0 ? [title stringByAppendingFormat:@"(%@)",statusString] : statusString;
    [self.navigationItem setTitle:LOCSTR(title)];
}



@end

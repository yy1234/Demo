//
//  ReTableview.h
//  ReusingCell
//
//  Created by yang on 2019/4/26.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol IndexBarDelegate <NSObject>

- (NSArray<NSString *>*)indexTitlesForIndexTableView:(UITableView *)tableView;

@end



@interface ReTableview : UITableView

@property (nonatomic,weak)id<IndexBarDelegate>indexDelegate;
@end



NS_ASSUME_NONNULL_END

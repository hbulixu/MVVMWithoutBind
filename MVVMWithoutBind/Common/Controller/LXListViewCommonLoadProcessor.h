//
//  LXListViewCommonLoadProcessor.h
//  LXViewController
//
//  Created by 58 on 2018/7/2.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LXListViewLoadProcessProtocol.h"
#import <MJRefresh.h>

@interface LXListViewCommonLoadProcessor : NSObject <LXListViewLoadProcessProtocol>

//页面布局请用autolayout
@property (nonatomic, strong) UIView <LXStateViewProtocol>* errorRefreshView;

@property (nonatomic, strong) UIView <LXStateViewProtocol>* loadIndicatorView;

@property (nonatomic, strong) UIView <LXStateViewProtocol>* emptyView;

@property (nonatomic, strong) UIView <LXStateViewProtocol>* forbiddenView;

@property (nonatomic, strong) MJRefreshHeader * refreshHeader;

@property (nonatomic, strong) MJRefreshFooter * refreshFooter;

@property (nonatomic,assign)BOOL needFooter;

@property (nonatomic,assign)BOOL needHeader;

@end

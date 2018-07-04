//
//  LXTableViewLoadProcessProtocol.h
//  LXViewController
//
//  Created by 58 on 2018/7/2.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LXListViewModelProtocol.h"
#import "LXListRefreshHeaderFooterDelegate.h"
#import "LXStateViewProtocol.h"
#import <UIKit/UIKit.h>

@protocol LXListViewLoadProcessProtocol <NSObject>
//错误提示页
@property (nonatomic, strong) UIView <LXStateViewProtocol>* errorRefreshView;
//加载页
@property (nonatomic, strong) UIView <LXStateViewProtocol>* loadIndicatorView;
//空页面
@property (nonatomic, strong) UIView <LXStateViewProtocol>* emptyView;
//权限页面
@property (nonatomic, strong) UIView <LXStateViewProtocol>* forbiddenView;

@property (nonatomic,assign)BOOL needFooter;

@property (nonatomic,assign)BOOL needHeader;


+(instancetype)processorForController:(UIViewController <LXListRefreshHeaderFooterDelegate>*)controller ListView:(UIScrollView *)listView;

//页面开始刷新时的处理
-(void)listViewModelDidStartRefresh:(id <LXListViewModelProtocol>) viewModel;

//刷新后的页面处理
-(void)listViewModelDidFinishRefresh:(id <LXListViewModelProtocol>) viewModel hasError:(NSError *)error;

//加载更多后的页面处理
-(void)listViewModelDidFinishLoadMore:(id <LXListViewModelProtocol>) viewModel hasError:(NSError *)error;

-(void)beginToRefresh;

-(void)beginToLoadMore;

-(void)showErrorRefeshView;

-(void)hiddenErrorRefreshView;

-(void)showLoadIndicatorView;

-(void)hiddenLoadIndicatorView;

-(void)showEmptyView;

-(void)hiddenEmptyView;

-(void)showForbiddenView;

-(void)hiddenForbiddenView;

@end

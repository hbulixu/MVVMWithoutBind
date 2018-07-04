//
//  LXListViewCommonLoadProcessor.m
//  LXViewController
//
//  Created by 58 on 2018/7/2.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "LXListViewCommonLoadProcessor.h"
#import "LXEmptyView.h"
#import "LXErrorRefreshView.h"
#import "LXForbiddenView.h"
#import "LXLoadIndicatorView.h"
#import <Masonry.h>

@interface LXListViewCommonLoadProcessor()<LXStateViewDelegate>

@property (nonatomic,weak)UIScrollView * listView;
@property (nonatomic,weak)UIViewController * controller;
@end

@implementation LXListViewCommonLoadProcessor

+(instancetype)processorForController:(UIViewController <LXListRefreshHeaderFooterDelegate>*)controller ListView:(UIScrollView *)listView
{
    LXListViewCommonLoadProcessor * processor = [LXListViewCommonLoadProcessor new];
    processor.listView = listView;
    processor.controller = controller;
    //默认使用个公共配置
    [processor loadCommonConfig];
    return processor;
}

-(void)loadCommonConfig
{
    self.emptyView = [LXEmptyView new];
    self.errorRefreshView = [LXErrorRefreshView new];
    self.errorRefreshView.delegate = self;
    
    self.forbiddenView =[LXForbiddenView new];
    self.loadIndicatorView = [LXLoadIndicatorView new];
    self.needHeader = YES;
    self.needFooter = YES;
    self.controller.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - LXStateViewDelegate

-(void)didClickRefreshButton
{
    [self beginToRefresh];
}

-(void)listViewModelDidStartRefresh:(id <LXListViewModelProtocol>) viewModel 
{
    NSArray * cells = nil;
    if ([self.listView isKindOfClass:[UITableView class]]) {
        
        cells = [(UITableView *)self.listView visibleCells];
        
    }else if([self.listView isKindOfClass:[UICollectionView class]])
    {
        cells = [(UICollectionView *)self.listView visibleCells];
    }
    if (cells.count == 0) {
        [self hiddenErrorRefreshView];
        [self hiddenEmptyView];
        [self showLoadIndicatorView];
    }
    if (self.needFooter) {
        _listView.mj_footer = nil;
    }
}

-(void)listViewModelDidFinishRefresh:(id <LXListViewModelProtocol>) viewModel hasError:(NSError *)error
{
    
    NSArray * cells = nil;
    if ([self.listView isKindOfClass:[UITableView class]]) {
        
        cells = [(UITableView *)self.listView visibleCells];
        
    }else if([self.listView isKindOfClass:[UICollectionView class]])
    {
        cells = [(UICollectionView *)self.listView visibleCells];
    }
    
    if (error) {
        
        if ([cells count] ==0) {
            [self hiddenLoadIndicatorView];
            [self hiddenEmptyView];
            [self hiddenForbiddenView];
            [self showErrorRefeshView];
        }
        
        //可以处理权限页面
        
    }else
    {
        [self hiddenLoadIndicatorView];
        [self hiddenErrorRefreshView];
        [self hiddenForbiddenView];
        
        if (viewModel.hasNoContent) {
            [self showEmptyView];
        }else if (self.needFooter) {
            [self addFooter];
            if (![viewModel canLoadMore]) {
                
                [self.listView.mj_footer endRefreshingWithNoMoreData];
            }
        }
    }
    
    if ([self.listView isKindOfClass:[UITableView class]]) {
        
        [(UITableView *)self.listView  reloadData];
        
    }else if([self.listView isKindOfClass:[UICollectionView class]])
    {
        [(UICollectionView *)self.listView  reloadData];
    }
    
    [self.listView.mj_header endRefreshing];
    
}



-(void)listViewModelDidFinishLoadMore:(id <LXListViewModelProtocol>) viewModel hasError:(NSError *)error
{
    
    if (self.needFooter) {
        [self addFooter];
        if ([viewModel canLoadMore]) {
            [self.listView.mj_footer endRefreshing];
        }else
        {
            [self.listView.mj_footer endRefreshingWithNoMoreData];
        }
    }
    
    if (error) {
        
        //处理权限页面
        
    }
    
    if ([self.listView isKindOfClass:[UITableView class]]) {
        
        [(UITableView *)self.listView  reloadData];
        
    }else if([self.listView isKindOfClass:[UICollectionView class]])
    {
        [(UICollectionView *)self.listView  reloadData];
    }
    
}

-(void)beginToRefresh
{
    [self.listView.mj_header beginRefreshing];
}

-(void)beginToLoadMore
{
    [self.listView.mj_footer beginRefreshing];
}

-(void)setNeedFooter:(BOOL)needFooter
{
    _needFooter = needFooter;
    if (needFooter) {
        [self addFooter];
    }else
    {
        self.listView.mj_footer = nil;
    }
  
}

-(void)setNeedHeader:(BOOL)needHeader
{
    
    _needHeader = needHeader;
    
    if (needHeader) {
        [self addHeader];
    }else
    {
        self.listView.mj_header = nil;
    }
}

-(void)addHeader
{
    self.refreshHeader = [MJRefreshNormalHeader headerWithRefreshingTarget:self.controller refreshingAction:@selector(refresh)];
    self.listView.mj_header = self.refreshHeader;
}


-(void)addFooter
{
    if ( nil == self.refreshFooter) {
        
        self.refreshFooter = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self.controller refreshingAction:@selector(loadMore)];
    }
    self.refreshFooter.state = MJRefreshStateIdle;
    self.listView.mj_footer = self.refreshFooter;
}



-(void)showErrorRefeshView
{
    [self.listView addSubview:self.errorRefreshView];
    [self.listView bringSubviewToFront:self.errorRefreshView];
    
    self.errorRefreshView.frame = [UIScreen mainScreen].bounds;
    self.errorRefreshView.hidden = NO;
}

-(void)hiddenErrorRefreshView
{
    self.errorRefreshView.hidden = YES;
}

-(void)showLoadIndicatorView
{
    [self.listView addSubview:self.loadIndicatorView];
    [self.listView bringSubviewToFront:self.loadIndicatorView];
    
    self.loadIndicatorView.frame = [UIScreen mainScreen].bounds;
    self.loadIndicatorView.hidden = NO;
}

-(void)hiddenLoadIndicatorView
{
    self.loadIndicatorView.hidden = YES;
}

-(void)showEmptyView
{
    [self.listView addSubview:self.emptyView];
    [self.listView bringSubviewToFront:self.emptyView];
    self.emptyView.frame = [UIScreen mainScreen].bounds;
    self.emptyView.hidden = NO;
}

-(void)hiddenEmptyView
{
    self.emptyView.hidden = YES;
}

-(void)showForbiddenView
{
    [self.listView addSubview:self.forbiddenView];
    [self.listView bringSubviewToFront:self.forbiddenView];
    self.forbiddenView.frame = [UIScreen mainScreen].bounds;
    self.forbiddenView.hidden = NO;
}

-(void)hiddenForbiddenView
{
    self.forbiddenView.hidden = YES;
}


@end

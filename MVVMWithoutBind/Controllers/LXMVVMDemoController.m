//
//  LXDemo1ViewController.m
//  LXViewController
//
//  Created by 58 on 2018/6/27.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "LXMVVMDemoController.h"
#import "LXMVVMDemoViewModel.h"
#import "LXUtils.h"
#import "MutiSelectCell.h"
#import "LXListViewCommonLoadProcessor.h"
#import "LXListRefreshHeaderFooterDelegate.h"
#import "LXListViewLoadProcessProtocol.h"
@interface LXMVVMDemoController ()<UITableViewDelegate,UITableViewDataSource,LXCellToControllerActionProtocol,LXListRefreshHeaderFooterDelegate>
@property (nonatomic,strong)LXMVVMDemoViewModel * viewModel;
@property (nonatomic,strong)id <LXListViewLoadProcessProtocol>  processor;
@property (nonatomic,strong)UITableView * tableView;

@end

@implementation LXMVVMDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubView];
    [self.processor beginToRefresh];
}

- (void)initSubView
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    [self.view addSubview:self.tableView];
    //
    [self processor];
    [self.tableView registerClass:[MutiSelectCell class] forCellReuseIdentifier:@"test"];
}


#pragma mark -LXListRefreshHeaderFooterDelegate
//刷新控件的协议
-(void)refresh
{
    
    [self.processor listViewModelDidStartRefresh:self.viewModel];
    //数据请求
    [self.viewModel getListFromServiceFinish:^(NSError *error, NSArray *listItems) {
        [self.processor listViewModelDidFinishRefresh:self.viewModel hasError:error];
        if (!error) {
            
        }
    }];
}

-(void)loadMore
{
    [self.processor listViewModelDidStartRefresh:self.viewModel];
    [self.viewModel loadMoreListFromServiceFinish:^(NSError *error, NSArray *listItems) {
        [self.processor listViewModelDidFinishLoadMore:self.viewModel hasError:error];
    }];
}


#pragma mark - UITableViewDelegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LXRow * rowModel = self.viewModel.listItems[indexPath.row];
    UITableViewCell <LXCellProtocol>* cell = [tableView dequeueReusableCellWithIdentifier:rowModel.cellReuseIdentify];
    cell.viewModel = rowModel.viewModel;
    cell.delegate = self;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.viewModel.listItems.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LXRow * rowModel = self.viewModel.listItems[indexPath.row];
    return rowModel.cellHeight;
}

#pragma  mark -LXCellToControllerActionProtocol

- (void)actionFromView:(UIView *)view withEventTag:(NSString *)tag withParameterObject:(id)object {
    
}


#pragma mark -GET&SET
-(LXMVVMDemoViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [LXMVVMDemoViewModel new];
    }
    return _viewModel;
}

-(LXListViewCommonLoadProcessor *)processor
{
    if (!_processor) {
        _processor = [LXListViewCommonLoadProcessor processorForController:self ListView:self.tableView];
    }
    return _processor;
}


@end

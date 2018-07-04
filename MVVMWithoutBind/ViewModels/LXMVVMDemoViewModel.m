//
//  LXDemo1ViewModel.m
//  LXViewController
//
//  Created by 58 on 2018/6/29.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "LXMVVMDemoViewModel.h"
#import "LXRow.h"
#import "MutiSelectCell.h"
#import "ItemIconTapView.h"
#import "ItemIconTapViewModel.h"
#import "MutiSelectCellViewModel.h"
@implementation LXMVVMDemoViewModel


-(void)getListFromServiceFinish:(void(^)(NSError * error, NSArray * listItems)) finishBlock
{
    //模拟网络请求
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        for (int i = 0; i < 10; i++) {
            
            LXRow * row = [LXRow new];
            row.cellClass = [MutiSelectCell class];
            row.cellReuseIdentify = @"test";
            row.cellHeight = [MutiSelectCell heightForCellInTableView:nil byViewModel:nil];
            MutiSelectCellViewModel * viewModel = [MutiSelectCellViewModel new];
            viewModel.title = [NSString stringWithFormat:@"%d title",i];
            NSMutableArray * array = [NSMutableArray array];
            for (int i =0 ; i < 3; i ++) {
                ItemIconTapViewModel * item = [ItemIconTapViewModel new];
                item.title = [NSString stringWithFormat:@"%d item",i];
                item.imageUrl = [NSString stringWithFormat:@"%d imageUrl",i];
                [array addObject:item];
            }
            viewModel.items = array;
            row.viewModel = viewModel;
            [self.listItems addObject:row];
        }
        
        static r = -1;
        r = (r + 1)%3;
        switch (r) {
                //模拟没有数据
            case 0:
                self.listItems =[NSMutableArray array];
                
                self.hasNoContent = YES;
                self.canLoadMore = YES;
                finishBlock(nil,self.listItems);
                break;
                //模拟获取数据错误
            case 1:
                self.listItems =[NSMutableArray array];
                
                self.hasNoContent = NO;
                self.canLoadMore = YES;
                finishBlock([NSError new],self.listItems);
                break;
                //模拟数据正常
            case 2:
                self.hasNoContent = NO;
                self.canLoadMore = YES;
                finishBlock(nil,self.listItems);
                break;
            default:
                break;
        }
    });
    
}

-(void)loadMoreListFromServiceFinish:(void(^)(NSError * error, NSArray * listItems)) finishBlock
{
    
}

#pragma mark -GET&SET

-(NSMutableArray<LXRow *> *)listItems
{
    if (!_listItems) {
        _listItems = [NSMutableArray array];
    }
    return _listItems;
}
@end

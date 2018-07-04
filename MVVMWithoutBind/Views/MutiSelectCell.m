//
//  LXDemo1Cell.m
//  LXViewController
//
//  Created by 58 on 2018/6/26.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "MutiSelectCell.h"
#import "ItemIconTapView.h"
@interface MutiSelectCell()

@property (nonatomic,strong)UILabel * titleLabel;
@property (nonatomic,strong)NSMutableSet <ItemIconTapView *> * usedViews;
@property (nonatomic,strong)NSMutableSet <ItemIconTapView *> * unUsedViews;
@end

@implementation MutiSelectCell
MCELLPROPERTY

-(void)setViewModel:(id<MutiSelectCellViewModelProtocol>)viewModel
{
    _viewModel = viewModel;
    _titleLabel.text = viewModel.title;
    
    [self.contentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[ItemIconTapView class]]) {
            [obj removeFromSuperview];
        }
    }];
    [self resetReusableView];
    
    int row = 0;
    int col = 0;
    int colNum = 3;
    CGFloat itemW = [UIScreen mainScreen].bounds.size.width / colNum;
    CGFloat itemH = itemW;
    for (int i =0; i < viewModel.items.count; i ++) {
        row = i/colNum;
        col = i%colNum;
        ItemIconTapView * subView = [self dequeueReusableView];
        subView.hidden = NO;
        id<MutiSelectCellViewModelProtocol> item = viewModel.items[i];
        [subView setViewModel:item];
        subView.frame = CGRectMake(col*itemW, row*itemH, itemW, itemH);
        [self.contentView addSubview:subView];
        
    }
}

+(CGFloat)heightForCellInTableView:(UITableView *)tableView byViewModel:(id)viewModel
{
    return 100;
}

-(ItemIconTapView *)dequeueReusableView
{
    ItemIconTapView * subView = [self.unUsedViews anyObject];
    if (!subView) {
        subView = [ItemIconTapView new];
        [self.usedViews addObject:subView];
    }else
    {
        [self.unUsedViews removeObject:subView];
    }
    return subView;
}

-(void)resetReusableView
{
    [self.unUsedViews unionSet:self.usedViews];
    [self.usedViews removeAllObjects];
}

#pragma mark -GET&SET

-(NSMutableSet<ItemIconTapView *> *)usedViews
{
    if (!_usedViews) {
        _usedViews = [NSMutableSet set];
    }
    return _usedViews;
}

-(NSMutableSet<ItemIconTapView *> *)unUsedViews
{
    if (!_unUsedViews) {
        _unUsedViews = [NSMutableSet set];
    }
    return _unUsedViews;
}
@end

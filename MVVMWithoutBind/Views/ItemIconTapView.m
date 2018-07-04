//
//  LXIconTapView.m
//  LXViewController
//
//  Created by 58 on 2018/6/26.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "ItemIconTapView.h"
#import <Masonry.h>
@interface ItemIconTapView ()
@property (nonatomic,strong)UILabel * detail;
@property (nonatomic,strong)UILabel * titleLabel;

@end

@implementation ItemIconTapView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _titleLabel = [UILabel new];
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self);
        }];
        _detail = [UILabel new];
        [self addSubview:_detail];
        [_detail mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        }];

       
    }
    return self;
}

-(void)setViewModel:(id<ItemIconTapViewModelProtocol>)viewModel
{
    _viewModel = viewModel;
    _detail.text = viewModel.imageUrl;
    _titleLabel.text  = viewModel.title;
}
@end

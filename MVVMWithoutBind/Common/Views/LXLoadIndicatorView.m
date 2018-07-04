//
//  LXLoadIndicatorView.m
//  LXViewController
//
//  Created by 58 on 2018/7/3.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "LXLoadIndicatorView.h"
#import <Masonry.h>

@interface LXLoadIndicatorView()

@property (nonatomic,strong)UIActivityIndicatorView * indicator;
@property (nonatomic,strong)UILabel * label;
@end

@implementation LXLoadIndicatorView

-(instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [self addSubview:_indicator];
        
        [_indicator mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self).offset(-60);
            make.centerX.equalTo(self);
        }];
        _label = [UILabel new];
        _label.text = @"这是刷新页面";
        [self addSubview:_label];
        
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self).offset(-30);
            make.centerX.equalTo(self);
        }];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)willMoveToSuperview:(UIView *)newSuperview
{
    [_indicator startAnimating];
}
@end

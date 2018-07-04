//
//  LXErrorRefreshView.m
//  LXViewController
//
//  Created by 58 on 2018/7/3.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "LXErrorRefreshView.h"
#import <Masonry.h>
@interface LXErrorRefreshView()

@property (nonatomic,strong)UILabel * label;

@end

@implementation LXErrorRefreshView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _label = [UILabel new];
        _label.text = @"这是错误页，点击刷新";
          [self addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self).offset(-60);
            make.centerX.equalTo(self);
        }];
        self.backgroundColor = [UIColor whiteColor];
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

-(void)tapAction
{
    if ([self.delegate respondsToSelector:@selector(didClickRefreshButton)])
    {
        [self.delegate didClickRefreshButton];
    }
}
@end

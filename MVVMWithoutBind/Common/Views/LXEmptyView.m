//
//  LXEmptyView.m
//  LXViewController
//
//  Created by 58 on 2018/7/3.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "LXEmptyView.h"
#import <Masonry.h>

@interface LXEmptyView()

@property (nonatomic,strong)UILabel * label;

@end

@implementation LXEmptyView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _label = [UILabel new];
        _label.text = @"这是空白页";
          [self addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self).offset(-60);
            make.centerX.equalTo(self);
        }];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

@end

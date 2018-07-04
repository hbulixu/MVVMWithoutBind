//
//  LXForbiddenView.m
//  LXViewController
//
//  Created by 58 on 2018/7/3.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "LXForbiddenView.h"
#import <Masonry.h>
@interface LXForbiddenView ()
@property (nonatomic,strong)UILabel * label;
@end

@implementation LXForbiddenView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _label = [UILabel new];
        _label.text = @"您没有权限访问";
        [self addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.center.equalTo(self);
        }];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

@end

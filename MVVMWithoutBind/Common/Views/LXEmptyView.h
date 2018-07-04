//
//  LXEmptyView.h
//  LXViewController
//
//  Created by 58 on 2018/7/3.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXStateViewProtocol.h"
@interface LXEmptyView : UIView<LXStateViewProtocol>

@property (nonatomic, weak) id <LXStateViewDelegate> delegate;
@end

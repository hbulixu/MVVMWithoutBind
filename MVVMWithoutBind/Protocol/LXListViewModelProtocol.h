//
//  LXListViewModelProtocol.h
//  LXViewController
//
//  Created by 58 on 2018/7/2.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LXRow.h"
@protocol LXListViewModelProtocol <NSObject>

@property (nonatomic,assign)BOOL canLoadMore;
@property (nonatomic,assign)BOOL hasNoContent;

@end

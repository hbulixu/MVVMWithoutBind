//
//  LXDemo1CellListItemViewModel.h
//  LXViewController
//
//  Created by 58 on 2018/6/29.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemIconTapView.h"
@interface ItemIconTapViewModel : NSObject<ItemIconTapViewModelProtocol>

@property (nonatomic,copy)NSString * title;
@property (nonatomic,copy)NSString * imageUrl;

@end

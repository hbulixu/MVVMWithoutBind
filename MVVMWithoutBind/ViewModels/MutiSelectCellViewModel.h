//
//  LXDemoViewModel1.h
//  LXViewController
//
//  Created by 58 on 2018/6/27.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MutiSelectCell.h"


@interface MutiSelectCellViewModel : NSObject<MutiSelectCellViewModelProtocol>

@property (nonatomic,strong)NSString * title;
@property (nonatomic,strong)NSArray <ItemIconTapViewModelProtocol> *  items;

@end

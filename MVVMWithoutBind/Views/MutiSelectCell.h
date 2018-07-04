//
//  LXDemo1Cell.h
//  LXViewController
//
//  Created by 58 on 2018/6/26.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXCellToControllerActionProtocol.h"
#import "LXCellProtocol.h"
#import "ItemIconTapView.h"

@protocol MutiSelectCellViewModelProtocol <NSObject>

@property (nonatomic,strong)NSString * title;
@property (nonatomic,strong)NSArray <ItemIconTapViewModelProtocol> *  items;

@end

@interface MutiSelectCell : UITableViewCell<LXCellProtocol>

@end

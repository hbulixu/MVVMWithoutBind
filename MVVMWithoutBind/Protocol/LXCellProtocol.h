//
//  LXCellProtocol.h
//  LXViewController
//
//  Created by 58 on 2018/6/27.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LXCellToControllerActionProtocol.h"

#define MCELLPROPERTY  \
@synthesize delegate = _delegate; \
@synthesize viewModel = _viewModel;


@protocol LXCellProtocol 

@property (nonatomic,weak) id <LXCellToControllerActionProtocol> delegate;

@property (nonatomic,strong) id viewModel;

//计算cell高度
+ (CGFloat)heightForCellInTableView:(UITableView *)tableView byViewModel:(id)viewModel;

@end

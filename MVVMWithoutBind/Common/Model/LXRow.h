//
//  LXRow.h
//  LXViewController
//
//  Created by 58 on 2018/6/29.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LXRow : NSObject

@property (nonatomic,assign)CGFloat cellHeight;

@property (nonatomic,copy)NSString* cellReuseIdentify;

@property (nonatomic,strong)Class cellClass;

/**cell唯一标识*/
@property (nonatomic,copy)NSString* cellTag;

/**cell功能描述，用于开发人员看*/
@property (nonatomic,copy)NSString * des;

@property (nonatomic,retain) id viewModel;

@end

//
//  LXSection.h
//  LXViewController
//
//  Created by 58 on 2018/6/29.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LXRow.h"
@interface LXSection : NSObject

@property (nonatomic,copy)NSString* sectionReuseIdentify;
/**唯一标识一个section*/
@property (nonatomic,copy)NSString*  tag;

@property (nonatomic,retain)UIView * sectionHeaderView;

@property (nonatomic,assign)CGFloat sectionHeaderHeight;

@property (nonatomic,retain)UIView * sectionFooterView;

@property (nonatomic,assign)CGFloat sectionFooterHeight;

@property (nonatomic,retain)NSMutableArray  * rowMulArray;
@end

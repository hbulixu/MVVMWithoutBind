//
//  LXIconTapView.h
//  LXViewController
//
//  Created by 58 on 2018/6/26.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ItemIconTapView;

@protocol ItemIconTapViewModelProtocol

@property (nonatomic,copy)NSString * title;
@property (nonatomic,copy)NSString * imageUrl;

@end

@protocol ItemIconTapViewDelegate

-(void)iconDidTap:(ItemIconTapView*)iconView ViewModel:(id <ItemIconTapViewModelProtocol>) viewModel;
@end

@interface ItemIconTapView : UIView

@property (nonatomic,retain)id <ItemIconTapViewModelProtocol> viewModel;

@end

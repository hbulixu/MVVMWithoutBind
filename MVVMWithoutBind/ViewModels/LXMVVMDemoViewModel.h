//
//  LXDemo1ViewModel.h
//  LXViewController
//
//  Created by 58 on 2018/6/29.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LXListViewModelProtocol.h"
@interface LXMVVMDemoViewModel : NSObject<LXListViewModelProtocol>

@property (nonatomic,strong)NSMutableArray <LXRow *> * listItems;

@property (nonatomic,assign)BOOL canLoadMore;
@property (nonatomic,assign)BOOL hasNoContent;

-(void)getListFromServiceFinish:(void(^)(NSError * error, NSArray * listItems)) finishBlock;

-(void)loadMoreListFromServiceFinish:(void(^)(NSError * error, NSArray * listItems)) finishBlock;


@end

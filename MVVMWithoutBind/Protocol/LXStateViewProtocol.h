//
//  LXStateViewProtocol.h
//  MVVMWithoutBind
//
//  Created by 58 on 2018/7/4.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LXStateViewDelegate <NSObject>

-(void)didClickRefreshButton;

@end

@protocol LXStateViewProtocol

@property (nonatomic, weak) id <LXStateViewDelegate> delegate;

@end

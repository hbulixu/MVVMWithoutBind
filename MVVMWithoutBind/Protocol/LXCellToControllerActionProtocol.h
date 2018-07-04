//
//  LXCellToControllerActionProtocol.h
//  LXViewController
//
//  Created by 58 on 2018/6/27.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LXCellToControllerActionProtocol 

- (void)actionFromView:(UIView *)view
          withEventTag:(NSString *)tag
   withParameterObject:(id)object;

@end

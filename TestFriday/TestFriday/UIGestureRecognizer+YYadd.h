//
//  UIGestureRecognizer+YYadd.h
//  TestFriday
//
//  Created by silicon on 16/10/26.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIGestureRecognizer (YYadd)

- (instancetype)initWithActionBlock:(void(^)(id sender))block;



@end

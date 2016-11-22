//
//  YYCGUtilities.m
//  TestFriday
//
//  Created by silicon on 16/10/24.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//
#import <Accelerate/Accelerate.h>
#import "YYCGUtilities.h"

CGSize YYScreenSize() {
    static CGSize size;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        size = [UIScreen mainScreen].bounds.size;
        if (size.height < size.width) {
            CGFloat tmp = size.height;
            size.height = size.width;
            size.width = tmp;
        }
    });
    return size;
}

@implementation YYCGUtilities

@end

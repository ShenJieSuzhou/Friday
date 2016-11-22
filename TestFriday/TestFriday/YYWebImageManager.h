//
//  YYWebImageManager.h
//  TestFriday
//
//  Created by silicon on 16/11/16.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef UIImage * _Nullable (^YYWebImageTransformBlock)(UIImage *image, NSURL *url);


@interface YYWebImageManager : NSObject

+ (instancetype)sharedManager;

@end

//
//  YYWebImageManager.m
//  TestFriday
//
//  Created by silicon on 16/11/16.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "YYWebImageManager.h"
#import "YYImageCache.h"

@implementation YYWebImageManager


+ (instancetype)sharedManager{
    static YYWebImageManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        YYImageCache *cache = [YYImageCache shareCache];
    });
    
    return manager;
}


@end

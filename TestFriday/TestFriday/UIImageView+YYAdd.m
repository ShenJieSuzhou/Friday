//
//  UIImageView+YYAdd.m
//  TestFriday
//
//  Created by silicon on 16/10/26.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "UIImageView+YYAdd.h"

@implementation UIImageView (YYAdd)

- (void)setImageWithURL:(NSURL *)imageURL
               progress:(YYWebImageProgressBlock)process
             completion:(YYWebImageCompletionBlock)completion{
    
    
    if(!imageURL){
        self.image = nil;
        return;
    }

    
}

//- (void)loadImage:(NSURL *)url{
//    NSData *imageData = [[NSData alloc] initWithContentsOfURL:url];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self setImage:[UIImage imageWithData:imageData]];
//    });
//}

@end

//
//  UIImageView+YYAdd.m
//  TestFriday
//
//  Created by silicon on 16/10/26.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "UIImageView+YYAdd.h"
#import <SDWebImage/SDWebImageDownloader.h>
#import <SDWebImage/SDWebImageManager.h>

@implementation UIImageView (YYAdd)

- (void)setImageWithURL:(NSURL *)imageURL
               progress:(YYWebImageProgressBlock)process
             completion:(YYWebImageCompletionBlock)completion{
    
    
    if(!imageURL){
        self.image = nil;
        return;
    }
    
    
    
    
    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:imageURL options:SDWebImageDownloaderProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        process(receivedSize, expectedSize);
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
        completion(image, data, error, finished);
    }];
    
    
//    [[SDWebImageManager sharedManager] ]
    
    
}

//- (void)loadImage:(NSURL *)url{
//    NSData *imageData = [[NSData alloc] initWithContentsOfURL:url];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self setImage:[UIImage imageWithData:imageData]];
//    });
//}

@end

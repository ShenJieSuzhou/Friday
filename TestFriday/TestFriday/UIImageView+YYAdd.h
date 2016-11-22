//
//  UIImageView+YYAdd.h
//  TestFriday
//
//  Created by silicon on 16/10/26.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YYKit.h"

typedef void(^YYWebImageProgressBlock)(NSInteger receivedSize, NSInteger expectedSize);
typedef void(^YYWebImageCompletionBlock)(UIImage *image, NSData *data, NSError *error, BOOL finished);

@interface UIImageView (YYAdd)

//@property (nonatomic, strong, readonly)           NSURLRequest      *request;  ///< The image URL request.
//@property (nullable, nonatomic, strong, readonly) NSURLResponse     *response; ///< The response for request.
//@property (nonatomic, strong) NSURLConnection *connection;
//@property (nonatomic, assign) NSInteger expectedSize;

- (void)setImageWithURL:(NSURL *)imageURL
               progress:(YYWebImageProgressBlock)process
             completion:(YYWebImageCompletionBlock)completion;

@end

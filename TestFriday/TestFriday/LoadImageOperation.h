//
//  LoadImageOperation.h
//  TestFriday
//
//  Created by silicon on 16/6/28.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class LoadImageOperation;
@protocol LoadImageDelegate <NSObject>
- (void)downloadOperation:(LoadImageOperation *)operation didFinishDownLoad:(NSData *)image;
@optional
- (void)downloadOperation:(LoadImageOperation *)operation didFinishDownLoad:(NSData *)image Index:(int)index;
@end

@interface LoadImageOperation : NSOperation
@property (strong, nonatomic) NSString *imgUrl;
@property (strong, nonatomic) id<LoadImageDelegate> delegate;

@end

//
//  YYAnimateImageView.h
//  TestFriday
//
//  Created by silicon on 16/12/23.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYAnimateImageView : UIImageView

@property (nonatomic) BOOL autoPlayAnimatedImage;

@property (nonatomic) NSUInteger currentAnimatedImageIndex;

@property (nonatomic, readonly) BOOL currentIsPlayingAnimation;

@property (nonatomic, copy) NSString *runloopMode;

@property (nonatomic) NSUInteger maxBufferSize;

@end

@protocol YYAnimatedImage <NSObject>
@required
/// Total animated frame count.
/// If the frame count is less than 1, then the methods below will be ignored.
- (NSUInteger)animatedImageFrameCount;

/// Animation loop count, 0 means infinite looping.
- (NSUInteger)animatedImageLoopCount;

/// Bytes per frame (in memory). It may used to optimize memory buffer size.
- (NSUInteger)animatedImageBytesPerFrame;

/// Returns the frame image from a specified index.
/// This method may be called on background thread.
/// @param index  Frame index (zero based).
- (nullable UIImage *)animatedImageFrameAtIndex:(NSUInteger)index;

/// Returns the frames's duration from a specified index.
/// @param index  Frame index (zero based).
- (NSTimeInterval)animatedImageDurationAtIndex:(NSUInteger)index;

@optional
/// A rectangle in image coordinates defining the subrectangle of the image that
/// will be displayed. The rectangle should not outside the image's bounds.
/// It may used to display sprite animation with a single image (sprite sheet).
- (CGRect)animatedImageContentsRectAtIndex:(NSUInteger)index;

@end

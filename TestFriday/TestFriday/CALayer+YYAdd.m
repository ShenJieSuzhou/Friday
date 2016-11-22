//
//  CALayer+YYAdd.m
//  TestFriday
//
//  Created by silicon on 16/10/26.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "CALayer+YYAdd.h"

@implementation CALayer (YYAdd)

- (CGFloat)height {
    return self.frame.size.height;
}

- (CGSize)frameSize {
    return self.frame.size;
}

- (void)setFrameSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}


@end

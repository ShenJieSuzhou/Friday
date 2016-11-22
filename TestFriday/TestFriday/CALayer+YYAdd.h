//
//  CALayer+YYAdd.h
//  TestFriday
//
//  Created by silicon on 16/10/26.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CALayer (YYAdd)

@property (nonatomic) CGFloat height;      ///< Shortcut for frame.size.height.
@property (nonatomic, getter=frameSize, setter=setFrameSize:) CGSize  size; ///< Shortcut for frame.size.

@end

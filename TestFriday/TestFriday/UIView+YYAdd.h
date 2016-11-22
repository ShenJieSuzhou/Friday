//
//  UIView+YYAdd.h
//  TestFriday
//
//  Created by silicon on 16/10/26.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YYAdd)


@property (nonatomic) CGFloat width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat centerY;     ///< Shortcut for center.y

@property (nonatomic) CGSize  size;        ///< Shortcut for frame.size.

@end

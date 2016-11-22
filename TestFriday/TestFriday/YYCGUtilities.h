//
//  YYCGUtilities.h
//  TestFriday
//
//  Created by silicon on 16/10/24.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

CGSize YYScreenSize();

// main screen's size (portrait)
#ifndef kScreenSize
#define kScreenSize YYScreenSize()
#endif

// main screen's width (portrait)
#ifndef kScreenWidth
#define kScreenWidth YYScreenSize().width
#endif

// main screen's height (portrait)
#ifndef kScreenHeight
#define kScreenHeight YYScreenSize().height
#endif

@interface YYCGUtilities : NSObject

@end

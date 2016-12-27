//
//  UIColor.h
//  TestFriday
//
//  Created by silicon on 16/12/23.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#ifndef UIColorHex
#define UIColorHex(_hex_)   [UIColor colorWithHexString:((__bridge NSString *)CFSTR(#_hex_))]
#endif

@interface UIColor (YYAdd)


+ (nullable UIColor *)colorWithHexString:(NSString *)hexStr;

@end

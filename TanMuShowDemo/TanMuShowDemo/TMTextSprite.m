//
//  TMTextSprite.m
//  TanMuShowDemo
//
//  Created by silicon on 17/3/24.
//  Copyright © 2017年 com.snailgames. All rights reserved.
//

#import "TMTextSprite.h"
#import <MLEmojiLabel.h>

@implementation TMTextSprite

- (UIView *)bindingView
{
    MLEmojiLabel * label = [[MLEmojiLabel alloc]initWithFrame:CGRectZero];
    label.text = self.text;
    label.textColor = self.textColor;
    label.font = [UIFont systemFontOfSize:self.fontSize];
    if (self.cornerRadius > 0) {
        label.layer.cornerRadius = self.cornerRadius;
        label.clipsToBounds = YES;
    }
    label.layer.borderColor = self.borderColor.CGColor;
    label.layer.borderWidth = self.borderWidth;
    label.backgroundColor = self.backgroundColor;
    
    label.backgroundColor = [UIColor clearColor];
    label.lineBreakMode = NSLineBreakByCharWrapping;
    label.isNeedAtAndPoundSign = YES;
    return label;
}

@end

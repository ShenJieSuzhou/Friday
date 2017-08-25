//
//  YYTextView.h
//  TestFriday
//
//  Created by silicon on 16/12/28.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYTextView : UIScrollView<UITextInput, UIScrollViewDelegate>

@property (null_resettable, nonatomic, copy) NSString *text;

@property (nullable, nonatomic, copy) NSString *placeholderText;

@property (nullable, nonatomic, copy) UIImageView *placeHolderView;

/**
 Scrolls the receiver until the text in the specified range is visible.
 */
- (void)scrollRangeToVisible:(NSRange)range;

@end

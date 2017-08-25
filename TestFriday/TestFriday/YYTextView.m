//
//  YYTextView.m
//  TestFriday
//
//  Created by silicon on 16/12/28.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "YYTextView.h"

@implementation YYTextView


- (void)_initTextView {
    self.delaysContentTouches = NO;
    self.canCancelContentTouches = YES;
    self.multipleTouchEnabled = NO;
    self.clipsToBounds = YES;
    [super setDelegate:self];
    
    _text = @"";
    
    _placeHolderView = [UIImageView new];
    _placeHolderView.userInteractionEnabled = NO;
    _placeHolderView.hidden = YES;

    [self addSubview:_placeHolderView];
}

#pragma mark - Public

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(!self) return nil;
    [self _initTextView];
    
    return self;
}

- (void)dealloc{
    
}

- (void)scrollRangeToVisible:(NSRange)range {
    
}

- (void)setFrame:(CGRect)frame{
    CGSize oldSize = self.bounds.size;
    [super setFrame:frame];
    CGSize newSize = self.bounds.size;

    [self _updateLayout];
}

- (void)_updateLayout{
    _placeHolderView.hidden = _text.length > 0;
    CGSize visibleSize = [self _getVisibleSize];
    CGSize size;
    size.width = visibleSize.width;
    size.height = visibleSize.height;
    self.contentSize = size;
}


/// Visible size based on bounds and insets
- (CGSize)_getVisibleSize {
    CGSize visibleSize = self.bounds.size;
    visibleSize.width -= self.contentInset.left - self.contentInset.right;
    visibleSize.height -= self.contentInset.top - self.contentInset.bottom;
    if (visibleSize.width < 0) visibleSize.width = 0;
    if (visibleSize.height < 0) visibleSize.height = 0;
    return visibleSize;
}


@end

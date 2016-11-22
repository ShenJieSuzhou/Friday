//
//  LoadImageOperation.m
//  TestFriday
//
//  Created by silicon on 16/6/28.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "LoadImageOperation.h"

@implementation LoadImageOperation
@synthesize imgUrl = _imgUrl;
@synthesize delegate = _delegate;

- (void)main{
    NSURL *url = [NSURL URLWithString:self.imgUrl];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    if([self.delegate respondsToSelector:@selector(downloadOperation:didFinishDownLoad:)]){
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegate downloadOperation:self didFinishDownLoad:data];
        });
    }
}

@end

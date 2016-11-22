//
//  NSThreadTest.h
//  TestFriday
//
//  Created by silicon on 16/6/22.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^imageLoadBlock)(NSData *imageData);

@interface NSThreadTest : NSObject

@property (strong, nonatomic) imageLoadBlock imageBlock;

+ (NSThreadTest *)getInstance;

- (void)startOptionWithImageUrl:(int)choice url:(NSString *)url Block:(imageLoadBlock)block;

@end

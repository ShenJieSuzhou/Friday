//
//  GCDTest.h
//  TestFriday
//
//  Created by silicon on 16/6/28.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^imageDownLoadBlock)(NSData *data);

@interface GCDTest : NSObject
@property (strong, nonatomic) imageDownLoadBlock block;

+ (GCDTest *)getInstance;

- (void)gcdSerialThreadTest:(NSString *)url withBlock:(imageDownLoadBlock) block;

- (void)gcdConcurrentThreadTest:(NSString *)url withBlock:(imageDownLoadBlock) block;

@end

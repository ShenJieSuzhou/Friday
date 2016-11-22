//
//  GCDTest.m
//  TestFriday
//
//  Created by silicon on 16/6/28.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "GCDTest.h"

@implementation GCDTest
@synthesize block = _block;

+ (GCDTest *)getInstance{
    static GCDTest *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    
    return _instance;
}

- (void)gcdSerialThreadTest:(NSString *)url withBlock:(imageDownLoadBlock) block{
    self.block = block;
    //创建一个串行队列
    //第一个参数 创建队列名称，方便Debug
    //第二个参数 对列类型 DISPATCH_QUEUE_SERIAL（串行）DISPATCH_QUEUE_CONCURRENT（并发，实际上不使用该方式创建）
    dispatch_queue_t serialQueue = dispatch_queue_create("myThread", DISPATCH_QUEUE_SERIAL);
    dispatch_async(serialQueue, ^{
        [self loadImage:url];
    });
}

- (void)gcdConcurrentThreadTest:(NSString *)url withBlock:(imageDownLoadBlock) block{
    self.block = block;
    //创建一个并行队列
    //线程优先级
    //传0
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(globalQueue, ^{
        [self loadImage:url];
    });
}

- (void)loadImage:(NSString *)url{
    NSURL *mUrl = [NSURL URLWithString:url];
    NSData *data = [NSData dataWithContentsOfURL:mUrl];
    dispatch_async(dispatch_get_main_queue(), ^{
        self.block(data);
    });
}

@end

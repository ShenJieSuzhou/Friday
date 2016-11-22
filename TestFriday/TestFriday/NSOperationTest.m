//
//  NSOperationTest.m
//  TestFriday
//
//  Created by silicon on 16/6/26.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "NSOperationTest.h"

@implementation NSOperationTest
@synthesize delegate = _delegate;

+ (NSOperationTest *)getInstance{
    static NSOperationTest *_instance = nil;
    static dispatch_once_t onceToken1;
    
    dispatch_once(&onceToken1, ^{
        _instance = [[self alloc] init];
    });
    
    return _instance;
}

/*
 *NSInvocationOperation 方式
 */
- (void)NSInvocationOperationTest:(NSString *)url{
    NSInvocationOperation *invaocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(loadImage:) object:url];

    NSOperationQueue *operationqueue = [[NSOperationQueue alloc] init];
    [operationqueue addOperation:invaocationOperation];
}

/*
 *NSBlockOperation 方式
 */
- (void)NSBlockOperationTest:(NSString *)url{
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
//    //创建操作块添加到队列
//    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
//        [self loadImage:url];
//    }];
//    [operationQueue addOperation:blockOperation];
    
    
    //直接使用操作队列添加操作
    [operationQueue addOperationWithBlock:^{
        [self loadImage:url];
    }];
}

- (void)NSBlockOperationTest:(NSString *)url Index:(int)index{
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    [operationQueue addOperationWithBlock:^{
        [self loadImage:url Index:index];
    }];
}

- (void)depandenceTest:(NSArray *)urlArray{
    int count = 5;
    //创建操作队列
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    //设置最大并发线程数量
    operationQueue.maxConcurrentOperationCount = 5;
    
    NSBlockOperation *lastBlockOperation = [NSBlockOperation blockOperationWithBlock:^{
        [self loadImage:[urlArray objectAtIndex:count - 1]];
    }];
    
    for(int i = 0; i < count - 1; i++){
        NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
            [self loadImage:[urlArray objectAtIndex:i]];
        }];
        //设置依赖操作
        [blockOperation addDependency:lastBlockOperation];
        [operationQueue addOperation:blockOperation];
    }
    
    //将最后的操作加入线程队列
    [operationQueue addOperation:lastBlockOperation];
}


- (void)loadImage:(NSString *)url{
    NSURL *mUrl = [NSURL URLWithString:url];
    NSData *data = [NSData dataWithContentsOfURL:mUrl];
    
    if([self.delegate respondsToSelector:@selector(downloadOperation:didFinishDownLoad:)]){
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegate downloadOperation:nil didFinishDownLoad:data];
        });
    }
}

- (void)loadImage:(NSString *)url Index:(int)index{
    NSURL *mUrl = [NSURL URLWithString:url];
    NSData *data = [NSData dataWithContentsOfURL:mUrl];
    
    if([self.delegate respondsToSelector:@selector(downloadOperation:didFinishDownLoad:Index:)]){
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegate downloadOperation:nil didFinishDownLoad:data Index:index];
        });
    }
}

@end

//
//  NSThreadTest.m
//  TestFriday
//
//  Created by silicon on 16/6/22.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "NSThreadTest.h"

@implementation NSThreadTest

+ (NSThreadTest *)getInstance{
    static NSThreadTest *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    
    return _instance;
}

- (void)startOptionWithImageUrl:(int)choice url:(NSString *)url Block:(imageLoadBlock)block{
    self.imageBlock = block;
    
    if(choice == 1){
        [[NSThreadTest getInstance] dymaticCreateThread:url];
    }else if(choice == 2){
        [self staticCreateThread:url];
    }else{
        [self bkCreatThread:url];
    }
}

//动态创建NSThread
- (void)dymaticCreateThread:(NSString *)url{
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(downLoadImage:) object:url];
    [thread start];
}

//静态创建NSThread
- (void)staticCreateThread:(NSString *)url{
    [NSThread detachNewThreadSelector:@selector(downLoadImage:) toTarget:self withObject:url];
}

//在后台创建NSThread
- (void)bkCreatThread:(NSString *)url{
    [self performSelectorInBackground:@selector(downLoadImage:) withObject:url];
}

- (void)downLoadImage:(NSString *)imageUrl{
    NSURL *url = [NSURL URLWithString:imageUrl];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    //在主线程中更新界面
    [self performSelectorOnMainThread:@selector(loadTheImage:) withObject:data waitUntilDone:YES];
}

- (void)loadTheImage:(NSData *)mdata{
    self.imageBlock(mdata);
}

@end

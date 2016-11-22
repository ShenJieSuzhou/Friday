//
//  MyTestUtil.m
//  TestFriday
//
//  Created by silicon on 16/10/13.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "MyTestUtil.h"

@implementation MyTestUtil

+ (MyTestUtil *)shareInstance{
    static MyTestUtil *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[MyTestUtil alloc] init];
        NSLog(@"11111");
    });
    
    return _instance;
}

- (void)startTest:(id<TestDelegate>) delegate{
    [MyTestUtil shareInstance].m_delegate = delegate;
    [[NSNotificationCenter defaultCenter] addObserver:[MyTestUtil shareInstance] selector:@selector(doSomeThing:) name:@"NOTIFICATION_MSG" object:nil];
}

- (void)triggerTheDelegate{
    [[MyTestUtil shareInstance].m_delegate onTestCallBack:@"我被触发了"];
}

- (void)doSomeThing:(NSNotification *)notify{
    NSLog(@"222222");
}

@end

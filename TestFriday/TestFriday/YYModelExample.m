//
//  YYModelExample.m
//  TestFriday
//
//  Created by silicon on 17/4/20.
//  Copyright © 2017年 com.snailgames. All rights reserved.
//

#import "YYModelExample.h"

@implementation YYModelExample

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //第一种方法： NSFileManager实例方法读取数据
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
    NSString* thepath = [paths lastObject];
    thepath = [thepath stringByAppendingPathComponent:@"example.txt"];
    NSFileManager* fm = [NSFileManager defaultManager];
    NSData* data = [[NSData alloc] init];
    data = [fm contentsAtPath:thepath];
    NSLog(@"%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
}



@end

//
//  NSData+YYAdd.m
//  TestFriday
//
//  Created by silicon on 17/5/17.
//  Copyright © 2017年 com.snailgames. All rights reserved.
//

#import "NSData+YYAdd.h"

@implementation NSData (YYAdd)

+ (NSData *)dataNamed:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@""];
    if (!path) return nil;
    NSData *data = [NSData dataWithContentsOfFile:path];
    return data;
}

@end

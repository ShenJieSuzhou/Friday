//
//  NSOperationTest.h
//  TestFriday
//
//  Created by silicon on 16/6/26.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoadImageOperation.h"

@interface NSOperationTest : NSObject
@property (strong, nonatomic) id<LoadImageDelegate> delegate;

+ (NSOperationTest *)getInstance;

- (void)NSInvocationOperationTest:(NSString *)url;

- (void)NSBlockOperationTest:(NSString *)url;

- (void)NSBlockOperationTest:(NSString *)url Index:(int)index;

@end

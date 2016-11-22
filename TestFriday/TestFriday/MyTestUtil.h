//
//  MyTestUtil.h
//  TestFriday
//
//  Created by silicon on 16/10/13.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestDelegate.h"



@interface MyTestUtil : NSObject
@property (strong, nonatomic) id<TestDelegate> m_delegate;


+ (MyTestUtil *)shareInstance;

- (void)startTest:(id<TestDelegate>) delegate;

- (void)triggerTheDelegate;

@end

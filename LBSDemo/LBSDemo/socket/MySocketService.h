//
//  MySocketService.h
//  LBSDemo
//
//  Created by silicon on 17/5/16.
//  Copyright © 2017年 com.snailgames. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDAsyncSocket.h"


@interface MySocketService : NSObject

+ (MySocketService *)getInstance;

- (void)connetToServer:(NSString *)address onPort:(uint16_t)port;

@end

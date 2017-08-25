//
//  NSObject+YYModel.h
//  TestFriday
//
//  Created by silicon on 17/5/17.
//  Copyright © 2017年 com.snailgames. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface NSObject (YYModel)

+ (nullable instancetype)modelWithJSON:(id)json;

@end
NS_ASSUME_NONNULL_END

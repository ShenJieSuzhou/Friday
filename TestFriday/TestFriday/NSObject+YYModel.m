//
//  NSObject+YYModel.m
//  TestFriday
//
//  Created by silicon on 17/5/17.
//  Copyright © 2017年 com.snailgames. All rights reserved.
//

#import "NSObject+YYModel.h"


@implementation NSObject (YYModel)

+ (NSDictionary *)yy_DictionaryWithJSON:(id)json{
    if(!json){
        return nil;
    }
    
    NSDictionary *dic = nil;
    NSData *jsonData = nil;
    
    if([json isKindOfClass:[NSDictionary class]]){
        dic = json;
    }else if([json isKindOfClass:[NSString class]]){
        jsonData = [(NSString *)json dataUsingEncoding:NSUTF8StringEncoding];
    }else if([json isKindOfClass:[NSData class]]){
        jsonData = json;
    }
    
    if(jsonData){
        dic = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:NULL];
    }
    return dic;
}

+ (instancetype)modelWithJSON:(id)json{
    NSDictionary *dic = [self yy_DictionaryWithJSON:json];
//    return [self ]
    return self;
}

@end

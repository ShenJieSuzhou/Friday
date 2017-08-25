//
//  WWLocationManager.m
//  LBSDemo
//
//  Created by silicon on 17/4/19.
//  Copyright © 2017年 com.snailgames. All rights reserved.
//

#import "WWLocationManager.h"

@implementation WWLocationManager

- (instancetype)init
{
    self = [super init];
    if ( self )
    {
        self.delegate = self;
        self.desiredAccuracy = kCLLocationAccuracyBest;
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = locations[0];
    
    NSLog(@"%@",location);
    
    //根据实际情况来调整触发范围
    [self adjustDistanceFilter:location];
    
    //上传数据
    [self uploadLocation:location];
}

- (void)adjustDistanceFilter:(CLLocation*)location
{
        NSLog(@"adjust:%f",location.speed);
    
//    if ( location.speed < self.minSpeed )
//    {
//        if ( fabs(self.distanceFilter-self.minFilter) > 0.1f )
//        {
//            self.distanceFilter = self.minFilter;
//        }
//    }
//    else
//    {
//        CGFloat lastSpeed = self.distanceFilter/self.minInteval;
//        
//        if ( (fabs(lastSpeed-location.speed)/lastSpeed > 0.1f) || (lastSpeed < 0) )
//        {
//            CGFloat newSpeed  = (int)(location.speed+0.5f);
//            CGFloat newFilter = newSpeed*self.minInteval;
//            
//            self.distanceFilter = newFilter;
//        }
//    }
}

- (void)uploadLocation:(CLLocation*)location{
    
}

@end

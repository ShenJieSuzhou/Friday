//
//  ShowExampleViewController.h
//  TestFriday
//
//  Created by silicon on 16/7/3.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "NSThreadTest.h"
#import "NSOperationTest.h"
#import "LoadImageOperation.h"

@interface ShowExampleViewController : UIViewController<LoadImageDelegate>

@property (strong, nonatomic) NSMutableArray *imagesArray;
@property (strong, nonatomic) NSMutableArray *urlArrays;

@end

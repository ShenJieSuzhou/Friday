//
//  DemoNSOperationController.h
//  TestFriday
//
//  Created by silicon on 16/7/1.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadImageOperation.h"
#import "NSOperationTest.h"
@interface DemoNSOperationController : UIViewController<LoadImageDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;


@property (strong, nonatomic) IBOutlet UIButton *topBtn;

@property (strong, nonatomic) IBOutlet UIButton *midBtn;

@property (strong, nonatomic) IBOutlet UIButton *buttomBtn;

@property (strong, nonatomic) NSOperationTest *nsopTest;



@end

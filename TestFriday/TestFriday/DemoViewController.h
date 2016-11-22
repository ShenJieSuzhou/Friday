//
//  DemoViewController.h
//  TestFriday
//
//  Created by silicon on 16/6/22.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadImageOperation.h"

@interface DemoViewController : UIViewController<LoadImageDelegate>

@property (strong, nonatomic) IBOutlet UIButton *testBtnTop;

@property (strong, nonatomic) IBOutlet UIButton *testBtnMiddle;

@property (strong, nonatomic) IBOutlet UIButton *testBtnButtom;

@property (strong, nonatomic) IBOutlet UIImageView *testImgView;

@end

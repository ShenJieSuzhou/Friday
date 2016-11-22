//
//  ViewController.h
//  TestFriday
//
//  Created by silicon on 16/6/16.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DemoViewController.h"
#import "DemoGCDViewController.h"
#import "DemoNSOperationController.h"
#import "ShowExampleViewController.h"
#import "TestDelegate.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, TestDelegate>

@property (strong, nonatomic) UITableView *mTableView;
@property (strong, nonatomic) NSMutableArray *mDataSource;
@property (strong, nonatomic) DemoViewController *demoView;
@property (strong, nonatomic) DemoNSOperationController *demoNSOperView;
@property (strong, nonatomic) DemoGCDViewController *demoGCDView;
@property (strong, nonatomic) ShowExampleViewController *showExample;

@property (strong, nonatomic) UIButton *button;

@end



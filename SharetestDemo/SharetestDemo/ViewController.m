//
//  ViewController.m
//  SharetestDemo
//
//  Created by silicon on 2017/6/29.
//  Copyright © 2017年 com.snailgames. All rights reserved.
//

#import "ViewController.h"
#import "WechatShareUtil.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [WechatShareUtil initWeChat:[NSMutableArray arrayWithObjects:@"wxc3b945725f81b615",@"11111", nil]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)test:(id)sender {
    [WechatShareUtil jumpToWchatPlatfrom:[NSMutableArray arrayWithObjects:@"gh_ba06f43d362e", nil]];
}

@end

//
//  DemoGCDViewController.m
//  TestFriday
//
//  Created by silicon on 16/7/1.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "DemoGCDViewController.h"

@interface DemoGCDViewController ()

@end

@implementation DemoGCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.topBtn setTitle:@"串行" forState:0];
    [self.buttomBtn setTitle:@"并行" forState:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)topClick:(id)sender {
    self.imageView.image = nil;
    
    [[GCDTest getInstance] gcdSerialThreadTest:@"http://img.blog.csdn.net/20160622181936607" withBlock:^(NSData *data) {
        [self.imageView setImage:[UIImage imageWithData:data]];
    }];
}


- (IBAction)buttomClick:(id)sender {
    self.imageView.image = nil;
    
    [[GCDTest getInstance] gcdConcurrentThreadTest:@"http://img.blog.csdn.net/20160622181936607" withBlock:^(NSData *data) {
        [self.imageView setImage:[UIImage imageWithData:data]];
    }];
}


@end

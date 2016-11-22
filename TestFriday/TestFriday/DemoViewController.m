//
//  DemoViewController.m
//  TestFriday
//
//  Created by silicon on 16/6/22.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "DemoViewController.h"
#import "NSThreadTest.h"
@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.testBtnTop setTitle:@"dymaticCreateThread" forState:UIControlStateNormal];
    [self.testBtnMiddle setTitle:@"staticCreateThread" forState:UIControlStateNormal];
    [self.testBtnButtom setTitle:@"bkCreatThread" forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)OnTopButton:(id)sender {
    [self.testImgView setImage:nil];
    [[NSThreadTest getInstance] startOptionWithImageUrl:1 url:@"http://img.blog.csdn.net/20160622181936607" Block:^(NSData *imageData) {
        [self.testImgView setImage:[UIImage imageWithData:imageData]];
    }];
}


- (IBAction)OnMiddleButton:(id)sender {
   [self.testImgView setImage:nil];
    [[NSThreadTest getInstance] startOptionWithImageUrl:2 url:@"http://img.blog.csdn.net/20160622181936607" Block:^(NSData *imageData) {
        [self.testImgView setImage:[UIImage imageWithData:imageData]];
    }];
}


- (IBAction)OnButtomBtn:(id)sender {
    [self.testImgView setImage:nil];
    [[NSThreadTest getInstance] startOptionWithImageUrl:3 url:@"http://img.blog.csdn.net/20160622181936607" Block:^(NSData *imageData) {
        [self.testImgView setImage:[UIImage imageWithData:imageData]];
    }];
}

- (void)downloadOperation:(LoadImageOperation *)operation didFinishDownLoad:(NSData *)image{
    [self.testImgView setImage:[UIImage imageWithData:image]];
}

@end

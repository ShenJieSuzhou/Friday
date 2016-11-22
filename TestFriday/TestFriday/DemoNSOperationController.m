//
//  DemoNSOperationController.m
//  TestFriday
//
//  Created by silicon on 16/7/1.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "DemoNSOperationController.h"

@interface DemoNSOperationController ()

@end

@implementation DemoNSOperationController
@synthesize nsopTest = _nsopTest;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [NSOperationTest getInstance].delegate = self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.topBtn setTitle:@"NSInvocationOperation" forState:UIControlStateNormal];
    [self.midBtn setTitle:@"NSBlockOperation" forState:UIControlStateNormal];
    [self.buttomBtn setTitle:@"CustomNSOperation" forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)topClick:(id)sender {
    self.imageView.image = nil;
    [[NSOperationTest getInstance] NSInvocationOperationTest:@"http://img.blog.csdn.net/20160622181936607"];
}


- (IBAction)midClick:(id)sender {
    self.imageView.image = nil;
    [[NSOperationTest getInstance] NSBlockOperationTest:@"http://img.blog.csdn.net/20160622181936607"];
}

- (IBAction)buttomClick:(id)sender {
    self.imageView.image = nil;
    LoadImageOperation *loadtest = [[LoadImageOperation alloc] init];
    loadtest.imgUrl = @"http://img.blog.csdn.net/20160622181936607";
    loadtest.delegate = self;
    
    NSOperationQueue *operationqueue = [[NSOperationQueue alloc] init];
    [operationqueue addOperation:loadtest];
}

- (void)downloadOperation:(LoadImageOperation *)operation didFinishDownLoad:(NSData *)image{
    [self.imageView setImage:[UIImage imageWithData:image]];
}


@end

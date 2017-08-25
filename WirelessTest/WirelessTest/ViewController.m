//
//  ViewController.m
//  WirelessTest
//
//  Created by silicon on 2017/6/15.
//  Copyright © 2017年 com.snailgames. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UIButton *btn;

@end

@implementation ViewController
@synthesize btn = _btn;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.btn setTitle:@"test" forState:UIControlStateNormal];
    [self.btn setBackgroundColor:[UIColor blueColor]];
    [self.btn setFrame:CGRectMake(0, 0, 100, 60)];
    
    [self.view addSubview:self.btn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

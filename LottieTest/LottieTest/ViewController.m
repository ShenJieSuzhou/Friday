//
//  ViewController.m
//  LottieTest
//
//  Created by silicon on 17/3/28.
//  Copyright © 2017年 com.snailgames. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) LOTAnimationView *lottieLogo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.lottieLogo = [LOTAnimationView animationNamed:@"LottieLogo1"];
    self.lottieLogo.contentMode = UIViewContentModeScaleAspectFit;

    [self.view addSubview:self.lottieLogo];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.lottieLogo play];
    
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    CGRect lottieRect = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    self.lottieLogo.frame = lottieRect;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

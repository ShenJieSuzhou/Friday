//
//  ViewController.m
//  LBSDemo
//
//  Created by silicon on 17/4/19.
//  Copyright © 2017年 com.snailgames. All rights reserved.
//

#import "ViewController.h"
#import <SnailQRCode/SnailQRCode.h>
//#import "MaskViewController.h"

@interface ViewController ()


@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SGQRCodeInformationFromeScanning:) name:@"SnailQRCodeInformationFromeScanning" object:nil];
    
    
//    UIImageView *imageV = [UIImageView ]

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)SGQRCodeInformationFromeScanning:(NSNotification *)noti {
    NSString *string = noti.object;
    NSLog(@"noti - - %@", string);
    
}


- (IBAction)startScan:(id)sender {
    [[SnailQRCode getInstance] startScanQRCode:self];
//    MaskViewController *maskView = [MaskViewController new];
//    [self presentViewController:maskView animated:NO completion:^{
//        
//    }];
}

- (void)connectToServer:(NSString *)ipAddress{

    
}


-(BOOL)shouldAutorotate{
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return UIInterfaceOrientationIsLandscape( interfaceOrientation );
}

// For ios6, use supportedInterfaceOrientations & shouldAutorotate instead
- (NSUInteger) supportedInterfaceOrientations{
#ifdef __IPHONE_6_0
    return UIInterfaceOrientationMaskLandscape;
#endif
}

@end

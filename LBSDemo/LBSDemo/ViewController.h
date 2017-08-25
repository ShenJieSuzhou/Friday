//
//  ViewController.h
//  LBSDemo
//
//  Created by silicon on 17/4/19.
//  Copyright © 2017年 com.snailgames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCDAsyncSocket.h"

@interface ViewController : UIViewController

- (IBAction)startScan:(id)sender;

- (void)connectToServer:(NSString *)ipAddress;


@end


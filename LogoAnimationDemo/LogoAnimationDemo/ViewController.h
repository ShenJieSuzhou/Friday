//
//  ViewController.h
//  LogoAnimationDemo
//
//  Created by silicon on 17/5/23.
//  Copyright © 2017年 com.snailgames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageViewAnimator.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) UIImageView *imageView;

@property (strong, nonatomic) UIImageViewAnimator *imageVAnimate;

@property (assign) int index;

@end


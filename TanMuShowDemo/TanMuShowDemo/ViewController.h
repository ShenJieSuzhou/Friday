//
//  ViewController.h
//  TanMuShowDemo
//
//  Created by silicon on 17/3/24.
//  Copyright © 2017年 com.snailgames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BarrageRenderer.h>
#import "AEViewController.h"

@interface ViewController : UIViewController<BarrageRendererDelegate>

@property (strong, nonatomic) BarrageRenderer *renderer;
@property (assign) NSUInteger index;
@property (strong, nonatomic) AEViewController *aeViewCtrl;

@end


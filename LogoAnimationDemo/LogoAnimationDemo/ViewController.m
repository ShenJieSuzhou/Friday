//
//  ViewController.m
//  LogoAnimationDemo
//
//  Created by silicon on 17/5/23.
//  Copyright © 2017年 com.snailgames. All rights reserved.
//

#import "ViewController.h"

#define VIEW_HEIGHT [UIScreen mainScreen].bounds.size.height
#define VIEW_WIDTH [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@end

@implementation ViewController
@synthesize imageView = _imageView;
@synthesize imageVAnimate = _imageVAnimate;
@synthesize index = _index;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imageView = [UIImageView new];;
    [self.imageView setFrame:self.view.bounds];
    [self.view addSubview:self.imageView];
    
    self.index = 1;
    
//    self.imageVAnimate = [[UIImageViewAnimator alloc] initWithFrame:self.view.bounds];
//
//    [self.imageVAnimate setBackgroundColor:[UIColor blueColor]];
//    [self.view addSubview:self.imageVAnimate];
    
    
//    [self.imageView setImage:[UIImage imageNamed:@"test.jpg"]];
//    
//    [UIView animateWithDuration:2.0 animations:^{
//
//        [self.view addSubview:self.imageView];
//        self.imageView.alpha = 0;
//    } completion:^(BOOL finished) {
//        [self.imageView removeFromSuperview];
//        
//        [UIView animateWithDuration:2.0 animations:^{
//            
//            [self.imageView setImage:[UIImage imageNamed:@"test2.jpg"]];
//            self.imageView.alpha = 1;
//            [self.view addSubview:self.imageView];
//        } completion:^(BOOL finished) {
//            
//           [UIView animateWithDuration:2.0 animations:^{
//               self.imageView.alpha = 0;
//           }];
//        }];
//    }];
    
//    [self.imageView startAnimating];
    
//    [self startHeaderAnimation:@"snail logo2旋转" Count:99];
    
    [self startFlashScreenAnimation:@"" Count:3 RootView:self];
    
}

-(void)start:(id)_context
{
    
}

- (void) stop:(id)_context
{
//    [self playDefaultAniation];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startFlashScreenAnimation:(NSString *)resName Count:(int)count RootView:(UIViewController *)rootView{

    [UIView animateWithDuration:2.0 animations:^{
        
        [self.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"test%d.png", self.index++]]];
        self.imageView.alpha = 1;
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:2.0 animations:^{
            self.imageView.alpha = 0;
        }];
        
        if(self.index <= count){
            [self startFlashScreenAnimation:@"" Count:3 RootView:self];
        }
    }];
}

- (void)startHeaderAnimation:(NSString *)resName Count:(int)count RootView:(UIViewController *)rootView{
    
    NSMutableArray *playArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 141; i++) {
        NSString *picName;
        if (i < 9) {
            picName = [NSString stringWithFormat:@"snail logo2旋转000%d.jpg",i+1];
        } else if (i < 99) {
            picName = [NSString stringWithFormat:@"snail logo2旋转00%d.jpg",i+1];
        } else {
            picName = [NSString stringWithFormat:@"snail logo2旋转0%d.jpg",i+1];
        }
        [playArray addObject:picName];
    }
    
    [self.imageVAnimate setCacheImages:NO];
    [self.imageVAnimate setDelegate:self];
    [self.imageVAnimate setStartSelector:@selector(start:)];
    [self.imageVAnimate setStopSelector:@selector(stop:)];
    
    
    if (![self.imageVAnimate isAnimating])
    {
        [self.imageVAnimate setImageNames:playArray];
        [self.imageVAnimate setDuration:3.1f];
        [self.imageVAnimate setIndex:0];
        [self.imageVAnimate startAnimating];
    }
}

- (void)dealloc {
    [self.imageVAnimate release];
    [super dealloc];
}

@end

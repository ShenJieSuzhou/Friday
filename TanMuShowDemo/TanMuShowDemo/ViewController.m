//
//  ViewController.m
//  TanMuShowDemo
//
//  Created by silicon on 17/3/24.
//  Copyright © 2017年 com.snailgames. All rights reserved.
//

#import "ViewController.h"
#import <BarrageDescriptor.h>

@interface ViewController ()

@end

@implementation ViewController

@synthesize renderer = _renderer;
@synthesize index = _index;
@synthesize aeViewCtrl = _aeViewCtrl;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _renderer = [[BarrageRenderer alloc]init];
    _renderer.delegate = self;
    _renderer.redisplay = YES;
    [self.view addSubview:_renderer.view];
    [self.view sendSubviewToBack:_renderer.view];
    
    _index = 0;
    NSInteger const number = 10;
    NSMutableArray * descriptors = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i < number; i++) {
        [descriptors addObject:[self walkTextSpriteDescriptorWithDelay:i*2+1]];
    }
    [_renderer load:descriptors];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startTanmu:(id)sender {
    
//    [_renderer start];
    
    if(!self.aeViewCtrl){
        self.aeViewCtrl = [[AEViewController alloc] init];
        [self.aeViewCtrl.view setFrame:self.view.bounds];
    }
    
    [self presentViewController:self.aeViewCtrl animated:YES completion:^{
        
    }];
}


- (IBAction)stopTanmu:(id)sender {
    [_renderer stop];
}

- (BarrageDescriptor *)walkTextSpriteDescriptorWithDelay:(NSTimeInterval)delay{

    BarrageDescriptor * descriptor = [[BarrageDescriptor alloc]init];
    descriptor.spriteName = NSStringFromClass([BarrageWalkTextSprite class]);
    descriptor.params[@"text"] = [NSString stringWithFormat:@"延时弹幕(延时%.0f秒):%ld",delay,(long)_index++];
    descriptor.params[@"textColor"] = [UIColor blueColor];
    descriptor.params[@"speed"] = @(100 * (double)random()/RAND_MAX+50);
    descriptor.params[@"direction"] = @(1);
    descriptor.params[@"delay"] = @(delay);

    return descriptor;
}
//
///// 图文混排精灵弹幕 - 过场图文弹幕A
//- (BarrageDescriptor *)walkImageTextSpriteDescriptorAWithDirection:(NSInteger)direction
//{
//    BarrageDescriptor * descriptor = [[BarrageDescriptor alloc]init];
//    descriptor.spriteName = NSStringFromClass([BarrageWalkImageTextSprite class]);
//    descriptor.params[@"text"] = [NSString stringWithFormat:@"AA-图文混排/::B过场弹幕:%ld",(long)_index++];
//    descriptor.params[@"textColor"] = [UIColor greenColor];
//    descriptor.params[@"speed"] = @(100 * (double)random()/RAND_MAX+50);
//    descriptor.params[@"direction"] = @(direction);
//    return descriptor;
//}
//
///// 图文混排精灵弹幕 - 过场图文弹幕B
//- (BarrageDescriptor *)walkImageTextSpriteDescriptorBWithDirection:(NSInteger)direction
//{
//    BarrageDescriptor * descriptor = [[BarrageDescriptor alloc]init];
//    descriptor.spriteName = NSStringFromClass([BarrageWalkTextSprite class]);
//    descriptor.params[@"text"] = [NSString stringWithFormat:@"AA-图文混排/::B过场弹幕:%ld",(long)_index++];
//    descriptor.params[@"textColor"] = [UIColor greenColor];
//    descriptor.params[@"speed"] = @(100 * (double)random()/RAND_MAX+50);
//    descriptor.params[@"direction"] = @(direction);
//    
//    NSTextAttachment * attachment = [[NSTextAttachment alloc]init];
//    attachment.image = [[UIImage imageNamed:@"avatar"]barrageImageScaleToSize:CGSizeMake(25.0f, 25.0f)];
//    NSMutableAttributedString * attributed = [[NSMutableAttributedString alloc]initWithString:
//                                              [NSString stringWithFormat:@"BB-图文混排过场弹幕:%ld",(long)_index++]];
//    [attributed insertAttributedString:[NSAttributedString attributedStringWithAttachment:attachment] atIndex:7];
//    
//    descriptor.params[@"attributedText"] = attributed;
//    descriptor.params[@"textColor"] = [UIColor magentaColor];
//    descriptor.params[@"speed"] = @(100 * (double)random()/RAND_MAX+50);
//    descriptor.params[@"direction"] = @(direction);
//    return descriptor;
//}



@end

//
//  YYWebImageExample.m
//  TestFriday
//
//  Created by silicon on 16/10/20.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "YYWebImageExample.h"
#import "YYKit.h"
#import <QuartzCore/QuartzCore.h>


//#import <SDWebImage/UIImageView+WebCache.h>
//#import <SDWebImage/FLAnimatedImageView+WebCache.h>


#define kCellHeight ceil((kScreenWidth) * 3.0 / 4.0)

#ifndef kSystemVersion
#define kSystemVersion [[UIDevice currentDevice].systemVersion floatValue]
#endif

#ifndef kiOS6Later
#define kiOS6Later (kSystemVersion >= 6)
#endif

#ifndef kiOS7Later
#define kiOS7Later (kSystemVersion >= 7)
#endif

#ifndef kiOS8Later
#define kiOS8Later (kSystemVersion >= 8)
#endif

#ifndef kiOS9Later
#define kiOS9Later (kSystemVersion >= 9)
#endif

@interface YYWebImageExampleCell : UITableViewCell
@property (nonatomic, strong) UIActivityIndicatorView *indicator;
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) UILabel *label;
//@property (nonatomic, strong) FLAnimatedImageView *webImageView;
@property (nonatomic, strong) UIImageView *webImageView;
@property (nonatomic, strong) dispatch_semaphore_t lock;

@end

@implementation YYWebImageExampleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.size = CGSizeMake(kScreenWidth, kCellHeight);
    self.contentView.size = self.size;
    
//    _webImageView = [FLAnimatedImageView new];
    
    _webImageView = [UIImageView new];
    _webImageView.size = self.size;
    _webImageView.clipsToBounds = YES;
    _webImageView.contentMode = UIViewContentModeScaleAspectFill;
    _webImageView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_webImageView];
    
    _label = [UILabel new];
    _label.size = self.size;
    _label.textAlignment= NSTextAlignmentCenter;
    _label.text = @"Load fail, tap to reload.";
    _label.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];
    _label.hidden = YES;
    _label.userInteractionEnabled = YES;
    [self.contentView addSubview:_label];
    
    CGFloat lineHeight = 4;
    _progressLayer = [CAShapeLayer new];
    _progressLayer.size = CGSizeMake(_webImageView.width, lineHeight);
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, _progressLayer.height / 2)];
    [path addLineToPoint:CGPointMake(_webImageView.width, _progressLayer.height / 2)];
    
    _progressLayer.lineWidth = lineHeight;
    _progressLayer.path = path.CGPath;
    _progressLayer.strokeColor = [UIColor colorWithRed:0 green:0.6 blue:1.0 alpha:0.72].CGColor;
    _progressLayer.lineCap = kCALineCapButt;
    _progressLayer.strokeStart = 0;
    _progressLayer.strokeEnd = 0;
    [_webImageView.layer addSublayer:_progressLayer];
    
    return self;
}

- (void)setImageURL:(NSURL *)url{
    _label.hidden = YES;
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.progressLayer.hidden = YES;
    self.progressLayer.strokeEnd = 0;
    [CATransaction commit];
    
//    [_webImageView sd_setImageWithURL:url placeholderImage:nil
//                              options:SDWebImageProgressiveDownload
//                             progress:^(NSInteger receivedSize,
//                                        NSInteger expectedSize,
//                                        NSURL * _Nullable targetURL) {
//                                 
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if(receivedSize > 0 && receivedSize > 0){
//                CGFloat progress = (CGFloat)receivedSize / expectedSize;
//                progress = progress < 0 ? 0 : progress > 1 ? 1 : progress;
//                if(_progressLayer.hidden) _progressLayer.hidden = NO;
//                _progressLayer.strokeEnd = progress;
//            }
//        });
//    } completed:^(UIImage * _Nullable image,
//                  NSError * _Nullable error,
//                  SDImageCacheType cacheType,
//                  NSURL * _Nullable imageURL) {
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if(image){
//                _progressLayer.hidden = YES;
//                CATransition *transition = [CATransition animation];
//                transition.duration = 0.2;
//                transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//                transition.type = kCATransitionFade;
//                [self.layer addAnimation:transition forKey:@"YYWebImageFade"];
//            }
//        });
//    }];
}

@end

@implementation YYWebImageExample{
    NSArray *_imageLinks;
}


- (void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"Reload" style:UIBarButtonItemStylePlain target:self action:@selector(reload)];
    
    self.navigationItem.rightBarButtonItem = button;
    self.view.backgroundColor = [UIColor colorWithWhite:0.217 alpha:1.000];
    
    NSArray *links = @[
                       @"https://pic4.zhimg.com/ea159ce6e135c546a9b730f376f362a3_b.jpeg",
                       @"https://pic3.zhimg.com/624cb86cd37c1d70a7a7b555c0bc34ee_b.png",
                       @"https://pic3.zhimg.com/c1bd46673d9aa0aa4cf53ac59705e52e_b.jpeg",
                       @"https://pic1.zhimg.com/v2-50efe2d5a155f0390db4f7924db036f4_b.png",
                       @"https://pic2.zhimg.com/f62e69de3c5e4879267d6366fdfd9c99_b.jpg",
                       @"https://pic4.zhimg.com/7e111aa9d1884887a994ebb2d003cdaf_b.jpeg",
                       @"https://pic1.zhimg.com/9916c0d1b8524013c75d1f5462ace6d8_b.jpeg",
                       @"https://pic4.zhimg.com/acdf9eb13b39106c897cab70603ab923_b.jpeg",
                       @"https://pic3.zhimg.com/6093f8575ce4577a495d83f0841f2e16_b.png",
                       @"https://pic1.zhimg.com/671d035f870f7348277637d35d175e44_b.jpeg",
                       @"https://pic1.zhimg.com/8eba0b0753f75a4b8c3db7aaefc9028c_b.jpeg",
                       @"https://pic2.zhimg.com/f551b10552c59835034268a994f061f5_b.jpeg",
                       @"https://pic4.zhimg.com/8f5689e182d09ab689a9521bad98b68f_b.jpeg",
                       ];
    
    _imageLinks = links;
    [self.tableView reloadData];
    [self scrollViewDidScroll:self.tableView];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if(kiOS7Later){
        self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    }
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if(kiOS7Later){
        self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
        self.navigationController.navigationBar.tintColor = nil;
    }
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

- (void)reload{
    [self.tableView reloadData];
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _imageLinks.count * 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YYWebImageExampleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) cell = [[YYWebImageExampleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    [cell setImageURL:[NSURL URLWithString:_imageLinks[indexPath.row % _imageLinks.count]]];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat viewHeight = scrollView.height + scrollView.contentInset.top;
    
   for(YYWebImageExampleCell *cell in [self.tableView visibleCells]){
        CGFloat y = cell.centerY - scrollView.contentOffset.y;
        CGFloat p = y - viewHeight / 2;
        CGFloat scale= cos(p / viewHeight * 0.8) * 0.95;
    
        if(kiOS8Later){
            [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState animations:^{
                cell.webImageView.transform = CGAffineTransformMakeScale(scale, scale);
            } completion:^(BOOL finished) {
                
            }];
        }else{
            cell.webImageView.transform = CGAffineTransformMakeScale(scale, scale);
        }
    }
}

@end

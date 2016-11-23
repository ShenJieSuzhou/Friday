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
#import <SDWebImage/UIImageView+WebCache.h>
//#import <SDWebImage/FLAnimatedImageView.h>
#import <SDWebImage/FLAnimatedImageView+WebCache.h>


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
@property (nonatomic, strong) FLAnimatedImageView *webImageView;
@property (nonatomic, strong) dispatch_semaphore_t lock;

@end

@implementation YYWebImageExampleCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.size = CGSizeMake(kScreenWidth, kCellHeight);
    self.contentView.size = self.size;
    
    _webImageView = [FLAnimatedImageView new];
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
    
    
//    __weak typeof(self) _self = self;
//    UITapGestureRecognizer *g = [[UITapGestureRecognizer alloc] initwith]
    
    return self;
}

- (void)setImageURL:(NSURL *)url{
    _label.hidden = YES;
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.progressLayer.hidden = YES;
    self.progressLayer.strokeEnd = 0;
    [CATransaction commit];
    
//    if(_webImageView.image){
//        return;
//    }
    
//    [_webImageView setImageWithURL:url
//                          progress:^(NSInteger receivedSize, NSInteger expectedSize){
//                              NSLog(@"receivedSize:%ld  expectedSize:%ld", (long)receivedSize, (long)expectedSize);
//                              dispatch_async(dispatch_get_main_queue(), ^{
//                                  if(receivedSize > 0 && receivedSize > 0){
//                                      CGFloat progress = (CGFloat)receivedSize / expectedSize;
//                                      progress = progress < 0 ? 0 : progress > 1 ? 1 : progress;
//                                      if(_progressLayer.hidden) _progressLayer.hidden = NO;
//                                      _progressLayer.strokeEnd = progress;
//                                  }
//                              });
//                              
//                          } completion:^(UIImage *image, NSData *data, NSError *error, BOOL finished){
//                              dispatch_async(dispatch_get_main_queue(), ^{
//                                  if(image){
//                                      CATransition *transition = [CATransition animation];
//                                      transition.duration = 0.2;
//                                      transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//                                      transition.type = kCATransitionFade;
//                                      [self.layer addAnimation:transition forKey:@"YYWebImageFade"];
//                                      
//                                      [_webImageView setImage:image];
//                                  }
//                                  
//                                  if(finished){
//                                      _progressLayer.hidden = YES;
//                                  }
//                              });
//                          }];
    
    
    [_webImageView sd_setImageWithURL:url placeholderImage:nil options:SDWebImageProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if(receivedSize > 0 && receivedSize > 0){
                CGFloat progress = (CGFloat)receivedSize / expectedSize;
                progress = progress < 0 ? 0 : progress > 1 ? 1 : progress;
                if(_progressLayer.hidden) _progressLayer.hidden = NO;
                _progressLayer.strokeEnd = progress;
            }
        });
    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if(image){
                _progressLayer.hidden = YES;
                CATransition *transition = [CATransition animation];
                transition.duration = 0.2;
                transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                transition.type = kCATransitionFade;
                [self.layer addAnimation:transition forKey:@"YYWebImageFade"];
            }
        });
    }];
}

@end

@implementation YYWebImageExample{
    NSArray *_imageLinks;
}

//@synthesize imageLinks = _imageLinks;

- (void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"Reload" style:UIBarButtonItemStylePlain target:self action:@selector(reload)];
    
    self.navigationItem.rightBarButtonItem = button;
    self.view.backgroundColor = [UIColor colorWithWhite:0.217 alpha:1.000];
    
    NSArray *links = @[
                       // progressive jpeg
                       @"https://s-media-cache-ak0.pinimg.com/1200x/2e/0c/c5/2e0cc5d86e7b7cd42af225c29f21c37f.jpg",
                       
                       // animated gif: http://cinemagraphs.com/
                       @"http://i.imgur.com/uoBwCLj.gif",
                       @"http://i.imgur.com/8KHKhxI.gif",
                       @"http://i.imgur.com/WXJaqof.gif",
                       
                       // animated gif: https://dribbble.com/markpear
                       @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1780193/dots18.gif",
                       @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1809343/dots17.1.gif",
                       @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1845612/dots22.gif",
                       @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1820014/big-hero-6.gif",
                       @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1819006/dots11.0.gif",
                       @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1799885/dots21.gif",
                       
                       // animaged gif: https://dribbble.com/jonadinges
                       @"https://d13yacurqjgara.cloudfront.net/users/288987/screenshots/2025999/batman-beyond-the-rain.gif",
                       @"https://d13yacurqjgara.cloudfront.net/users/288987/screenshots/1855350/r_nin.gif",
                       @"https://d13yacurqjgara.cloudfront.net/users/288987/screenshots/1963497/way-back-home.gif",
                       @"https://d13yacurqjgara.cloudfront.net/users/288987/screenshots/1913272/depressed-slurp-cycle.gif",
                       
                       // jpg: https://dribbble.com/snootyfox
                       @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/2047158/beerhenge.jpg",
                       @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/2016158/avalanche.jpg",
                       @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/1839353/pilsner.jpg",
                       @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/1833469/porter.jpg",
                       @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/1521183/farmers.jpg",
                       @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/1391053/tents.jpg",
                       @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/1399501/imperial_beer.jpg",
                       @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/1488711/fishin.jpg",
                       @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/1466318/getaway.jpg",
                       
                       // animated webp and apng: http://littlesvr.ca/apng/gif_apng_webp.html
                       @"http://littlesvr.ca/apng/images/BladeRunner.png",
                       @"http://littlesvr.ca/apng/images/Contact.webp",
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

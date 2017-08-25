//
//  ViewController.h
//  LyricPictureDemo
//
//  Created by silicon on 17/1/3.
//  Copyright © 2017年 com.snailgames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LrcParseUtil.h"
#import "SelectLrcViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *lrcTableView;
@property (strong, nonatomic) LrcParseUtil *parseUtil;
@property (strong, nonatomic) SelectLrcViewController *selectLrcView;
@property (strong, nonatomic) NSTimer *scrollTimer;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (assign) int currentRow;

@end


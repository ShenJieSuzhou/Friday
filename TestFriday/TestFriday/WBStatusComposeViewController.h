//
//  WBStatusComposeViewController.h
//  TestFriday
//
//  Created by silicon on 16/12/27.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIColor+YYAdd.h"
#import "YYTextView.h"
#import "UIView+YYAdd.h"

typedef NS_ENUM(NSUInteger, WBStatusComposeViewType){
    WBStatusComposeViewTypeStatus,
    WBStatusComposeViewTypeRetweet,
    WBStatusComposeViewTypeComment,
};

@interface WBStatusComposeViewController : UIViewController

@property (nonatomic, assign) WBStatusComposeViewType type;
@property (nonatomic, copy) void (^dismiss)(void);

@property (nonatomic, strong) UIView *toolbar;
@property (nonatomic, strong) UIView *toolbarBackground;
@property (nonatomic, strong) UIButton *PositionBtn;
@property (nonatomic, strong) UIButton *GroupBtn;
@property (nonatomic, strong) UIButton *PictureBtn;
@property (nonatomic, strong) UIButton *AtBtn;
@property (nonatomic, strong) UIButton *TopicBtn;
@property (nonatomic, strong) UIButton *EmoticonBtn;
@property (nonatomic, strong) UIButton *ExtraBtn;
@property (nonatomic, assign) BOOL isInputEmoticon;

@property (nonatomic, strong) YYTextView *textView;


@end

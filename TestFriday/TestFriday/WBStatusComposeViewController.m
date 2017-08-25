//
//  WBStatusComposeViewController.m
//  TestFriday
//
//  Created by silicon on 16/12/27.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "WBStatusComposeViewController.h"
#import "UIColor+YYAdd.h"
#import "UIDevice+YYAdd.h"

@implementation WBStatusComposeViewController

- (instancetype)init{
    self = [super init];
    //初始化键盘
    
    return self;
}

- (void)dealloc{
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    if([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]){
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [self _initNavBar];
    
}

- (void)_initNavBar{
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(_cancel)];
    
    [button setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],
                                     NSForegroundColorAttributeName:UIColorHex(4c4c4c)} forState:UIControlStateNormal];

    self.navigationItem.leftBarButtonItem = button;
    
    self.title = @"发微博";
}

- (void)_initTextView{
    if(_textView){
        return;
    }
    
    _textView = [YYTextView new];
    _textView.size = CGSizeMake(self.view.width, self.view.height);

    NSString *placeholderPlainText = nil;
    placeholderPlainText = @"分享新鲜事...";
    
    [self.view addSubview:_textView];
}

- (void)_initToolbar{
    
}



- (void)_cancel{
    [self.view endEditing:YES];
    if(_dismiss){
        _dismiss();
    }
}

@end

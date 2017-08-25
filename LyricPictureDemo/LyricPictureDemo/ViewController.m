//
//  ViewController.m
//  LyricPictureDemo
//
//  Created by silicon on 17/1/3.
//  Copyright © 2017年 com.snailgames. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize lrcTableView = _lrcTableView;
@synthesize parseUtil = _parseUtil;
@synthesize selectLrcView = _selectLrcView;
@synthesize scrollTimer = _scrollTimer;
@synthesize audioPlayer = _audioPlayer;
@synthesize currentRow = _currentRow;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Silicon Demo";
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    //歌词显示桌面初始化
    self.lrcTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.lrcTableView.delegate = self;
    self.lrcTableView.dataSource = self;
    
    [self.lrcTableView setBackgroundColor:[UIColor clearColor]];
    self.lrcTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.lrcTableView];
    
    //解析歌词
    self.parseUtil = [[LrcParseUtil alloc] init];
    [self.parseUtil parseLrc:[self.parseUtil getLrcFile:@"demoSong"]];
    
    //初始化滚动器定时
    self.scrollTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    
    //播放音乐
    [self initMusic];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*初始化播放音乐*/
- (void)initMusic{
    NSString *strpath = [[NSBundle mainBundle]pathForResource:@"林俊杰 - 不为谁而作的歌" ofType:@"mp3"];
    NSURL *filerul = [NSURL fileURLWithPath:strpath];
    self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:filerul error:nil];
    [self.audioPlayer prepareToPlay];
    [self.audioPlayer play];
}

/*更新滚动歌词*/
- (void)updateTimer{
    CGFloat currentTime = self.audioPlayer.currentTime;
    
    for(int i = 0; i < self.parseUtil.timerArray.count; i++){
        NSArray *timeArray = [[self.parseUtil.timerArray objectAtIndex:i] componentsSeparatedByString:@":"];
        float miniute = [[timeArray objectAtIndex:0] intValue];
        float second = [[timeArray objectAtIndex:1] floatValue];
        float lrctime = miniute * 60 + second;
        
        if(currentTime > lrctime){
            self.currentRow = i;
        }else{
            break;
        }
    }
    
    [self.lrcTableView reloadData];
    [self.lrcTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.currentRow inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}

#pragma -mark tableview
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(!self.selectLrcView){
        self.selectLrcView = [SelectLrcViewController new];
    }
    
    [self.selectLrcView setLrcData:self.parseUtil.wordArray];
    
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.3];
    [animation setType: kCATransitionFade];
    [animation setSubtype: kCATransitionFromTop];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    
    [self.navigationController pushViewController:self.selectLrcView animated:NO];
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.parseUtil.wordArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.lrcTableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = self.parseUtil.wordArray[indexPath.row];
    if(indexPath.row == self.currentRow){
        cell.textLabel.textColor = [UIColor blueColor];
    }else{
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.backgroundColor=[UIColor clearColor];

    
    return cell;
}

@end

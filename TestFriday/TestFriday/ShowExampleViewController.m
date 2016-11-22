//
//  ShowExampleViewController.m
//  TestFriday
//
//  Created by silicon on 16/7/3.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "ShowExampleViewController.h"

@interface ShowExampleViewController ()

@end

@implementation ShowExampleViewController
@synthesize imagesArray = _imagesArray;
@synthesize urlArrays = _urlArrays;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.urlArrays = [[NSMutableArray alloc] initWithObjects:@"http://img1.gtimg.com/14/1492/149249/14924912_980x1200_0.jpg",
                      @"http://img1.gtimg.com/14/1492/149249/14924914_980x1200_0.jpg",
                      @"http://img1.gtimg.com/14/1492/149249/14924916_980x1200_0.jpg",
                      @"http://img1.gtimg.com/14/1492/149249/14924917_980x1200_0.jpg",
                      @"http://img1.gtimg.com/14/1492/149249/14924918_980x1200_0.jpg",
                      @"http://img1.gtimg.com/14/1492/149249/14924919_980x1200_0.jpg",nil];
    
    [NSOperationTest getInstance].delegate = self;
    [self layoutUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)layoutUI{
    self.imagesArray = [[NSMutableArray alloc] init];
    for (int r=0; r<2; r++) {
        for (int c=0; c<3; c++) {
            UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(c*100 + ( c*10 ), r*100 + (r*10) + 60, 100, 100)];
            imageView.contentMode=UIViewContentModeScaleAspectFit;

            [self.view addSubview:imageView];
            [_imagesArray addObject:imageView];
        }
    }
}

-(void)updateImage:(NSData *)imageData Index:(int)index{
    UIImage *image=[UIImage imageWithData:imageData];
    UIImageView *imageView = _imagesArray[index];
    imageView.image = image;
}

- (IBAction)clickLoadImage:(id)sender {
    for(int i = 0; i < [self.urlArrays count]; i++){
        [[NSOperationTest getInstance] NSBlockOperationTest:[self.urlArrays objectAtIndex:i] Index:i];
    }
}

- (void)downloadOperation:(LoadImageOperation *)operation didFinishDownLoad:(NSData *)image{
    
}

- (void)downloadOperation:(LoadImageOperation *)operation didFinishDownLoad:(NSData *)image Index:(int)index{
     [self updateImage:image Index:index];
}

@end

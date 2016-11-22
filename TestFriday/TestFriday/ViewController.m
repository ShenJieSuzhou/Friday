//
//  ViewController.m
//  TestFriday
//
//  Created by silicon on 16/6/16.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "ViewController.h"
#import "MyTestUtil.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize mTableView = _mTableView;
@synthesize mDataSource = _mDataSource;
@synthesize demoView = _demoView;
@synthesize demoNSOperView = _demoNSOperView;
@synthesize demoGCDView = _demoGCDView;
@synthesize showExample = _showExample;
@synthesize button = _button;

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.mDataSource = [[NSMutableArray alloc] initWithObjects:@"NSThread", @"NSOperationQueue", @"GCD", @"多图加载",nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //耗时操作用子线程来实现,UI跟新使用主线程
    //获取当前线程
//    NSThread *current = [NSThread currentThread];
//    NSLog(@"当前线程为 %@", current);
//    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:@"1", @"key",nil];
//    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(downloadImage:) object:dic];
//    thread.threadPriority = 1.0;
//    thread.name = @"我的新线程";
//    [thread start];
//    for(int i = 0 ; i < 100; i++){
//        NSLog(@"在子线程外面:%d", i);
//    }
    
//    [self performSelectorInBackground:@selector(downloadImage:) withObject:nil];
    
//    NSMutableArray *array = [[NSMutableArray alloc] init];
//    NSLog(@"%@", [array objectAtIndex:2]);
    
    
    /*self.mTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;*/
    
    //[self.view addSubview:self.mTableView];
    
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 150, 90)];
    [self.button setTitle:@"Test" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(trigger) forControlEvents:UIControlEventTouchUpInside];
    [self.button setBackgroundColor:[UIColor blueColor]];
    
    [self.view addSubview:self.button];

    [[MyTestUtil shareInstance] startTest:self];
    [[MyTestUtil shareInstance] startTest:self];
    [[MyTestUtil shareInstance] startTest:self];
     [[MyTestUtil shareInstance] startTest:self];

}

- (void)trigger{
    [[MyTestUtil shareInstance] triggerTheDelegate];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NOTIFICATION_MSG" object:nil];
}

- (void)downloadImage:(NSDictionary *)param{
    NSLog(@"我的新线程开始执行%@", param);
    
    //在子线程中获取当前线程
    NSLog(@"当前线程:%@", [NSThread currentThread]);
    
    //线程休眠
//    [NSThread sleepForTimeInterval:2];
    
//    for(int j = 100 ; j < 1000; j++){
//        NSLog(@"在子线程里面:%d", j);
//    }
    
    NSThread *mainThread = [NSThread mainThread];
    NSLog(@"子线程中获取主线程%@", mainThread);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testDownLoad{
    NSURL *url = [[NSURL alloc] initWithString:@""];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
    }];

    [dataTask resume];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(!self.mDataSource){
        return 0;
    }
    
    return [self.mDataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIdentifier = @"staticCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"staticCell"];
    }
    
    NSString *optValue = [self.mDataSource objectAtIndex:indexPath.row];
    [cell.textLabel setText:optValue];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row == 0){
        if(!self.demoView){
            self.demoView = [[DemoViewController alloc] initWithNibName:@"DemoViewController" bundle:nil];
        }
        
        [self.navigationController pushViewController:self.demoView animated:YES];
    }else if(indexPath.row == 1){
        if(!self.demoNSOperView){
            self.demoNSOperView = [[DemoNSOperationController alloc] initWithNibName:@"DemoNSOperationController" bundle:nil];
        }
        
        [self.navigationController pushViewController:self.demoNSOperView animated:YES];
    }else if(indexPath.row == 2){
        if(!self.demoGCDView){
            self.demoGCDView = [[DemoGCDViewController alloc] initWithNibName:@"DemoGCDViewController" bundle:nil];
        }
        [self.navigationController pushViewController:self.demoGCDView animated:YES];
    }else if(indexPath.row == 3){
        if(!self.showExample){
            self.showExample = [[ShowExampleViewController alloc] initWithNibName:@"ShowExampleViewController" bundle:nil];
        }
        [self.navigationController pushViewController:self.showExample animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0f;
}

/* Sent when a download task that has completed a download.  The delegate should
 * copy or move the file at the given location to a new location as it will be
 * removed when the delegate message returns. URLSession:task:didCompleteWithError: will
 * still be called.
 */
//- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
//didFinishDownloadingToURL:(NSURL *)location{
//
//    
//}

/* Sent periodically to notify the delegate of download progress. */
//- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
//      didWriteData:(int64_t)bytesWritten
// totalBytesWritten:(int64_t)totalBytesWritten
//totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
//    
//    
//    
//}

/* Sent when a download has been resumed. If a download failed with an
 * error, the -userInfo dictionary of the error will contain an
 * NSURLSessionDownloadTaskResumeData key, whose value is the resume
 * data.
 */
//- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
// didResumeAtOffset:(int64_t)fileOffset
//expectedTotalBytes:(int64_t)expectedTotalBytes{
//
//    
//}



//    NSURL* url = [NSURL URLWithString:@"https://picjumbo.imgix.net/HNCK8461.jpg?q=40&w=1650♯=30"];
//    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//
////        self.imageView.image = [UIImage imageWithData:data];
//    }];


- (void)onTestCallBack:(NSString *)log{
    NSLog(@"%@", log);
}



@end

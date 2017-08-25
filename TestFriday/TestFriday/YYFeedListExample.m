//
//  YYFeedListExample.m
//  TestFriday
//
//  Created by silicon on 16/12/23.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "YYFeedListExample.h"
#import "UIDevice+YYAdd.h"

@implementation YYFeedListExample

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.titles = @[].mutableCopy;
    self.classNames = @[].mutableCopy;
    self.images = @[].mutableCopy;

    [self addCell:@"Weibo" class:@"WBStatusTimeLineViewController" image:@"Weibo.jpg"];
    
    
    if(!kiOS7Later){
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    }
    
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    self.title = @"Feed List Demo";
}

- (void)addCell:(NSString *)title class:(NSString *)className image:(NSString *)imageName{
    [self.titles addObject:title];
    [self.classNames addObject:className];
    [self.images addObject:[UIImage imageNamed:imageName]];
}


#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 48.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YY"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"YY"];
    }
    
    cell.textLabel.text = _titles[indexPath.row];
    cell.imageView.image = _images[indexPath.row];
    cell.imageView.clipsToBounds = YES;
    cell.imageView.layer.cornerRadius = 48 / 2;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *className = self.classNames[indexPath.row];
    Class class = NSClassFromString(className);
    
    if(class){
        UIViewController *ctrl = class.new;
        ctrl.title = _titles[indexPath.row];
        self.title = @" ";
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end

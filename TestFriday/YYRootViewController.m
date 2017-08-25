//
//  YYRootViewController.m
//  TestFriday
//
//  Created by silicon on 16/10/20.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "YYRootViewController.h"

@implementation YYRootViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    self.title = @"测试工程";
    self.titles = @[].mutableCopy;
    self.classnames = @[].mutableCopy;
    
    [self addCell:@"Model" class:@"YYModelExample"];
    [self addCell:@"Image" class:@"YYImageExample"];
    [self addCell:@"Text" class:@"YYTextExample"];
    //    [self addCell:@"Utility" class:@"YYUtilityExample"];
    [self addCell:@"Feed List Demo" class:@"YYFeedListExample"];
    
    [self.tableView reloadData];
}

- (void)addCell:(NSString *)title class:(NSString *)className{
    [self.titles addObject:title];
    [self.classnames addObject:className];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"static cell"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"static cell"];
    }
    cell.textLabel.text = _titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *className = self.classnames[indexPath.row];
    Class class = NSClassFromString(className);
    if(class){
        UIViewController *ctrl = class.new;
        ctrl.title = _titles[indexPath.row];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end

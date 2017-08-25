//
//  YYFeedListExample.h
//  TestFriday
//
//  Created by silicon on 16/12/23.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YYFeedListExample : UITableViewController

@property (strong, nonatomic) NSMutableArray *titles;
@property (strong, nonatomic) NSMutableArray *classNames;
@property (strong, nonatomic) NSMutableArray *images;


- (void)addCell:(NSString *)title class:(NSString *)className image:(NSString *)imageName;

@end

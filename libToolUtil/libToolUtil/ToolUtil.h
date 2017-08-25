//
//  ToolUtil.h
//  libToolUtil
//
//  Created by silicon on 2017/6/26.
//  Copyright © 2017年 com.snailgames. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ToolUtil : NSObject


//获取文件路径(沙盒)
+ (NSString *) getFilePath:(NSString *) fileName;

//写入文件
+ (BOOL) writeToFile:(id) file fileName: (NSString *) fileName;

//文件是否存在
+ (BOOL) fileISExist:(NSString *) filename;

//删除文件
+ (void) deleteFile:(NSString *) fileName;

//读取plist
+ (NSMutableDictionary *) getPListFile:(NSString *) listName;

+ (void) autoLayoutTopView:(UIView *) uiview value:(int) _value otherView:(UIView *) otview;
+ (void) autoLayoutBottomView:(UIView *) uiview value:(int) _value otherView:(UIView *) otview;
+ (void) autoLayoutLeftView:(UIView *) uiview value:(int) _value otherView:(UIView *) otview;
+ (void) autoLayoutRightView:(UIView *) uiview value:(int) _value otherView:(UIView *) otview;

+ (void) autoLayoutSizeWithTopAndBottom:(UIView *) uiview top:(int) itop bottom:(int) ibottom otherView:(UIView *) otview;
+ (void) autoLayoutSizeWithLeftAndRight:(UIView *) uiview left:(int) ileft right:(int) iright otherView:(UIView *) otview;
+ (void) autoLayoutSizeWithTBLR:(UIView *) uiview top:(int) itop bottom:(int) ibottom left:(int) ileft right:(int) iright otherView:(UIView *) otview;
+ (void) centerViewTo:(UIView *) sourceView targetView:(UIView *) targetView;

+ (float) getUIview_X:(UIView *) uiview;
+ (float) getUIview_Y:(UIView *) uiview;
+ (float) getUIview_W:(UIView *) uiview;
+ (float) getUIview_H:(UIView *) uiview;

+ (void) setUIview_H:(UIView *) uiview value:(int) v;
+ (void) setUIview_W:(UIView *) uiview value:(int) v;
+ (void) setUIview_X:(UIView *) uiview value:(int) v;
+ (void) setUIview_Y:(UIView *) uiview value:(int) v;

//相对某一VIEW的距离
+ (void) marginLeftView:(UIView *) sourceView targetView:(UIView *) t_view value:(int) _v;
+ (void) marginRightView:(UIView *) sourceView targetView:(UIView *) t_view value:(int) _v;
+ (void) marginTopView:(UIView *) sourceView targetView:(UIView *) t_view value:(int) _v;
+ (void) marginBootomView:(UIView *) sourceView targetView:(UIView *) t_view value:(int) _v;

//在图上取一块
+ (UIImage *) drawImgFromImagName:(UIImage *) image
                                X:(CGFloat) v_x
                                Y:(CGFloat) v_y
                            width:(CGFloat) w
                           height:(CGFloat) h;

//在图上插入一块
+ (UIImage *) insertImgToImg :(UIImage *) bigImg
                     smallImg:(UIImage *) sImg
                            X:(CGFloat) v_x
                            Y:(CGFloat) v_y;

@end

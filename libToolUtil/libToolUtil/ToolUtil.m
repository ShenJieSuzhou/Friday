//
//  ToolUtil.m
//  libToolUtil
//
//  Created by silicon on 2017/6/26.
//  Copyright © 2017年 com.snailgames. All rights reserved.
//

#import "ToolUtil.h"

@implementation ToolUtil

//传入一个文件名获得其路径
+ (NSString *) getFilePath:(NSString *) fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    //    NSLog(@"path = %@",[[paths objectAtIndex:0] stringByAppendingPathComponent:fileName]);
    return [[paths objectAtIndex:0] stringByAppendingPathComponent:fileName];
}

//写入文件
+ (BOOL) writeToFile:(id) file fileName: (NSString *) fileName{
    if ([self fileISExist:fileName]) {
        //		[[NSFileManager defaultManager] removeItemAtPath:fileName error:nil];
        [self deleteFile:fileName];
    }
    if ([file isKindOfClass:[NSArray class]]) {
        NSArray *arry = (NSArray *)file;
        return [arry writeToFile:[ToolUtil getFilePath:fileName] atomically:YES];
    }else if([file isKindOfClass:[NSMutableArray class]]){
        NSMutableArray *arry = (NSMutableArray *)file;
        return [arry writeToFile:[ToolUtil getFilePath:fileName] atomically:YES];
    }else if([file isKindOfClass:[NSDictionary class]]){
        NSDictionary *arry = (NSDictionary *)file;
        return [arry writeToFile:[ToolUtil getFilePath:fileName] atomically:YES];
    }else if([file isKindOfClass:[NSMutableDictionary class]]){
        NSMutableDictionary *arry = (NSMutableDictionary *)file;
        return [arry writeToFile:[ToolUtil getFilePath:fileName] atomically:YES];
    }else if([file isKindOfClass:[NSString class]]){
        NSString *arry = (NSString *)file;
        return [arry writeToFile:[ToolUtil getFilePath:fileName] atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }else{
        return	NO;
    }
}


+ (BOOL) fileISExist:(NSString *)filename{
    NSFileManager *nsmaager = [NSFileManager defaultManager];
    return [nsmaager fileExistsAtPath:[self getFilePath:filename]];
}


+ (void) deleteFile:(NSString *) fileName{
    NSLog(@"deleteFile:%@",fileName);
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:[self getFilePath:fileName] error:nil];
}


+ (NSMutableDictionary *) getPListFile:(NSString *) listName{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *cardPath = [bundle pathForResource:listName ofType:@"plist"];
    return  [[NSMutableDictionary alloc] initWithContentsOfFile:cardPath];
}


+ (void) autoLayoutTopView:(UIView *) uiview value:(int) _value otherView:(UIView *) otview{
    [uiview setFrame:CGRectMake([self getUIview_X:uiview], _value, [self getUIview_W:uiview], [self getUIview_H:uiview])];
}

+ (void) autoLayoutBottomView:(UIView *) uiview value:(int) _value otherView:(UIView *) otview{
    if (otview != nil) {
        [uiview setFrame:CGRectMake([self getUIview_X:uiview], otview.bounds.size.height - _value - [self getUIview_H:uiview], [self getUIview_W:uiview], [self getUIview_H:uiview])];
    } else {
        [uiview setFrame:CGRectMake([self getUIview_X:uiview], [uiview superview].frame.size.height - _value - [self getUIview_H:uiview], [self getUIview_W:uiview], [self getUIview_H:uiview])];
    }
}

+ (void) autoLayoutLeftView:(UIView *) uiview value:(int) _value otherView:(UIView *) otview{
    [uiview setFrame:CGRectMake(_value, [self getUIview_Y:uiview], [self getUIview_W:uiview], [self getUIview_H:uiview])];
}

+ (void) autoLayoutRightView:(UIView *) uiview value:(int) _value otherView:(UIView *) otview{
    int width = [uiview superview].bounds.size.width;
    if (otview != nil) {
        width = otview.bounds.size.width;
    }
    [uiview setFrame:CGRectMake(width - [self getUIview_W:uiview] - _value, [self getUIview_Y:uiview], [self getUIview_W:uiview], [self getUIview_H:uiview])];
}

+ (void) autoLayoutSizeWithTopAndBottom:(UIView *) uiview top:(int) itop bottom:(int) ibottom otherView:(UIView *) otview{
    float height = otview.bounds.size.height;
    
    [uiview setFrame:CGRectMake([self getUIview_X:uiview], itop, [self getUIview_W:uiview], height - itop - ibottom)];
}

+ (void) autoLayoutSizeWithLeftAndRight:(UIView *) uiview left:(int) ileft right:(int) iright otherView:(UIView *) otview{
    float width = otview.bounds.size.width;
    
    [uiview setFrame:CGRectMake(ileft, [self getUIview_Y:uiview], width - ileft - iright, [self getUIview_H:uiview])];
}

+ (void) autoLayoutSizeWithTBLR:(UIView *) uiview top:(int) itop bottom:(int) ibottom left:(int) ileft right:(int) iright otherView:(UIView *) otview{
    float height = otview.bounds.size.height;
    float width = otview.bounds.size.width;
    
    [uiview setFrame:CGRectMake(ileft, itop, width - ileft - iright, height - itop - ibottom)];
}

//target 居中目标
+ (void) centerViewTo:(UIView *) sourceView targetView:(UIView *) targetView{
    float twidth = [self getUIview_W:targetView];
    float theight = [self getUIview_H:targetView];
    float tx = [self getUIview_X:targetView];
    float ty = [self getUIview_Y:targetView];
    
    float swidth = [self getUIview_W:sourceView];
    float sheight = [self getUIview_H:sourceView];
    //    float sx = [self getUIview_X:sourceView];
    //    float sy = [self getUIview_Y:sourceView];
    
    [sourceView setFrame:CGRectMake(tx+(twidth-swidth)/2.0f, ty+(theight-sheight)/2.0f, swidth, sheight)];
}

+ (float) getUIview_X:(UIView *) uiview{
    return uiview.frame.origin.x;
}
+ (float) getUIview_Y:(UIView *) uiview{
    return uiview.frame.origin.y;
}
+ (float) getUIview_W:(UIView *) uiview{
    return uiview.frame.size.width;
}
+ (float) getUIview_H:(UIView *) uiview{
    return uiview.frame.size.height;
}

+ (void) setUIview_Y:(UIView *) uiview toY:(int) y{
    [uiview setFrame:CGRectMake([self getUIview_X:uiview], [self getUIview_Y:uiview]+y, [self getUIview_W:uiview], [self getUIview_H:uiview])];
}

+ (void) setUIview_Y:(UIView *) uiview Y:(int) y{
    [uiview setFrame:CGRectMake([self getUIview_X:uiview], y, [self getUIview_W:uiview], [self getUIview_H:uiview])];
}

+ (void) setUIview_H:(UIView *) uiview value:(int) v{
    [uiview setFrame:CGRectMake([self getUIview_X:uiview],[self getUIview_Y:uiview],[self getUIview_W:uiview],v)];
}

+ (void) setUIview_W:(UIView *) uiview value:(int) v{
    [uiview setFrame:CGRectMake([self getUIview_X:uiview],[self getUIview_Y:uiview],v,[self getUIview_H:uiview])];
}

+ (void) setUIview_X:(UIView *) uiview value:(int) v{
    [uiview setFrame:CGRectMake(v,[self getUIview_Y:uiview],[self getUIview_W:uiview],[self getUIview_H:uiview])];
}

+ (void) setUIview_Y:(UIView *) uiview value:(int) v{
    [uiview setFrame:CGRectMake([self getUIview_X:uiview],v,[self getUIview_W:uiview],[self getUIview_H:uiview])];
}


+ (UIImage *) drawImgFromImagName:(UIImage *) image
                                X:(CGFloat) v_x
                                Y:(CGFloat) v_y
                            width:(CGFloat) w
                           height:(CGFloat) h{
    CGImageRef cgImageRef = image.CGImage;
    CGRect crRect = CGRectMake(v_x, v_y, w, h);
    CGImageRef rtn = CGImageCreateWithImageInRect(cgImageRef, crRect);
    UIImage *rtnimage = [UIImage imageWithCGImage:rtn];
    CGImageRelease(rtn);
    return rtnimage;
}

+ (UIImage *) insertImgToImg :(UIImage *) bigImg
                     smallImg:(UIImage *) sImg
                            X:(CGFloat) v_x
                            Y:(CGFloat) v_y{
    CGRect big_size = CGRectMake(0, 0, bigImg.size.width, bigImg.size.height);
    CGRect small_size = CGRectMake(v_x, v_y, sImg.size.width, sImg.size.height);
    UIGraphicsBeginImageContext(big_size.size);
    [bigImg drawInRect:big_size];
    [sImg drawInRect:small_size];
    
    UIImage *rtn = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return rtn;
}



@end

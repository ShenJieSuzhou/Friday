//
//  WechatShareUtil.h
//  WechatShareUtil
//
//  Created by cmouse on 16/2/17.
//  Copyright © 2016年 cmouse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//分享图片返回事件
#define SNAIL_WX_SHAREPIC_RESPONSE @"kSnailWxSharePicResponse"

@interface WechatShareUtil : NSObject


/**
 * 初始化授权App
 * @param appkey 此处为从微信开发者网站上注册的应用key值
 * @param dialogTitle 分享网页图片时界面显示的文字
 */
+ (void) initWeChat:(NSMutableArray *) marray;

/**
 * 获取授权回调方法
 */
+ (BOOL) handleOpenURL:(NSMutableArray *) marray;

/**
 * 分享网络图片到微信
 * @param imageURL  网络图片链接
 * @param flag      1=朋友圈 0=好友
 */
+ (void) shareWebImage:(NSMutableArray *) marray;

/**
 * 分享网络图片到微信
 * @param imagePath 分享图片路径
 * @param flag      1=朋友圈 0=好友
 */
+ (void) shareLocImage:(NSMutableArray *) marray;

/**
 * 分享链接到微信
 * @param link      网址链接
 * @param title     分享标题
 * @param resourceName  分享图片路径
 * @param flag      1=朋友圈 0=好友
 */
+ (void) shareLink:(NSMutableArray *) marray;

/*
 * 跳转微信公众号
 * @param gzhID      公众号原始ID
 */
+ (void) jumpToWchatPlatfrom:(NSMutableArray *) marray;

@end

//
//  GW_HUD.h
//  SoSoRun
//
//  Created by bigSavage on 15/7/6.
//  Copyright (c) 2015年 SouSouRun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface GW_HUD : NSObject
/**
 * 显示HUD  纯文本 keyWindow
 */
+(void)showHUDText:(NSString *)str;
/**
 * 显示HUD  纯文本
 */
+(void)showHUDText:(NSString *)str inView:(UIView *)view;
/**
 * 显示HUD  纯文本 在指定时间隐藏 keyWindow
 */
+(void)showHUDText:(NSString *)str hideDelay:(NSTimeInterval)delay;
/**
 * 显示HUD  纯文本 在指定时间隐藏
 */
+(void)showHUDText:(NSString *)str inView:(UIView *)view hideDelay:(NSTimeInterval)delay;
/**
 * 显示HUD  加载中 keyWindow
 */
+(void)showHUDLoadingWithText:(NSString *)str;
+(void)showHUDLoadingWithText:(NSString *)str hideDelay:(NSTimeInterval)delay;
/**
 * 显示HUD  加载中
 */
+(void)showHUDLoadingWithText:(NSString *)str inView:(UIView *)view;
+(void)showHUDLoadingWithText:(NSString *)str inView:(UIView *)view hideDelay:(NSTimeInterval)delay;

/// 显示HUD  错误信息 - keyWindow
/// @param str 文字
+(void)showHUDErrorWithText:(NSString *)str;


/// 显示HUD 错误信息 - keyWindow - 自定义图标
/// @param str 文字
/// @param imageName 图片名
+(void)showHUDErrorWithText:(NSString *)str imageName:(NSString *)imageName;

/// 显示HUD  错误信息 - 指定view
/// @param str 文字
/// @param view 指定view
+(void)showHUDErrorWithText:(NSString *)str inView:(UIView *)view;

/// 显示HUD  错误信息
/// @param str 文字
/// @param imageName 图片名
/// @param view 指定view
+(void)showHUDErrorWithText:(NSString *)str imageName:(NSString *)imageName inView:(UIView *)view;

/// 显示HUD 成功信息 - keyWindow
/// @param str 文字
+(void)showHUDSuccessWithText:(NSString *)str;


/// 显示HUD 成功信息 - keyWindow - 自定义图标
/// @param str 文字
/// @param imageName 图片名
+(void)showHUDSuccessWithText:(NSString *)str imageName:(NSString *)imageName;

/// 显示HUD 成功信息 - 指定view
/// @param str 文字
/// @param view 图片名
+(void)showHUDSuccessWithText:(NSString *)str inView:(UIView *)view;

/// 显示HUD 成功信息 - 指定view - 自定义图标
/// @param str 内容
/// @param imageName 图片名
/// @param view 指定view
+(void)showHUDSuccessWithText:(NSString *)str imageName:(NSString *)imageName inView:(UIView *)view;

/**
 * 隐藏所有HUD keyWindow
 */
+(void)HideHUDAnimated:(BOOL)animated;
/**
 * 隐藏所有HUD
 */
+(void)HideHUDFrom:(UIView *)view animated:(BOOL)animated;
/**
 * 隐藏所有HUD 然后显示出HUD纯文本 keyWindow
 */
+(void)HideHUDAndShowText:(NSString *)text;
/**
 * 隐藏所有HUD 然后显示出HUD纯文本
 */
+(void)HideHUDAndShowText:(NSString *)text inView:(UIView *)view;
/**
 * 隐藏所有HUD 然后显示出HUD成功信息 keyWindow
 */
+(void)HideHUDAndShowSuccess:(NSString *)text;
/**
 * 隐藏所有HUD 然后显示出HUD成功信息
 */
+(void)HideHUDAndShowSuccess:(NSString *)text inView:(UIView *)view;
/**
 * 隐藏所有HUD 然后显示出HUD错误信息 keyWindow
 */
+(void)HideHUDAndShowError:(NSString *)text;
/**
 * 隐藏所有HUD 然后显示出HUD错误信息
 */
+(void)HideHUDAndShowError:(NSString *)text inView:(UIView *)view;
@end

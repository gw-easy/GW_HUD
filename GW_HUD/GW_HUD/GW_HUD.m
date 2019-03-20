//
//  GW_HUD.m
//  SoSoRun
//
//  Created by bigSavage on 15/7/6.
//  Copyright (c) 2015年 SouSouRun. All rights reserved.
//

#import "GW_HUD.h"

#define GW_HUD_ROOTWINDOW [[UIApplication sharedApplication].delegate window]
#define GW_HUD_BackColor [UIColor blackColor]
#define GW_HUD_TextColor [UIColor whiteColor]
static const NSTimeInterval timeInt = 1.2;
static const NSTimeInterval timeHide = 0.2;
static const float backAlpha = 0.7;
@implementation GW_HUD

//共同配置
+ (void)commentSetting:(MBProgressHUD *)HUD{
    //    背景颜色
    HUD.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    HUD.bezelView.color = [GW_HUD_BackColor colorWithAlphaComponent:backAlpha];
    //    文字颜色
    HUD.contentColor = GW_HUD_TextColor;
    //    间距
    HUD.margin = 18.f;
    //    是否宽高比一致
    HUD.square = NO;
}

+(void)showHUDText:(NSString *)str;{
    [self showHUDText:str inView:GW_HUD_ROOTWINDOW];
}

+(void)showHUDText:(NSString *)str inView:(UIView *)view{
    
    [MBProgressHUD hideHUDForView:view animated:YES];
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [self commentSetting:HUD];
    HUD.mode = MBProgressHUDModeText;
    HUD.label.text = str;
    HUD.removeFromSuperViewOnHide = YES;
    [HUD hideAnimated:YES afterDelay:timeInt];
    
}

+(void)showHUDText:(NSString *)str hideDelay:(NSTimeInterval)delay{
    [self showHUDText:str inView:GW_HUD_ROOTWINDOW hideDelay:delay];
}

+(void)showHUDText:(NSString *)str inView:(UIView *)view hideDelay:(NSTimeInterval)delay
{
    [MBProgressHUD hideHUDForView:view animated:YES];
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUD.mode = MBProgressHUDModeText;
    [self commentSetting:HUD];
    HUD.label.text = str;
    HUD.removeFromSuperViewOnHide = YES;
    [HUD hideAnimated:YES afterDelay:delay];
}

+(void)showHUDLoadingWithText:(NSString *)str{
    [self showHUDLoadingWithText:str inView:GW_HUD_ROOTWINDOW];
}
+(void)showHUDLoadingWithText:(NSString *)str inView:(UIView *)view{
    [MBProgressHUD hideHUDForView:view animated:YES];
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    [self commentSetting:HUD];
    [view addSubview:HUD];
    HUD.label.text = str;
    //    HUD.mode = MBProgressHUDModeCustomView;
    //    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"allloading.gif" ofType:nil]]];
    [HUD showAnimated:YES];
}

+(void)showHUDLoadingWithText:(NSString *)str hideDelay:(NSTimeInterval)delay{
    [self showHUDLoadingWithText:str inView:GW_HUD_ROOTWINDOW hideDelay:delay];
}

+(void)showHUDLoadingWithText:(NSString *)str inView:(UIView *)view hideDelay:(NSTimeInterval)delay{
    [MBProgressHUD hideHUDForView:view animated:YES];
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    [self commentSetting:HUD];
    [view addSubview:HUD];
    HUD.label.text = str;
    //    自定义View
    //    HUD.mode = MBProgressHUDModeCustomView;
    //    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"allloading.gif" ofType:nil]]];
    [HUD showAnimated:YES];
    [HUD hideAnimated:YES afterDelay:delay];
}

+(void)showHUDErrorWithText:(NSString *)str{
    [self showHUDErrorWithText:str inView:GW_HUD_ROOTWINDOW];
}

+(void)showHUDErrorWithText:(NSString *)str inView:(UIView *)view{
    [MBProgressHUD hideHUDForView:view animated:YES];
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:HUD];
    HUD.mode = MBProgressHUDModeCustomView;
    [self commentSetting:HUD];
    HUD.label.text = str;
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"GW_Wrong.png"]];
    [HUD showAnimated:YES];
    [HUD hideAnimated:YES afterDelay:timeInt];
    
}

+(void)showHUDSuccessWithText:(NSString *)str{
    [self showHUDSuccessWithText:str inView:GW_HUD_ROOTWINDOW];
}

+(void)showHUDSuccessWithText:(NSString *)str inView:(UIView *)view{
    [MBProgressHUD hideHUDForView:view animated:YES];
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:HUD];
    [self commentSetting:HUD];
    HUD.mode = MBProgressHUDModeCustomView;
    [self commentSetting:HUD];
    HUD.label.text = str;
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"GW_Success.png"]];
    [HUD showAnimated:YES];
    [HUD hideAnimated:YES afterDelay:timeInt];
    
}

+(void)HideHUDAnimated:(BOOL)animated{
    [self HideHUDFrom:GW_HUD_ROOTWINDOW animated:animated];
}

+(void)HideHUDFrom:(UIView *)view animated:(BOOL)animated{
    [MBProgressHUD hideHUDForView:view animated:animated];
}

+(void)HideHUDFrom:(UIView *)view animated:(BOOL)animated afterDelay:(NSInteger)time{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:view animated:animated];
    });
    
}

+(void)HideHUDFrom:(UIView *)view animated:(BOOL)animated afterDelay:(NSInteger)time didHide:(void (^)(void))block{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:view animated:animated];
        block();
    });
    
}

+(void)HideHUDAndShowText:(NSString *)text{
    [self HideHUDAndShowText:text inView:GW_HUD_ROOTWINDOW];
}

+(void)HideHUDAndShowText:(NSString *)text inView:(UIView *)view{
    __weak __typeof(&*self)weakSelf = self;
    [self HideHUDFrom:view animated:YES afterDelay:timeHide didHide:^{
        [weakSelf showHUDText:text inView:view];
    }];
}

+(void)HideHUDAndShowSuccess:(NSString *)text{
    [self HideHUDAndShowSuccess:text inView:GW_HUD_ROOTWINDOW];
}

+(void)HideHUDAndShowSuccess:(NSString *)text inView:(UIView *)view{
    __weak __typeof(&*self)weakSelf = self;
    [self HideHUDFrom:view animated:YES afterDelay:timeHide didHide:^{
        [weakSelf showHUDSuccessWithText:text inView:view];
    }];
}

+(void)HideHUDAndShowError:(NSString *)text{
    [self HideHUDAndShowError:text inView:GW_HUD_ROOTWINDOW];
}

+(void)HideHUDAndShowError:(NSString *)text inView:(UIView *)view{
    __weak __typeof(&*self)weakSelf = self;
    [self HideHUDFrom:view animated:YES afterDelay:timeHide didHide:^{
        [weakSelf showHUDErrorWithText:text inView:view];
    }];
}

@end

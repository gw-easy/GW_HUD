//
//  ViewController.m
//  GW_HUD
//
//  Created by zdwx on 2019/3/12.
//  Copyright © 2019 DoubleK. All rights reserved.
//

#import "ViewController.h"
#import "GW_HUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self test2];
//    [self test1];
}

- (void)test1{
    
    [GW_HUD showHUDText:@"111" inView:self.view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [GW_HUD showHUDLoadingWithText:@"正在请求数据" inView:self.view];
    });
}

- (void)test2{
    [GW_HUD showHUDErrorWithText:@"发生错误"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [GW_HUD HideHUDAndShowSuccess:@"成功了"];
    });
}

@end

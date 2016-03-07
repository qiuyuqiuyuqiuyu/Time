//
//  BaseNavagationController.m
//  项目一 01
//
//  Created by bever on 16/2/19.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "BaseNavagationController.h"

@interface BaseNavagationController ()

@end

@implementation BaseNavagationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //全局修改
    
    //富文本属性设置背景图片
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"pic_title_bg.9"] forBarMetrics:UIBarMetricsDefault];
    
    //设置字体大小和粗细颜色
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:20]}];

    
}
//设置状态栏
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


@end

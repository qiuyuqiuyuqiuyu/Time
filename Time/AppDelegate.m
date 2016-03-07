//
//  AppDelegate.m
//  项目一 01
//
//  Created by bever on 16/2/19.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarController.h"
#import "BaseNavagationController.h"

#import "FirstViewController.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    
    //使用方法类似字典
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    BOOL mark = [user objectForKey:@"First"];
    
    if (mark == NO) {
        
        self.window.rootViewController = [[FirstViewController alloc]init];
        [user setBool:YES forKey:@"First"];//记录已经运行了一次
        
    }else{
        self.window.rootViewController = [[MainViewController alloc]init];
    }
    
    
    
    

    return YES;
}


@end

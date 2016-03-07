//
//  MainViewController.m
//  Time
//
//  Created by bever on 16/3/4.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "MainViewController.h"
#import "BaseNavagationController.h"
#import "BaseTabBarController.h"
#import "HomeViewController.h"
#import "BlockView.h"
#import "Block.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MainViewController creatView];

}

+(void)creatView{
    
    NSArray *name = @[@"HomeViewController",@"DiscoverViewController",@"PayTicketViewController",@"StoreViewController",@"MyinfoViewController"];
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:name.count];
    for (NSString *string in name) {
        //创建三级控制器
        UIViewController *view = [[NSClassFromString(string) alloc]init];
        
        //创建二级控制器
        BaseNavagationController *nav = [[BaseNavagationController alloc]initWithRootViewController:view];
        
        [array addObject:nav];
        //        [array addObject:view];
    }
    BaseTabBarController *tabbar = [[BaseTabBarController alloc]init];
    tabbar.viewControllers = array;
    
//    self.window.rootViewController = tabbar;
    
    
    [[UIApplication sharedApplication].delegate window].rootViewController = tabbar;
    
    HomeViewController *home = tabbar.viewControllers[0];
    home.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
    
    [UIView animateWithDuration:0.8 animations:^{
        home.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
        Block *abolckView = [[Block alloc]initWithFrame:CGRectMake(0, 0, 250,400)];
       
        UIScrollView *scroller = [[UIScrollView alloc]initWithFrame:abolckView.bounds];
        scroller.contentSize = CGSizeMake(abolckView.bounds.size.width * 4, abolckView.bounds.size.height);
        [abolckView addSubview:scroller];
        
        for (int i = 0; i < 5; i ++) {
            UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(abolckView.bounds.size.width * (i - 1), 0, abolckView.bounds.size.width, abolckView.bounds.size.height)];
            
            img.image = [UIImage imageNamed:[NSString stringWithFormat:@"wizard%d_568@2x.JPG",i]];
            [scroller addSubview:img];
        }
        scroller.contentSize = CGSizeMake(abolckView.bounds.size.width * 4, abolckView.bounds.size.height);
        scroller.pagingEnabled = YES;
        
        abolckView.cancelButtonImg = @"pic_ico_wrong";
        [abolckView show];
        
    }];
    
    
    

}




@end

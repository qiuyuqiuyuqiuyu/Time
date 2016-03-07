//
//  StoreViewController.m
//  项目一 01
//
//  Created by bever on 16/2/19.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "StoreViewController.h"
#import "newsView.h"
#import "TralierView.h"
#import "ChartView.h"
#import "FilmReview.h"

@interface StoreViewController ()<ChangeTableView>

@end

@implementation StoreViewController{
    newsView *news;
    TralierView *tralier;
    ChartView *chart;
    FilmReview *filmreview;

}


-(id)init{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_top_movie_background_cover"]];
        self.title = @"精选";
        self.tabBarItem.image = [UIImage imageNamed:@"store_on@3x"];
        [self creatView];
        
    }
    return self;
    
}


-(void)creatView{
    news = [[newsView alloc]initWithFrame:CGRectMake(0, 0, kScreen_W, kScreen_H - 50 - 64)];
    [self.view addSubview:news];
    chart = [[ChartView alloc]initWithFrame:CGRectMake(0, 0, kScreen_W, kScreen_H - 50 - 64)];
    [self.view addSubview:chart];
    tralier = [[TralierView alloc]initWithFrame:CGRectMake(0, 0, kScreen_W, kScreen_H - 50 - 64)];
    [self.view addSubview:tralier];
    filmreview = [[FilmReview alloc]initWithFrame:CGRectMake(0, 0, kScreen_W, kScreen_H - 50 - 64)];
    [self.view addSubview:filmreview];

    [self.view bringSubviewToFront:news];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    MyButtonView *buttonView = [[MyButtonView alloc]initWithFrame:CGRectMake(0, 0, kScreen_W, 50)];
    
    buttonView.buttonName = @[@"新闻",@"预告片",@"排行榜",@"影评"];
//    buttonView.imgName = @"color_line";
    buttonView.delegate = self;
//    [self.view addSubview:buttonView];
    self.navigationItem.titleView = buttonView;
    

}


-(void)changTableView:(int)count{
    if (count == 0) {
        [self.view bringSubviewToFront:news];
    }if (count == 1) {
        [self.view bringSubviewToFront:tralier];
    }if (count == 2) {
        [self.view bringSubviewToFront:chart];
    }if (count == 3) {
        [self.view bringSubviewToFront:filmreview];
    }
    
    
}



@end

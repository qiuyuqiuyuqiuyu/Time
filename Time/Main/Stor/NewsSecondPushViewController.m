//
//  NewsSecondPushViewController.m
//  Time
//
//  Created by bever on 16/3/5.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "NewsSecondPushViewController.h"
#import "BVImageView.h"

//用不着了 现在使用封装的

@interface NewsSecondPushViewController ()<UIScrollViewDelegate>

@end

@implementation NewsSecondPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];
  
    [self collectionView];
    
}
-(void)collectionView{
    
    
//    UIScrollView *scrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 200, kScreen_W,200)];
//    scrollerView.contentSize = CGSizeMake(kScreen_W , 200);
//    scrollerView.delegate = self;
//    scrollerView.pagingEnabled = YES;
//    
//    [self.view addSubview:scrollerView];
//    scrollerView.backgroundColor =[UIColor yellowColor];
//
//    
//    
//    UIImageView *view = [[UIImageView alloc]init];
//    [scrollerView addSubview:view];
    
    
    BVImageView *BVImg = [[BVImageView alloc]initWithFrame:CGRectMake(0, 100, 200, 300)];
    BVImg.data = _images;
    [self.view addSubview:BVImg];
    
}
















@end

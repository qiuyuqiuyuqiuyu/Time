//
//  NewsTableViewController.m
//  Time
//
//  Created by bever on 16/3/4.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "NewsTableViewController.h"
#import "NewsHeaderView.h"
//#import "NewsSecondPushViewController.h"
#import "BVImageViewController.h"
#import "BVImageView.h"

@interface NewsTableViewController ()
//<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@end

@implementation NewsTableViewController{
    NewsHeaderView *headView;
    NSMutableArray *imgs;
    UICollectionViewCell *cell ;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDate];

    [self headView];

    
}
-(void)loadDate{
    
    NSDictionary *dic = [Json json:@"image_news"];
    self.title = [dic objectForKey:@"title2"];
    
    _Lable1.text = [dic objectForKey:@"content"];
    _Lable2.text = [NSString stringWithFormat:@"导演:%@",[dic objectForKey:@"author"]];
    _Lable3.text = [NSString stringWithFormat:@"配音演员%@",[dic objectForKey:@"editor"]];
    
    NSArray *imagess = [dic objectForKey:@"images"];
    imgs = [[NSMutableArray alloc]init];
    for (NSDictionary * de in imagess) {
        
        NSString *sr = [de objectForKey:@"url1"];
        [imgs addObject:sr];
        
    }

    
    //使用封装

    BVImageView *imgView = [[BVImageView alloc]initWithFrame:CGRectMake(20, 0, 250, 250)];
    imgView.data = imgs;
    [_img addSubview:imgView];
    
    
    
    
    
    
    
    
    
    
    
   //不使用封装
    
//    _collectionView.delegate = self;
//    _collectionView.dataSource = self;
//    
//    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
//    

}

//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return 9;
//}
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    
//    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
//    
////    NSLog(@"%@",imgs[indexPath.row]);
//
//    //网址要通过sd加载
//    UIImageView *imgView=[[UIImageView alloc] initWithFrame:cell.bounds];
//    [imgView sd_setImageWithURL:[NSURL URLWithString:imgs[indexPath.row]]];
//
//    cell.backgroundView = imgView;
//    
//    return cell;
//}
//-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    
//    BVImageViewController *viewController = [[BVImageViewController alloc]init];
//    viewController.data = imgs;
////    viewController.currentItem = indexPath;
//    
//    [self.navigationController pushViewController:viewController animated:YES];
//}
//

-(void)headView{
    headView  = [[[NSBundle mainBundle]loadNibNamed:@"NewsHeaderView" owner:self options:nil]lastObject];
    self.hidesBottomBarWhenPushed = YES;
    self.tableView.tableHeaderView = headView;
}



@end

//
//  OneViewController.m
//  Time
//
//  Created by bever on 16/2/22.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "OneViewController.h"
#import "LeftModel.h"
#import "CityCollectionViewCell.h"
#import "HeadCollectionViewCell.h"

@interface OneViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

NSString *cell = @"cell";
NSString *head = @"head";

@implementation OneViewController{
    
    NSMutableDictionary *city;
    NSMutableArray *hotcity;
    NSMutableArray *lastcity;
    NSArray *allcities;
    UICollectionView *collection;
    NSArray *prearray;
    UITextField *fild;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_top_movie_background_cover"]];
    
    [self model];
    [self collectionView];
    [self textField];

}

//搜索
-(void)textField{
    
    fild = [[UITextField alloc]initWithFrame:CGRectMake(20, 10, kScreen_W-40, 40)];
    fild.backgroundColor = [UIColor whiteColor];
    fild.layer.cornerRadius = 15;
    [self.view addSubview:fild];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificatin:) name:UITextFieldTextDidChangeNotification object:nil];
    
}

//接收通知 过滤信息
-(void)notificatin:(NSNotification *)notifi{
    
    //创建谓词条件
    NSString *str = [NSString stringWithFormat:@"self like [C] '*%@*'",fild.text];
    
    //创建谓词对象
    NSPredicate *pre = [NSPredicate predicateWithFormat:str];
    
    //进行搜索
    allcities = [prearray filteredArrayUsingPredicate:pre];
    
    
    [collection reloadData];
    
    
    
}
-(void)model{
    city = [[NSMutableDictionary alloc]init];
    hotcity = [[NSMutableArray alloc]init];
    lastcity = [[NSMutableArray alloc]init];
    
    //加载json文件
     NSDictionary *dicionary = [Json json:@"cities"];
    NSDictionary *dicion = [dicionary objectForKey:@"infor"];
    NSArray *array = [dicion objectForKey:@"listItems"];
    
    for (NSDictionary *dic in array) {
        LeftModel *model = [[LeftModel alloc]init];
        model.name = [dic objectForKey:@"name"];
        model.nodepath = [dic objectForKey:@"nodepath"];
        //首字母
        model.charindex = [dic objectForKey:@"charindex"];
        model.level = [dic objectForKey:@"level"];
        model.orderby = [dic objectForKey:@"orderby"];
        
        
        //判断
       NSMutableArray *charindex = [city objectForKey:model.charindex];
        
        if (charindex == nil) {
            NSMutableArray *cha = [[NSMutableArray alloc]init];
            [cha addObject:model];
            [city setObject:cha forKey:model.charindex];
        }else{
            [charindex addObject:model];
            [city setObject:charindex forKey:model.charindex];
        }
        
        
        //热门城市
        
        if ([model.level isEqualToString:@"1"]) {
            [hotcity addObject:model];
            [city setValue:hotcity forKey:@"热门城市"];
        }
        
        //最近访问城市
        if ([model.nodepath isEqualToString:@"0"]) {
            [lastcity addObject:model];
            [city setObject:lastcity forKey:@"最近访问城市"];
        }
        

     }
    
    allcities = @[@"热门城市",@"最近访问城市",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"J",@"K",@"L",@"M",@"N",@"P",@"Q",@"R",@"S",@"T",@"W",@"X",@"Y",@"Z"];
    
    prearray = allcities;
}

//设置四周边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(10, 20, 10, 20);
    
}
-(void)collectionView{
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    flow.itemSize = CGSizeMake((kScreen_W-80)/3, 50);
    
    
    collection = [[UICollectionView alloc]initWithFrame:CGRectMake(10, 64, kScreen_W-20, kScreen_H-120)collectionViewLayout:flow];
    collection.backgroundColor = [UIColor clearColor];
    collection.delegate = self;
    collection.dataSource = self;
    
    //隐藏竖直滑条
    collection.showsVerticalScrollIndicator = NO;
    
    collection.minimumZoomScale = 10;
    collection.maximumZoomScale = 10;
    
    //第三步
    [collection registerClass:[CityCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    //头视图
    [collection registerClass:[HeadCollectionViewCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:head];
    
    [self.view addSubview:collection];
    
    flow.headerReferenceSize = CGSizeMake(0, 50);
    
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return allcities.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    NSArray *array = [city objectForKey:allcities[section]];
    return array.count;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CityCollectionViewCell *collectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:cell forIndexPath:indexPath];

    
    NSArray *array = [city objectForKey:allcities[indexPath.section]];
    LeftModel *model = array[indexPath.item];
    collectionCell.model = model;
    
    
    return collectionCell;
}

//头视图
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    
    HeadCollectionViewCell *headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"head" forIndexPath:indexPath];
    
    
      headView.string = allcities[indexPath.section];
 
    
    headView.backgroundColor = [UIColor grayColor];
    
    return  headView;
    
    
}


//点击单元格 实现代理方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSArray *array = [city objectForKey:allcities[indexPath.section]];
    
//    LeftModel *model = [array objectAtIndex:indexPath.row];
    LeftModel *model = array[indexPath.row];
    
   [_delegate buttontext:model.name];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
}



@end

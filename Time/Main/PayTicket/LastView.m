//
//  LastView.m
//  Time
//
//  Created by bever on 16/2/29.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "LastView.h"

@implementation LastView{
    UIImageView *img;
    NSMutableArray *dataList;
    NSArray *array1;
    NSArray *array2;
    NSArray *array3;
    UICollectionView *view;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self bu];

        [self collect];

    }
    return self;
}

-(void)collect{
    array1 = @[@"全部",@"IMAX厅",@"中国巨幕",@"4K放映厅",@"3D厅",@"杜比全景声厅",@"情路座",@"停车场",@"Wi-fi"];
    array2 = @[@"全部",@"历下",@"市中",@"商河",@"槐荫",@"历城",@"长清"];
    array3 = @[@"全部",@"美食广场",@"恒隆广场"];

    dataList = [[NSMutableArray alloc]initWithArray:array1];

    
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    
    flow.itemSize = CGSizeMake(kScreen_W/4, 50);
    view = [[UICollectionView alloc]initWithFrame:CGRectMake(0,50,kScreen_W,self.frame.size.height-50) collectionViewLayout:flow];
    view.delegate = self;
    view.dataSource = self;
    view.backgroundColor = [UIColor whiteColor];
    [view registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self addSubview:view];
    img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bus"]];
    img.frame = CGRectMake(0, 50, kScreen_W, self.bounds.size.height - 50);
    [self addSubview:img];
    img.hidden = YES;

    
}

-(void)bu{
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_W, 50)];
    [self addSubview:v];
    v.backgroundColor = [UIColor cyanColor];
    
    MyButtonView *button = [[MyButtonView alloc]initWithFrame:CGRectMake(kScreen_W/6, 0, kScreen_W/6*4, 50)];
    button.buttonName = @[@"特色",@"商圈",@"地区",@"地铁"];
    button.imgName = @"color_line";
    button.delegate = self;
    [self addSubview:button];
    button.backgroundColor = [UIColor cyanColor];
    
    UIButton *close = [[UIButton alloc]initWithFrame:CGRectMake(kScreen_W - 35, 5, 30, 30)];
    [close setImage:[UIImage imageNamed:@"pic_ico_wrong"] forState:UIControlStateNormal];
    close.backgroundColor = [UIColor clearColor];
    [self addSubview:close];
    
    [close addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}
-(void)button:(UIButton *)button{
    
    self.transform=CGAffineTransformIdentity;
    
}


-(void)changTableView:(int)count{
    img.hidden = YES;
    
    

    
    if (count == 3) {
        img.hidden=NO;
        
        
    }
    if (count == 0) {
        dataList = [[NSMutableArray alloc]initWithArray:array1];
    }if (count == 1) {
        dataList = [[NSMutableArray alloc]initWithArray:array2];
    }if (count == 2) {
        dataList = [[NSMutableArray alloc]initWithArray:array3];
    }
    
    [view reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewCell *collection = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];

    UILabel *lable = [[UILabel alloc]initWithFrame:collection.bounds];
//    [collection addSubview:lable];//重叠！！！！
    
    
    collection.backgroundView = lable;
    lable.textAlignment = NSTextAlignmentCenter;
    lable.textColor = [UIColor blackColor];
    lable.font = [UIFont systemFontOfSize:22];
    
    
    lable.text = dataList[indexPath.row];
    
    
    
    
    return collection;

}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    
    return UIEdgeInsetsMake(30, 30, 0, 30);
    
}
@end


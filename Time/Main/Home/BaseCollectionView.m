//
//  BaseCollectionView.m
//  Time
//
//  Created by bever on 16/2/26.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "BaseCollectionView.h"

@implementation BaseCollectionView 

- (instancetype)initWithFrame:(CGRect)frame
{
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flow.minimumLineSpacing = 20;
    self = [super initWithFrame:frame collectionViewLayout:flow];
    if (self) {
        
        self.delegate = self;
        self.dataSource = self;
        
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    
    return cell;
    
}

//返回单元格大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(self.itemWidth, 400);
    
}
//四周边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, (kScreen_W - self.itemWidth)/2, 0,(kScreen_W - self.itemWidth)/2 );
}

//设置居中
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    
   CGFloat floatx = targetContentOffset->x;
    
    
  NSInteger index = (floatx + 20)/(20 + self.itemWidth);
    
    targetContentOffset->x =  (self.itemWidth + 20)*index;
    
//    NSLog(@"%ld",index);
    self.current = index;
    

}












@end

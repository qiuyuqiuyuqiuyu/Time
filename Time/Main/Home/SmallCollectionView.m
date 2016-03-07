//
//  SmallCollectionView.m
//  Time
//
//  Created by bever on 16/2/26.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "SmallCollectionView.h"
#import "PostHeadCollectionViewCell.h"

@implementation SmallCollectionView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
//        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
//
        [self registerNib:[UINib nibWithNibName:@"PostHeadCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    }
    return self;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.item != self.current) {
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        self.current = indexPath.item;
    }
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PostHeadCollectionViewCell *headCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    headCell.homeheadmodel = _smallArray[indexPath.row];
    
    return headCell;
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _smallArray.count;
}

@end

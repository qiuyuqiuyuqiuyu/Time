//
//  BigCollectionView.m
//  Time
//
//  Created by bever on 16/2/26.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "BigCollectionView.h"
#import "PostCollectionViewCell.h"

@implementation BigCollectionView{
    BOOL turn;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
//        [self registerClass:[PostCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [self registerNib:[UINib nibWithNibName:@"PostCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    }
    return self;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.item == self.current) {
        
  
     PostCollectionViewCell *c =(PostCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        NSLog(@"%d",turn);
 
        [UIView transitionWithView:c duration:0.3 options:turn?UIViewAnimationOptionTransitionFlipFromLeft:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            
            //不可以两个同时使用
        
//            turn?(c.BigImgVie.hidden = NO )&&
//            (c.viewlable.hidden = YES):(c.BigImgVie.hidden = YES)&&
//        (c.viewlable.hidden = NO);
            
            if (turn) {
                c.BigImgVie.hidden = NO;
                c.viewlable.hidden = YES;
            } else{
                c.BigImgVie.hidden = YES;
                c.viewlable.hidden = NO;

            }
            
        } completion:^(BOOL finished) {
            turn= !turn;
        }];
        
        
  
      /*
//      第二种方法
        
        [UIView transitionWithView:c duration:0.3 options:c.viewlable.hidden?UIViewAnimationOptionTransitionFlipFromLeft:UIViewAnimationOptionTransitionFlipFromRight animations:^{

            c.viewlable.hidden = !c.viewlable.hidden;
            
            
        } completion:nil];
        */
        
    }else{
        
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        self.current = indexPath.item;
        
        
        
    }
       
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PostCollectionViewCell *postCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    postCell.homeModel = _bigArray[indexPath.row];
    
    return postCell;
    
    
}
//结束时 单元格还原
-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    PostCollectionViewCell *c = (PostCollectionViewCell *)cell;
    
    
    [c turnBack];
    
    turn = NO;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _bigArray.count;
}








@end

//
//  BaseCollectionView.h
//  Time
//
//  Created by bever on 16/2/26.
//  Copyright © 2016年 bever. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@property(nonatomic,assign)int itemWidth;

@property(nonatomic,assign)NSInteger current;


@end

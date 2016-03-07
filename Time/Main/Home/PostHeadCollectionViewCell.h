//
//  PostHeadCollectionViewCell.h
//  Time
//
//  Created by bever on 16/2/27.
//  Copyright © 2016年 bever. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface PostHeadCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong)HomeModel *homeheadmodel;
@property (weak, nonatomic) IBOutlet UIImageView *HeadImgView;



@end

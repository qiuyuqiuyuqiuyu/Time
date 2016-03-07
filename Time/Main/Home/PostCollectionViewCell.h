//
//  PostCollectionViewCell.h
//  Time
//
//  Created by bever on 16/2/27.
//  Copyright © 2016年 bever. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
#import "RatingView.h"

@interface PostCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)HomeModel *homeModel;
@property (weak, nonatomic) IBOutlet UIImageView *img;

@property (weak, nonatomic) IBOutlet UILabel *Lable1;
@property (weak, nonatomic) IBOutlet UILabel *Lable2;

@property (weak, nonatomic) IBOutlet UIView *viewlable;
@property (weak, nonatomic) IBOutlet UILabel *Lable3;
@property (weak, nonatomic) IBOutlet UILabel *Lable4;
@property (weak, nonatomic) IBOutlet UIView *View;
@property (weak, nonatomic) IBOutlet RatingView *StarView;
@property (weak, nonatomic) IBOutlet UIImageView *BigImgVie;

-(void)turnBack;

@end

//
//  PostCollectionViewCell.m
//  Time
//
//  Created by bever on 16/2/27.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "PostCollectionViewCell.h"

@implementation PostCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setHomeModel:(HomeModel *)homeModel{
    
    _homeModel = homeModel;

    [_img sd_setImageWithURL:[NSURL URLWithString:_homeModel.img]];
    
    _Lable1.text = [NSString stringWithFormat:@"中文名:%@",_homeModel.titleCn];
    _Lable2.text = [NSString stringWithFormat:@"英文名:%@",_homeModel.titleEn];
    _Lable3.text = [NSString stringWithFormat:@"年份:%@",_homeModel.rYear];
    
    _Lable4.text = [NSString stringWithFormat:@"%@", _homeModel.ratingFinal];
    [_BigImgVie sd_setImageWithURL:[NSURL URLWithString:_homeModel.img]];
    
    _viewlable.hidden = YES;
    
    _StarView.rating = [_homeModel.ratingFinal floatValue];
    
    
}
-(void)turnBack{
    
    [self bringSubviewToFront:_BigImgVie];
    _BigImgVie.hidden = NO;
    _viewlable.hidden = YES;
}
@end

//
//  PostHeadCollectionViewCell.m
//  Time
//
//  Created by bever on 16/2/27.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "PostHeadCollectionViewCell.h"

@implementation PostHeadCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setHomeheadmodel:(HomeModel *)homeheadmodel{
    
    _homeheadmodel = homeheadmodel;
    
    [_HeadImgView sd_setImageWithURL:[NSURL URLWithString:_homeheadmodel.img]];
    
}



@end

//
//  HomeCellTableViewCell.m
//  Time
//
//  Created by bever on 16/2/20.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "HomeCellTableViewCell.h"

@implementation HomeCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

//复写setModel方法
-(void)setHomeModel:(HomeModel *)homeModel{
    _homeModel = homeModel;
    
    _Lable.text = _homeModel.titleCn;
    
    [_imgView sd_setImageWithURL:[NSURL URLWithString:_homeModel.img]];
    
//    NSLog(@"1111%@",_imgView.image);
    
    if ([homeModel.ratingFinal floatValue] <= 0) {
        _Lable2.text = @"0.0";
        _View.rating = 0;
        
        
    }else{
    _Lable2.text = [NSString stringWithFormat:@"%@",_homeModel.ratingFinal];
        
        _View.rating = [_homeModel.ratingFinal floatValue];
    }
}




@end

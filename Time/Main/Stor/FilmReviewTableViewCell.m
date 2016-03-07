//
//  FilmReviewTableViewCell.m
//  Time
//
//  Created by bever on 16/3/2.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "FilmReviewTableViewCell.h"

@implementation FilmReviewTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(FilmReviewModel *)model{
    
    _model = model;
    _Lable1.text = model.title;
    _Lable2.text = model.summary;
    _Lable3.text = [NSString stringWithFormat:@"%@",model.rating];
    _Lable4.text = [NSString stringWithFormat:@"%@-评",model.nickname];
    _Lable5.text = [NSString stringWithFormat:@"%@",[model.relatedObj objectForKey:@"title"]];
    
    [_img2 sd_setImageWithURL:[NSURL URLWithString:model.userImage]];
    [_img1 sd_setImageWithURL:[NSURL URLWithString:[model.relatedObj objectForKey:@"image"]]];
    
}
@end

//
//  NewsTableViewCell.m
//  Time
//
//  Created by bever on 16/3/1.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "NewsTableViewCell.h"

@implementation NewsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(NerwsModel *)model{
    
    
    _model = model;
    _Lable11.text = model.title;
    _Lable12.text = model.title2;
    
    
//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:0];
  float a =  [model.publishTime floatValue]/360000000;
    _Lable13.text = [NSString stringWithFormat:@"%.0f小时前",a];
    
    _Lable14.text = [NSString stringWithFormat:@"%@条评论",model.commentCount];
    [_img11 sd_setImageWithURL:[NSURL URLWithString:model.image]];
    
    
    _Lable21.text = model.title;
    _Lable22.text = [NSString stringWithFormat:@"%.0f小时前评论",a];
    _Lable23.text = [NSString stringWithFormat:@"%@条评论",model.commentCount];

    [_img21 sd_setImageWithURL:[NSURL URLWithString:[model.images[0] objectForKey:@"url1"]]];
    [_img22 sd_setImageWithURL:[NSURL URLWithString:[model.images[1] objectForKey:@"url1"]]];
    [_img23 sd_setImageWithURL:[NSURL URLWithString:[model.images[2] objectForKey:@"url1"]]];

    
    
    
    
}

@end

//
//  HeadTableViewCell.m
//  项目一 01
//
//  Created by bever on 16/2/25.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "HeadTableViewCell.h"

@implementation HeadTableViewCell

- (void)awakeFromNib {
    _Button2.layer.cornerRadius = 15;
    [_Button2.layer setBorderColor:[[UIColor colorWithRed:0 green:0.3 blue:1 alpha:0.4] CGColor]];
    [_Button2.layer setBorderWidth:3];
}

-(void)setNextHeadModel:(NextHeadModel *)nextHeadModel{
    _nextHeadModel = nextHeadModel;
    _Lable2.text = [NSString stringWithFormat:@"%@",nextHeadModel.releaseDate];
    _Lable3.text = nextHeadModel.title;

    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@人正在期待",nextHeadModel.wantedCount]];

    [attribute addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, [NSString stringWithFormat:@"%@",nextHeadModel.wantedCount].length)];
    
    _Lable4.attributedText = attribute;
    
    _Lable5.text = [NSString stringWithFormat:@"导演:%@",nextHeadModel.director];
    
    _Lable6.text = [NSString stringWithFormat:@"主演:%@,%@",nextHeadModel.actor1,nextHeadModel.actor2];
    
    _Lable7.text = nextHeadModel.type;
    
    [_img sd_setImageWithURL:[NSURL URLWithString:nextHeadModel.image]];
    
    
}

@end

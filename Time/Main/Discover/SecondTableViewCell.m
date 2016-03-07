//
//  SecondTableViewCell.m
//  项目一 01
//
//  Created by bever on 16/2/25.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "SecondTableViewCell.h"

@implementation SecondTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    _Button2.layer.cornerRadius = 15;
    [_Button2.layer setBorderColor:[[UIColor colorWithRed:0 green:0.3 blue:1 alpha:0.4] CGColor]];
    [_Button2.layer setBorderWidth:3];
    
}

-(void)setNextmodel:(NextModel *)nextmodel{
    
    _nextmodel = nextmodel;
    _Lable1.text = [NSString stringWithFormat:@"%@日",nextmodel.rDay];
    _Lable2.text = nextmodel.title;
    
    
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@人在期待上映",nextmodel.wantedCount]];

    [attribute addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, [NSString stringWithFormat:@"%@",nextmodel.wantedCount].length)];
    
    _Lable3.attributedText = attribute;
    _Lable4.text = nextmodel.director;
    _Lable5.text = nextmodel.type;
    [_img1 sd_setImageWithURL:[NSURL URLWithString:nextmodel.image]];
    
    NSLog(@"222%@",_img1.image);
}
@end

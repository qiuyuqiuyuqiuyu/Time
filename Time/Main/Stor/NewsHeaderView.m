//
//  NewsHeaderView.m
//  Time
//
//  Created by bever on 16/3/4.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "NewsHeaderView.h"

@implementation NewsHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)awakeFromNib{
    [_Button1 setBackgroundImage:[[UIImage imageNamed:@"img_btn_green_half_press.9"] stretchableImageWithLeftCapWidth:5 topCapHeight:5] forState:UIControlStateNormal];
    [_Button2 setBackgroundImage:[[UIImage imageNamed:@"img_btn_orange_half_press.9"] stretchableImageWithLeftCapWidth:5 topCapHeight:5] forState:UIControlStateNormal];

    NSDictionary *dic = [Json json:@"image_news"];
    NSArray *array = [dic objectForKey:@"relations"];
    _Lable1.text = [NSString stringWithFormat:@"总评分:%@",[array[0] objectForKey:@"rating"]];
    _Lable2.text = @"类型:动作/冒险/科幻";
    _Lable3.text = @"时长:132分钟";
    _Lable4.text = [array[0] objectForKey:@"releaseDate"];
    [_img1 sd_setImageWithURL:[NSURL URLWithString:[array[0] objectForKey:@"image"]]];
    
    
}

@end

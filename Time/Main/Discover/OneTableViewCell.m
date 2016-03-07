//
//  OneTableViewCell.m
//  Time
//
//  Created by bever on 16/2/24.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "OneTableViewCell.h"

@implementation OneTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(HotModel *)model{
    
    _model = model;
    
    _Lable1.text = model.t;
    
    [_imgView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    
    //    _img1.image = [UIImage imageNamed:@"%@",model.]

    
    //字符串多样化显示
    
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",model.r]];
    
    if (attribute.length == 3) {
        
        [attribute addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(1, 2)];
        _Lable5.attributedText = attribute;
    }else{
        
        if ([model.r floatValue] <= 0) {
            model.r = 0;

            NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%.1f",[model.r floatValue]]];
            [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(1, 2)];
            
            _Lable5.attributedText = str;
            
        }else{
            
            NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%.1f",[model.r floatValue]]];
            [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(1, 2)];
            
            _Lable5.attributedText = str;
        
        }
    
    }
    
    if ([model.commonSpecial isEqualToString:@""]) {
        
        NSMutableAttributedString *str1 = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@人正在期待",model.wantedCount]];
        [str1 addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, [NSString stringWithFormat:@"%@",model.wantedCount].length)];
        _Lable2.attributedText = str1;
        
        
    }else{
        _Lable2.text = model.commonSpecial;
    }
    
    
    NSString *time = [NSString stringWithFormat:@"%@",model.rd];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    
    NSDate *date = [dateFormatter dateFromString:time];
    [dateFormatter setDateFormat:@"yy年MM月dd日"];
    NSString *news = [dateFormatter stringFromDate:date];
    
    _Lable3.text = [NSString stringWithFormat:@"%@上映",news];
    
    _Lable4.text = [NSString stringWithFormat:@"今日%@家影院  %@场",model.NearestCinemaCount,model.NearestShowtimeCount];
    
    
    UIImage *img1 = [UIImage imageNamed:@"icon_hot_show_IMAX3D"];
    UIImage *img2 = [UIImage imageNamed:@"icon_hot_show_IMAX"];
    UIImage *img3 = [UIImage imageNamed:@"icon_hot_show_DMAX"];
    
    
    if ([model.is3D intValue] == 1) {
        _img1.image = img1;
    }else{
        _img1.image = img2;
    }
    
    if ([model.is3D intValue] == 1 && [model.isIMAX intValue] == 1) {
        _img2.image = img2;
    }else{
        _img2.image = img3;
    }
    
    if ([model.is3D intValue] == 1 && [model.isIMAX intValue] == 1 && [model.isDMAX intValue]==1) {
        _img3.image = img3;
    }else{
        _img3.hidden = YES;
    }
    
    
    
    
    
}






















@end

//
//  PayTicketTableViewCell.m
//  Time
//
//  Created by bever on 16/2/29.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "PayTicketTableViewCell.h"

@implementation PayTicketTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    
}


-(void)setPayModel:(PayTickeModel *)payModel{
    _payModel = payModel;
    
    _Lable1.text = payModel.cinameName;
    _Lable3.text = payModel.address;
    _Lable2.text = [NSString stringWithFormat:@"￥ %.1f",[payModel.minPrice floatValue]/100];
    
    int i = 0;
    if ([[payModel.feature objectForKey:@"has3D"]isEqual:@0]) {
        _img1.hidden = YES;
        i++;
    }
    _img2.transform = CGAffineTransformMakeTranslation(-53*i, 0);
    if ([[payModel.feature objectForKey:@"hasIMAX"] isEqual:@0]) {
        _img2.hidden = YES;
        i++;
    }
    _img3.transform = CGAffineTransformMakeTranslation(-53*i, 0);
    
    if ([[payModel.feature objectForKey:@"hasVIP"] isEqual:@0]) {
        _img3.hidden = YES;
        i++;
    }
    _img4.transform = CGAffineTransformMakeTranslation(-53*i, 0);
    
    
    if ([[payModel.feature objectForKey:@"hasPark"] isEqual:@0]) {
        _img4.hidden = YES;
        i++;
    }
    _img5.transform = CGAffineTransformMakeTranslation(-53*i, 0);
    
    if ([[payModel.feature objectForKey:@"hasServiceTicket"] isEqual:@0]) {
        _img5.hidden = YES;
        i++;
    }
    _img6.transform = CGAffineTransformMakeTranslation(-53*i, 0);
    
    if ([[payModel.feature objectForKey:@"hasWifi"] isEqual:@0]) {
        _img6.hidden = YES;
    }

    
}

@end

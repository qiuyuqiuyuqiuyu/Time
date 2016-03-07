//
//  TralierTableViewCell.m
//  Time
//
//  Created by bever on 16/3/1.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "TralierTableViewCell.h"

@implementation TralierTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(TralierModel *)model{
    
    _model = model;
    _Lable1.text = model.movieName;
    _Lable2.text = model.summary;
    [_img sd_setImageWithURL:[NSURL URLWithString:model.coverImg]];
    
}
@end

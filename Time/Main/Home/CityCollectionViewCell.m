//
//  CityCollectionViewCell.m
//  Time
//
//  Created by bever on 16/2/22.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "CityCollectionViewCell.h"

@implementation CityCollectionViewCell{
    UILabel *lable;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self lable];
        self.layer.cornerRadius = 10;
        self.layer.borderColor = [[UIColor purpleColor] CGColor];
        self.layer.borderWidth = 5;
        self.clipsToBounds = YES;
        
    }
    return self;
}
-(void)lable{
    lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, (kScreen_W-80)/3, 50)];
//    lable.text = @"ddd";
    lable.backgroundColor = [UIColor blackColor];
    lable.alpha = 0.5;
    [self addSubview:lable];
    
    lable.textColor = [UIColor whiteColor];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.font = [UIFont boldSystemFontOfSize:20];
    

}
-(void)setModel:(LeftModel *)model{
    _model = model;
    lable.text = model.name;
    
    
}
@end

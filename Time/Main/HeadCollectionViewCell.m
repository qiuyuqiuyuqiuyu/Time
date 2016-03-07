//
//  HeadCollectionViewCell.m
//  Time
//
//  Created by bever on 16/2/22.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "HeadCollectionViewCell.h"


@implementation HeadCollectionViewCell{
    UILabel *lable ;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self head];
    }
    return self;
}
-(void)head{
   lable = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 150, 50)];
    [self addSubview:lable];
}

-(void)setString:(NSString *)string{
    _string = string;
    lable.text = _string;
    
}

@end

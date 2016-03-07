//
//  MyButtonView.m
//  Time
//
//  Created by bever on 16/2/23.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "MyButtonView.h"

@implementation MyButtonView{
    int count;
    UIImageView *img;
}

-(void)setButtonName:(NSArray *)buttonName{
    
    _buttonName = buttonName;
    count = (int)buttonName.count;
    
    for (int i = 0; i < count; i ++) {
        //self指view
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(self.frame.size.width/count*i, 0, self.frame.size.width/count, self.frame.size.height);
        
        [button setTitle:buttonName[i] forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        
        button.titleLabel.font = [UIFont systemFontOfSize:20];
        [self addSubview:button];
        button.tag = 100 + i;
        if (i == 0) {
            button.selected = YES;
            button.titleLabel.font = [UIFont systemFontOfSize:25];
        }
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    
}

-(void)buttonAction:(UIButton *)button1{
    
    [_delegate changTableView:(int)button1.tag - 100];

    
    for (UIView *views in self.subviews) {
        if ([views isKindOfClass:[UIButton class]]) {
            UIButton *bu = (UIButton *)views;
            bu.selected = NO;
            bu.titleLabel.font = [UIFont systemFontOfSize:20];
        }
        button1.selected = YES;
        button1.titleLabel.font = [UIFont systemFontOfSize:25];
    }
    [UIView animateWithDuration:.3 animations:^{
        img.frame = CGRectMake(button1.frame.origin.x, self.frame.size.height-2, self.frame.size.width/count, 2);
    }];
    
}

-(void)setImgName:(NSString *)imgName{
    img = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-2, self.frame.size.width/count, 2)];
    img.image = [UIImage imageNamed:imgName];
    
    [self addSubview:img];
    
}
@end

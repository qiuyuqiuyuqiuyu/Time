//
//  RatingView.m
//  Time
//
//  Created by bever on 16/2/20.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "RatingView.h"

@implementation RatingView{
    UIView *grayView;
    UIView *yellowView;
}

//加载xib走这个方法
-(void)awakeFromNib{
    [super awakeFromNib];
    [self view];
    
}

-(void)view{
    
    UIImage *gray = [UIImage imageNamed:@"gray@2x"];
    UIImage *yellow = [UIImage imageNamed:@"yellow@2x"];
    
    //获取宽，高
    CGFloat weight = gray.size.width *5;
    CGFloat height = gray.size.height;
    
    //初始化星星视图
    grayView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, weight, height)];
    [grayView setBackgroundColor:[UIColor colorWithPatternImage:gray]];
    
    yellowView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, weight, height)];
    [yellowView setBackgroundColor:[UIColor colorWithPatternImage:yellow]];
    
    [self addSubview:grayView];
    [self addSubview:yellowView];
    
    //放大
    CGFloat we = self.frame.size.width/weight;
    CGFloat he = self.frame.size.height/height;
    
    grayView.transform = CGAffineTransformMakeScale(we, he);
    yellowView.transform = CGAffineTransformMakeScale(we, he);
    
    
    //重新设置frame
    grayView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    yellowView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    
}
//重新设置黄色星星的大小
-(void)setRating:(CGFloat )rating{
    _rating = rating;//评分
    yellowView.frame = CGRectMake(0, 0, self.frame.size.width * _rating / 10, self.frame.size.height);
}


@end

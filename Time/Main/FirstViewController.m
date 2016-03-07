//
//  FirstViewController.m
//  Time
//
//  Created by bever on 16/3/4.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "FirstViewController.h"
#import "MainViewController.h"
@interface FirstViewController ()<UIScrollViewDelegate>

@end

@implementation FirstViewController{
    UIButton *_Button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadViews];
    
}
-(void)loadViews{
    _ScrollerView.contentSize = CGSizeMake(kScreen_W * 3,kScreen_H);
    _ScrollerView.pagingEnabled = YES;
    [self.view addSubview:_ScrollerView];
    _ScrollerView.scrollEnabled = YES;

    _ScrollerView.delegate = self;
    
    for (int i = 0; i < 3; i ++) {
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(kScreen_W *i, 0, kScreen_W, kScreen_H)];
        img.image = [UIImage imageNamed:[NSString stringWithFormat:@"wizard%d_920.jpg",i+1]];
        [_ScrollerView addSubview:img];
    }
    _Button = [[UIButton alloc]initWithFrame:CGRectMake(kScreen_W - 170, kScreen_H - 130, 140, 50)];
    [self.view addSubview:_Button];
    [_Button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    _Button.backgroundColor = [UIColor clearColor];
    

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    if (scrollView.contentOffset.x/kScreen_W == 2) {
        _Button.hidden = NO;
    }else{
        _Button.hidden = YES;
    }
}
-(void)button:(UIButton *)button{
    
    [MainViewController creatView];
}

@end

//
//  Block.m
//  Time
//
//  Created by bever on 16/3/4.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "Block.h"

@implementation Block{
    UIButton *cancel;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatselfBounds];
        [self button];
     }
    return self;
}
-(void)creatselfBounds{
   
    self.frame = CGRectMake(50, 100, 300, 500);
}

-(void)button{
    //创建cancelButton
    cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [cancel setFrame:CGRectMake(self.frame.size.width -40, 0, 40, 40)];
    
    [cancel addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    cancel.tag = 100;
    
    [self addSubview:cancel];
    

}
-(void)setCancelButtonImg:(NSString *)cancelButtonImg{
    _cancelButtonImg = cancelButtonImg;
    [cancel setImage:[UIImage imageNamed:cancelButtonImg] forState:UIControlStateNormal];
}
-(void)buttonAction:(UIButton *)button{
    
 [UIView animateWithDuration:0.3 animations:^{
     self.transform = CGAffineTransformMakeScale(3, 3);
     self.alpha = 0;//放大的时候 伴随着透明
 } completion:^(BOOL finished) {
     [self removeFromSuperview];
 }];
    
    
    
    
}

-(void)show{
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    [window addSubview:self];
    
    self.transform = CGAffineTransformMakeScale(0.7, 0.7);
    
    //两层动画
    [UIView animateWithDuration:0.3 animations:^{
        self.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        self.transform = CGAffineTransformIdentity;
    }];
    
    [self bringSubviewToFront:cancel];
    
}





@end

//
//  BackView.m
//  Time
//
//  Created by bever on 16/2/22.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "BackView.h"
#import "BackCollectionViewCell.h"
#import "BigCollectionView.h"
#import "SmallCollectionView.h"
#import "HomeModel.h"

@implementation BackView
{
    UIView *view;
    UIImageView *backImgView;
    UIView *blackView;
    UICollectionView *collection;
    BigCollectionView *big;
    SmallCollectionView *small;
    UILabel *lable;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self collectionView];
        [self black];
        [self headView];
        [self collectionView1];
        [self light];
        [self observe];
        [self lable];
    }
    return self;
}

//下面的Lable
-(void)lable{
    
    lable = [[UILabel alloc]initWithFrame:CGRectMake(0, kScreen_H - 180, kScreen_W, 50)];
    lable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:lable];
    lable.textColor = [UIColor whiteColor];
    lable.font = [UIFont systemFontOfSize:20];

//    lable.text = _homeModel.titleCn;
    
}
-(void)setDataList:(NSArray *)dataList{
    _dataList = dataList;
    big.bigArray = _dataList;
    small.smallArray = _dataList;
    
    HomeModel *model = dataList[0];
    lable.text = model.titleCn;
    
}
-(void)collectionView{
    
    big = [[BigCollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreen_W, self.frame.size.height)];
    //给itemWidth赋值
    big.itemWidth = 280;
    [self addSubview:big];
    
    
}
-(void)collectionView1{
    small = [[SmallCollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreen_W, 120)];
    small.itemWidth = 100;
    small.showsHorizontalScrollIndicator = NO;
    [backImgView addSubview:small];
}

//添加观察者

-(void)observe{
    
    [big addObserver:self forKeyPath:@"current" options:NSKeyValueObservingOptionNew context:NULL];
    
    [small addObserver:self forKeyPath:@"current" options:NSKeyValueObservingOptionNew context:NULL];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    //字典里面new是关键字
    
  NSInteger index =  [[change objectForKey:@"new"]integerValue];
  NSIndexPath *path = [NSIndexPath indexPathForItem:index inSection:0];
    
    HomeModel *model = _dataList[index];
    lable.text = model.titleCn;
    
    if ([keyPath isEqualToString:@"current"]) {
        if ([object isKindOfClass:[big class]]&& small.current != index) {
            
            //小的进行变化
           [ small scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            
            small.current = index;
            NSLog(@"small");
        }else if ([object isKindOfClass:[small class]] && big.current != index){
            [big scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            big.current = index;
            NSLog(@"big");
        }
    }
}
-(void)black{
    blackView = [[UIView alloc]initWithFrame:self.frame];
    blackView.backgroundColor = [UIColor blackColor];
    blackView.alpha = 0.5;
    blackView.hidden = YES;
    [self addSubview:blackView];

}
-(void)headView{
    backImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -120, kScreen_W, 150)];
    backImgView.image = [[UIImage imageNamed:@"indexBG_home"]stretchableImageWithLeftCapWidth:0 topCapHeight:3];
    backImgView.userInteractionEnabled = YES;
    
    [self addSubview:backImgView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];

    [button setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    button.frame = CGRectMake(kScreen_W/2-50, 125, 100, 30);
    [backImgView addSubview:button];
    [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)button:(UIButton *)button{
    button.selected = !button.selected;
    if (button.selected) {
        [UIView animateWithDuration:0.25 animations:^{
            backImgView.frame = CGRectMake(0, 0, kScreen_W, 150);
        }];
        blackView.hidden = NO;
        button.transform = CGAffineTransformMakeRotation(M_PI);
    }else{
        [UIView animateWithDuration:0.25 animations:^{
        backImgView.frame = CGRectMake(0, -120, kScreen_W, 150);
        }];
        blackView.hidden = YES;
        button.transform = CGAffineTransformIdentity;
    }
}
-(void)light{
    
    UIImageView *img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"light"]];
    img.frame = CGRectMake(0, 15, 150, 150);
    [self addSubview:img];
    
    UIImageView *img2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"light"]];
    img2.frame = CGRectMake(kScreen_W-150, 15, 150, 150);
    [self addSubview:img2];
    
}
@end

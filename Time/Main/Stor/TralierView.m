//
//  TralierView.m
//  Time
//
//  Created by bever on 16/3/1.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "TralierView.h"
#import "TralierModel.h"
#import "TralierTableViewCell.h"
#import "UIViewExt.h"
#import "TralierWebViewController.h"
#import "UIView+News.h"

@implementation TralierView{
    NSMutableArray *traliermutablearray;
    UIImageView *imgView;
    NSArray *tralier;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadDate];
        [self collect];
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_top_movie_background_cover"]];
    }
    return self;
}

-(void)loadDate{
    
    NSDictionary *di = [Json json:@"预告"];
    tralier = [di objectForKey:@"trailers"];
    
    
    traliermutablearray = [[NSMutableArray alloc]init];
    
    for (NSDictionary *dic in tralier) {
        
        TralierModel *tralierModel = [[TralierModel alloc]initWithDic:dic];
        
        [traliermutablearray addObject:tralierModel];
    }
}
-(void)collect{
    
    UITableView  *tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreen_W, kScreen_H - 60 - 55) style:UITableViewStylePlain];
    tableview.backgroundColor = [UIColor clearColor];
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_W, 250)];
    
    
    
    imgView = [[UIImageView alloc]init];
    imgView.frame = CGRectMake(0, 0, kScreen_W, 250);
    [tableview addSubview:imgView];
    [imgView sd_setImageWithURL:[NSURL URLWithString: [tralier[0] objectForKey:@"coverImg"]]];

    
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 210, kScreen_W, 40)];
    lable.text = @"《蚁人国际版终极预告》";
    lable.textColor = [UIColor whiteColor];
    lable.font = [UIFont systemFontOfSize:22];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.backgroundColor = [UIColor colorWithRed:0.8 green:0.9 blue:0.9                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    alpha:1];
    [tableview addSubview:lable];
    [traliermutablearray removeObjectAtIndex:0];

    
    [self addSubview:tableview];
    
    
}
//往下一滑就放大
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
  CGFloat y =  scrollView.contentOffset.y;
    if (y < 0) {
        imgView.height = 210 + ABS(y);
        imgView.top = y;
        
    CGFloat new_W = (210+ABS(y))/210 * kScreen_W;
        //图片自身的宽变化
        imgView.width = (210+ABS(y))/210 * kScreen_W;
        
        imgView.left = -(new_W - kScreen_W)/2;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return traliermutablearray.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TralierTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TralierTableViewCell" owner:self options:nil]lastObject];

    }
    cell.model = traliermutablearray[indexPath.row];

    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 150;
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    TralierWebViewController *tralierd = [[TralierWebViewController alloc]init];
    tralierd.hidesBottomBarWhenPushed = YES;
    [self.newsViewController.navigationController pushViewController:tralierd animated:YES];
    


}


@end

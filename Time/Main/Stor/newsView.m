//
//  newsView.m
//  Time
//
//  Created by bever on 16/3/1.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "newsView.h"
#import "NewsTableViewCell.h"
#import "NerwsModel.h"
#import "UIView+News.h"
#import "NewsTableViewController.h"
#import "NewsViewController.h"

@implementation newsView{
    NSMutableArray *newsMutable;
    
}



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_top_movie_background_cover"]];

        [self loadDate];
        [self collect];
    }
    return self;
}

-(void)collect{
    
    UITableView *newsTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreen_W, kScreen_H - 64 - 50) style:UITableViewStylePlain];
    newsTableView.backgroundColor = [UIColor clearColor];
    [self addSubview:newsTableView];
    
    
    newsTableView.delegate = self;
    newsTableView.dataSource = self;
    
   }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return newsMutable.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NewsTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1"];

    
    if (cell == nil || cell1 == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"NewsTableViewCell" owner:self options:nil]firstObject];
        cell1 = [[[NSBundle mainBundle]loadNibNamed:@"NewsTableViewCell" owner:self options:nil]lastObject];
    }
    
    cell1.model = newsMutable[indexPath.row];
    cell.model = newsMutable[indexPath.row];
    
    NerwsModel *model = newsMutable[indexPath.row];
    
    NSNumber *a = model.type;
    
    if ([a intValue] == 1) {
        
          return cell1;
    }
    
    
    return cell;


}


-(void)loadDate{
    
    NSDictionary *newsDic = [Json json:@"find_news"];
    NSArray *newsArray = [newsDic objectForKey:@"newsList"];
    
    newsMutable = [[NSMutableArray alloc]init];
    
    for (NSDictionary *dic in newsArray) {
        
        NerwsModel *nws = [[NerwsModel alloc]initWithDic:dic];
        
        [newsMutable addObject:nws];
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 150;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NerwsModel *model = newsMutable[indexPath.row];
    
    if ([model.type integerValue] == 1) {
        //3张图
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"News" bundle:nil];
        NewsTableViewController *newsVC = [story instantiateInitialViewController];
        self.newsViewController.hidesBottomBarWhenPushed = YES;
        [self.newsViewController.navigationController pushViewController:newsVC animated:YES];

    }
//   if ([model.type integerValue] == 2)
    else{
        NewsViewController *newsView = [[NewsViewController alloc]init];
       self.newsViewController.hidesBottomBarWhenPushed = YES;
        [self.newsViewController.navigationController pushViewController:newsView animated:YES];
        
    }
    
    
    self.newsViewController.hidesBottomBarWhenPushed = NO;

}








@end

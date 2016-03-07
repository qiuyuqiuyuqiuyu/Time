//
//  FilmReview.m
//  Time
//
//  Created by bever on 16/3/1.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "FilmReview.h"
#import "FilmReviewModel.h"
#import "FilmReviewTableViewCell.h"

@implementation FilmReview{
    NSMutableArray *dateList;
    NSIndexPath *_indexPath;//定义全局的indexpath，用来记录自己点击的是哪一个
    UITableView *_tableView;
    BOOL select[100];
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_top_movie_background_cover"]];
        [self loadDate];
        [self tableView];
    }
    return self;
}
-(void)loadDate{
    
    NSArray *array = [Json json:@"criticism"];
    dateList = [[NSMutableArray alloc]init];
    for (NSDictionary *dic in array) {
        FilmReviewModel *model = [[FilmReviewModel alloc]initWithDic:dic];
        [dateList addObject:model];
    }
}

-(void)tableView{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreen_W, kScreen_H - 64 - 49) style:UITableViewStylePlain];
    
    [self addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return dateList.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FilmReviewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"FilmReviewTableViewCell" owner:self options:nil]lastObject];
        
    }
    cell.model = dateList[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    FilmReviewModel *model = dateList[indexPath.row];
    CGRect p = [model.summary boundingRectWithSize:CGSizeMake(270, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]} context:nil];
    float height = p.size.height;
    if (indexPath == _indexPath) {
        
        if (select == NO) {
           
            return 200;
        }
        
        return height+200-55;
        
    }
    
    
//    select[_indexPath] = !select[_indexPath];
    
    return 200;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _indexPath = indexPath;
    
    [_tableView reloadData];
}









@end

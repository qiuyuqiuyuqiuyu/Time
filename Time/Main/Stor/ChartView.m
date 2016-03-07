//
//  ChartView.m
//  Time
//
//  Created by bever on 16/3/1.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "ChartView.h"
#import "ChartModel.h"

@implementation ChartView{
    NSMutableArray *_dataList;
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
    
    NSDictionary *dic = [Json json:@"rank2"];
    NSArray *array = [dic objectForKey:@"topLists"];
    _dataList = [[NSMutableArray alloc]init];
    for (NSDictionary * dc in array) {
        ChartModel *model = [[ChartModel alloc]initWithDic:dc];
        [_dataList addObject:model];
    }
}

-(void)tableView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreen_W, kScreen_H - 50 -64) style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor clearColor];
    [self addSubview:tableView];
    
    tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_W, 100)];
    
    UIButton *img = [[UIButton alloc]initWithFrame:CGRectMake(50, 10, kScreen_W/8, 50)];
    [tableView.tableHeaderView addSubview:img];
    [img setImage:[UIImage imageNamed:@"v10_MtimeTop100@3x"] forState:UIControlStateNormal];

    UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(30, 60, kScreen_W/4, 30)];
    lable1.text = @"时光TOP100";
    lable1.textColor = [UIColor purpleColor];
    [tableView.tableHeaderView addSubview:lable1];
    
    UIButton *img2 = [[UIButton alloc]initWithFrame:CGRectMake(180, 10, kScreen_W/8, 50)];
    [tableView.tableHeaderView addSubview:img2];
    [img2 setImage:[UIImage imageNamed:@"v10_ChineseTop100@3x"] forState:UIControlStateNormal];

    
    UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake(160, 60, kScreen_W/4, 30)];
    lable2.text = @"华语TOP100";
    lable2.textColor = [UIColor cyanColor];
    [tableView.tableHeaderView addSubview:lable2];
    
    UIButton *img3 = [[UIButton alloc]initWithFrame:CGRectMake(310, 10, kScreen_W/8, 50)];
    [tableView.tableHeaderView addSubview:img3];
    [img3 setImage:[UIImage imageNamed:@"v10_GlobalTopList@3x"] forState:UIControlStateNormal];

    UILabel *lable3 = [[UILabel alloc]initWithFrame:CGRectMake(290, 60, kScreen_W/4, 30)];
    lable3.text = @"全球票房榜";
    lable3.textColor = [UIColor yellowColor];
    [tableView.tableHeaderView addSubview:lable3];
    

    
    
    
    tableView.delegate =self;
    tableView.dataSource =self;
    
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
        cell.backgroundColor = [UIColor clearColor];

    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    ChartModel *model = _dataList[indexPath.row];
    cell.textLabel.text = model.topListNameCn;
    
    return cell;
}










@end

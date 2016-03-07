//
//  DiscoverViewController.m
//  项目一 01
//
//  Created by bever on 16/2/19.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "DiscoverViewController.h"
#import "HotModel.h"
#import "NextModel.h"
#import "NextHeadModel.h"
#import "OneTableViewCell.h"
#import "SecondTableViewCell.h"
#import "HeadTableViewCell.h"

@interface DiscoverViewController ()<ChangeTableView,UITableViewDataSource,UITableViewDelegate>

@end

@implementation DiscoverViewController{
    UITableView *tableView0;
    UITableView *tableView1;
    NSMutableArray *array;
    NSMutableDictionary *nextMutableDictionAry;
    NSArray *month;
    NSArray *nextArray;
    NSArray *headArray;
    NSMutableArray *headMutableArray;

}


-(id)init{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_top_movie_background_cover"]];
        self.title = @"购票";
        self.tabBarItem.image = [UIImage imageNamed:@"discover_on@3x"];
    }
    return self;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array1 = @[@"正在上映",@"即将上映"];
    MyButtonView *view = [[MyButtonView alloc]initWithFrame:CGRectMake(0, 0, kScreen_W, 50)];
    
    view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_top_movie_background_cover"]];
    
    view.buttonName = array1;
    [self.view addSubview:view];
    
    view.delegate = self;
    
    view.imgName = @"color_line";
    
    [self loadDate];
    [self loadDate1];
    [self tableView];
    [self LoadDate3];
    [self scrollerView];
    
   }

//第一个页面
-(void)loadDate{
    
    array = [[NSMutableArray alloc]init];
    
    NSDictionary *dictionary = [Json json:@"buy_now"];
    NSArray *msArray = [dictionary objectForKey:@"ms"];
    
    for (NSDictionary *dic in msArray) {
        HotModel *model = [[HotModel alloc]initWithDic:dic];
        
        [array addObject:model];
    }
    
}
//第二个页面下面
-(void)loadDate1{
    
    nextMutableDictionAry = [[NSMutableDictionary alloc]init];
    
    NSDictionary *nextDicionary = [Json json:@"buy_new"];
    nextArray = [nextDicionary objectForKey:@"moviecomings"];
    
    for (NSDictionary *d in nextArray) {
        NextModel *nextModel = [[NextModel alloc]initWithDic:d];
        
        NSMutableArray *nextMutableArray = [nextMutableDictionAry objectForKey:nextModel.rMonth];
//        NSLog(@"%@",nextModel.rMonth);
        
                
        if (nextMutableArray == nil) {
            NSMutableArray *m = [[NSMutableArray alloc]init];
            [m addObject:nextModel];
            [nextMutableDictionAry setObject:m forKey:nextModel.rMonth];
        }else{
            [nextMutableArray addObject:nextModel];
            [nextMutableDictionAry setObject:nextMutableArray forKey:nextModel.rMonth];
        }

    }
    month = @[@7,@8,@9];
    
}

//第二个页面上面的头
-(void)LoadDate3{

    NSDictionary *nextHead = [Json json:@"buy_new"];
    headArray = [nextHead objectForKey:@"attention"];
    headMutableArray = [[NSMutableArray alloc]init];
    
    for (NSDictionary *d in headArray) {
        NextHeadModel *headModel = [[NextHeadModel alloc]initWithDic:d];
        [headMutableArray addObject:headModel];
    }
    
    
}
//滑动视图
-(void)scrollerView{
    
    UIScrollView *scroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreen_W, 200)];
    scroller.contentSize = CGSizeMake(kScreen_W*headArray.count, 200);
    scroller.pagingEnabled = YES;
    scroller.showsHorizontalScrollIndicator = NO;
    
    
    
    [tableView1.tableHeaderView addSubview:scroller];
    
    HeadTableViewCell *cell0 = [[HeadTableViewCell alloc]init];
    
    for (int i = 0; i < headArray.count; i ++) {
        cell0.frame = CGRectMake(kScreen_W*i, 0, kScreen_W, 200);
        
        cell0 = [[[NSBundle mainBundle]loadNibNamed:@"HeadTableViewCell" owner:self options:nil]lastObject];
        [scroller addSubview:cell0];
        cell0.nextHeadModel = headMutableArray[i];
        
    }
    
}


//表示图
-(void)tableView{
    tableView0 = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, kScreen_W, kScreen_H - 150) style:UITableViewStylePlain];
    tableView0.delegate = self;
    tableView0.dataSource = self;
    tableView0.backgroundColor = [UIColor clearColor];
    
    tableView1 = [[UITableView alloc]initWithFrame:CGRectMake(kScreen_W,50, kScreen_W, kScreen_H - 150) style:UITableViewStylePlain];
    tableView1.delegate = self;
    tableView1.dataSource = self;
    tableView1.backgroundColor = [UIColor clearColor];
    tableView1.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_W, 200)];


    
    [self.view addSubview:tableView0];
    [self.view addSubview:tableView1];
}
//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}
//组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == tableView1) {
        return month.count;
    }
    return 1;
}
//每组多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView == tableView0) {
        
        return array.count;
    }
    
    NSArray *count1 = [nextMutableDictionAry objectForKey:month[section]];
//    NSLog(@"%ld",count1.count);

    return count1.count;
}

//每行内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    OneTableViewCell *cell0 = [tableView dequeueReusableCellWithIdentifier:@"cell0"];
    if (cell0 == nil) {
        cell0 = [[[NSBundle mainBundle]loadNibNamed:@"OneTableViewCell" owner:self options:nil]lastObject];
    }
    cell0.model = array[indexPath.row];
    
    
    SecondTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    if (cell1 == nil) {
        cell1 = [[[NSBundle mainBundle]loadNibNamed:@"SecondTableViewCell" owner:self options:nil]lastObject];        
    }
    if (tableView == tableView0) {
        return cell0;
    }
    cell1.nextmodel = [nextMutableDictionAry[month[indexPath.section]] objectAtIndex:indexPath.row];

    
    return cell1;
    
}

//table2的头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (tableView == tableView1) {
        
        UIView *headView = [[UIView alloc]initWithFrame:CGRectZero];
        headView.backgroundColor = [UIColor grayColor];
        
        
        UILabel *most = [[UILabel alloc]initWithFrame:CGRectMake(10,0, kScreen_W, 50)];
        most.text = @"最受欢迎";
        most.textColor = [UIColor whiteColor];
        most.font = [UIFont systemFontOfSize:25];
        [tableView1 addSubview:most];
        
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 150, 50)];
        lable.font = [UIFont systemFontOfSize:20];
        [headView addSubview:lable];
        lable.text = [NSString stringWithFormat:@"0%@月",month[section]];
        

        if (section == 0) {
            
            lable.frame = CGRectMake(10, 50, kScreen_W, 50);
            
            UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, kScreen_W, 50)];
            lable1.font = [UIFont systemFontOfSize:20];
            lable1.text = [NSString stringWithFormat:@"即将上映 (%lu部)",nextArray.count];
            [headView addSubview:lable1];
        }
        
        
        return headView;
        
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (tableView == tableView1) {
        
        if (section == 0) {
            return 100;
        }
        return 50;
    }
    return 0;
}

-(void)changTableView:(int)count{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        tableView0.frame = CGRectMake(-kScreen_W * count, 50, kScreen_W, kScreen_H - 150);
        
        tableView1.frame = CGRectMake(kScreen_W * (1 - count) , 50, kScreen_W, kScreen_H - 150);
        
    }];
    
    
}







@end

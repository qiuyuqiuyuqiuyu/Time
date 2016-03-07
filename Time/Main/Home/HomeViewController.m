//
//  HomeViewController.m
//  项目一 01
//
//  Created by bever on 16/2/19.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeModel.h"
#import "HomeCellTableViewCell.h"
#import "BackView.h"
#import "OneViewController.h"

@interface HomeViewController ()<cityname, UITableViewDataSource,UITableViewDelegate>

@end

@implementation HomeViewController{
    NSMutableArray *mutable;
    BackView *backView;
    UITableView *table;
}
-(id)init{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_top_movie_background_cover"]];
        
        self.title = @"主页";
        self.tabBarItem.image = [UIImage imageNamed:@"home_on@3x"];
    }
    return self;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    mutable = [[NSMutableArray alloc]init];
    [self button];
    //加载数据
    [self dataLoad];
    //创建表示图
    [self tableview];
    
    
  
}

-(void)dataLoad{
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"home_header" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    //创建一个字典，里面存放加载的json文件 第二个NSJSONReadingAllowFragments指既可以用数组也可以用字典形式
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    NSArray *array = [dic objectForKey:@"movies"];
    for (NSDictionary *dictionary in array) {
        HomeModel *homemodel = [[HomeModel alloc]init];
        homemodel.titleCn = [dictionary objectForKey:@"titleCn"];
        homemodel.titleEn = [dictionary objectForKey:@"titleEn"];
        homemodel.img = [dictionary objectForKey:@"img"];
        homemodel.commonSpecial = [dictionary objectForKey:@"commonSpecial"];
        homemodel.ratingFinal = [dictionary objectForKey:@"ratingFinal"];
        homemodel.rYear = [dictionary objectForKey:@"rYear"];
        
        [mutable addObject:homemodel];
        
//        NSLog(@"%@",homemodel.titleCn);
        
    }
    
}

-(void)tableview{
    
   table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0 ,kScreen_W,kScreen_H-64)];
    table.delegate = self;
    table.dataSource = self;
    table.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:table];
    
    
    backView = [[BackView alloc]initWithFrame:table.bounds];
    backView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_top_movie_background_cover"]];
    backView.hidden = YES;
    [self.view addSubview:backView];
    
    backView.dataList = mutable;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return mutable.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        
        //从Nib文件取出的是数组，所以需要last或者first取出其中一个
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeCellTableViewCell" owner:nil options:nil]lastObject];
    }
    
    cell.homeModel = mutable[indexPath.row];
    
    return cell;
//    NSLog(@"%ld",indexPath.row);
}

//设置单元格高度

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

-(void)button{
    //左侧按钮
    UIButton *leftbtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 90, 25)];
    [leftbtn setTitle:@"北京" forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbtn];
    [leftbtn addTarget:self action:@selector(leftButton:) forControlEvents:UIControlEventTouchUpInside];
    
    //右侧正面按钮
    UIButton *rightbtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightbtn1 setImage:[UIImage imageNamed:@"list_home@2x"] forState:UIControlStateNormal];
    rightbtn1.tag = 101;
    rightbtn1.frame = CGRectMake(0, 0, 50, 30);
    [rightbtn1 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x"] forState:UIControlStateNormal];
    [rightbtn1 addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //错误  不可以两边同时写下面代码
    //    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightbtn1];
    
    //右侧反面按钮
    UIButton *rightbtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightbtn2 setImage:[UIImage imageNamed:@"poster_home@2x"] forState:UIControlStateNormal];
    rightbtn2.tag = 102;
    rightbtn2.frame = CGRectMake(0, 0, 50, 30);
    [rightbtn2 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x"] forState:UIControlStateNormal];
    [rightbtn2 addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    
    //    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightbtn2];
    rightbtn2.hidden = YES;
    
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    [view addSubview:rightbtn1];
    [view addSubview:rightbtn2];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:view];//此处有initwithcustomview 所以有这个属性，下面就可以点出来,如果不用这个方法，这个属性会有，但是内容为空
    
    
}
//左侧按钮实现的方法
-(void)leftButton:(UIButton *)button{
    OneViewController *one = [[OneViewController alloc]init];
    
    one.delegate = self;
    one.title = button.titleLabel.text;
    one.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:one animated:YES];
//    one.tabBarController.tabBar.hidden = YES;
}

//右侧按钮实现的方法
-(void)button:(UIButton *)button{
    
    UIView *view = self.navigationItem.rightBarButtonItem.customView;
    
    button.hidden = YES;
    
    if (button.tag == 101) {
        UIButton *btn1 = [view viewWithTag:102];
        btn1.hidden = NO;
        self.navigationController.navigationBar.alpha = 0.5;
        
        table.hidden = YES;
        backView.hidden = NO;
        
        
        
//        [UIView animateWithDuration:1 animations:^{
//            
//            self.view.backgroundColor = [UIColor redColor];
//
//        }];

    }else if(button.tag == 102){
        UIButton *btn = [view viewWithTag:101];
        btn.hidden = NO;
        self.navigationController.navigationBar.alpha = 1;
        table.hidden = NO;
        backView.hidden = YES;
    }
    
    [self view:view isbool:button.tag == 101?YES:NO];
    [self view:self.view isbool:button.tag == 101?YES:NO];
    
}

//实现左翻还是右翻
-(void)view:(UIView *)view isbool:(BOOL)right{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        [UIView setAnimationTransition:right?UIViewAnimationTransitionFlipFromRight:UIViewAnimationTransitionFlipFromLeft forView:view cache:YES];
        
    }];
    
}
-(void)buttontext:(NSString *)text{
    
    UIButton *button = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
    
    
    [button setTitle:text forState:UIControlStateNormal];
}


@end

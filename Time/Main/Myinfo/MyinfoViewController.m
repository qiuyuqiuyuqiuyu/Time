//
//  MyinfoViewController.m
//  项目一 01
//
//  Created by bever on 16/2/19.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "MyinfoViewController.h"

@interface MyinfoViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MyinfoViewController{
    UITableView *_tableView;
}


-(id)init{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cinema_head_bg"]];
        self.title = @"个人";
        self.tabBarItem.image = [UIImage imageNamed:@"myinfo_on@3x"];
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];


    
    [self table];
    [self view1];
    [self view2];

}
-(void)table{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreen_W, kScreen_H - 64 - 49) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_W, 250)];
    _tableView.tableHeaderView.backgroundColor = [UIColor colorWithRed:0.45 green:0.53 blue:1 alpha:1];
    [self.view addSubview:_tableView];
   }

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *v = [[UIView alloc]init];
    v.backgroundColor = [UIColor grayColor ];
    return v;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        
        return 4;
    }
    return 5;
} 
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.section == 0) {
        
       if (indexPath.row == 0) {
        cell.imageView.image =[UIImage imageNamed:@"icon_my_cinema@3x "];
    }
        if (indexPath.row == 1){
        cell.imageView.image =[UIImage imageNamed:@"icon_my_coupon@3x "];
    }
        if (indexPath.row == 2) {
        cell.imageView.image =[UIImage imageNamed:@"icon_my_movie@3x "];
    }
        if (indexPath.row == 3) {
        cell.imageView.image =[UIImage imageNamed:@"icon_my_collection@3x "];
    }
    
}

    
    
    
    NSArray *array = @[@"我去影院看电影",@"我的优惠券",@"我的电影",@"我的收藏"];
    NSArray *array2 = @[@"设置",@"扫描二维码",@"意见反馈",@"喜欢我们 去打分",@"商城使用帮助"];
    if (indexPath.section == 0) {
        cell.textLabel.text = array[indexPath.row];
        return cell;
    }
    cell.textLabel.text = array2[indexPath.row];
    return cell;
    
}

-(void)view1{
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_W, 125)];
    [_tableView.tableHeaderView addSubview:view1];
    view1.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cinema_head_bg"]];
    
    UIImageView *img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_avatar_default_image_55x55@2x"]];
    img.frame = CGRectMake(40, 15, 80, 80);
    [view1 addSubview:img];
    
    UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(140, 40, 70, 30)];
    [button1 setBackgroundImage:[UIImage imageNamed:@"icon_hot_show_buy@2x"] forState:UIControlStateNormal];
    [button1 setTitle:@"登陆" forState:UIControlStateNormal];
    [button1 setTintColor:[UIColor whiteColor]];
    [view1 addSubview:button1];
    
    UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(240, 40, 70, 30)];
    [button2 setBackgroundImage:[UIImage imageNamed:@"icon_change_subway@3x"] forState:UIControlStateNormal];
    [button2 setTitle:@"注册" forState:UIControlStateNormal];
    [button2 setTintColor:[UIColor whiteColor]];
    [view1 addSubview:button2];
    
    
}
-(void)view2{
    
    UIButton *button3 = [[UIButton alloc]initWithFrame:CGRectMake(40, 145, 50, 50)];
    [button3 setBackgroundImage:[UIImage imageNamed:@"icon_my_shopping_cart@3x"] forState:UIControlStateNormal];
    [_tableView.tableHeaderView addSubview:button3];
    
    UILabel *lable3 = [[UILabel alloc]initWithFrame:CGRectMake(0, 210, kScreen_W/3, 30)];
    lable3.text = @"购物车";
    lable3.textAlignment = NSTextAlignmentCenter;
    [_tableView.tableHeaderView addSubview:lable3];
    
    UIButton *button4 = [[UIButton alloc]initWithFrame:CGRectMake(180, 145, 50, 50)];
    [button4 setBackgroundImage:[UIImage imageNamed:@"icon_my_movie_order@3x"] forState:UIControlStateNormal];
    [_tableView.tableHeaderView addSubview:button4];
    
    UILabel *lable4 = [[UILabel alloc]initWithFrame:CGRectMake(140, 210, kScreen_W/3, 30)];
    lable4.text = @"电影票订单";
    lable4.textAlignment = NSTextAlignmentCenter;
    [_tableView.tableHeaderView addSubview:lable4];
    

    UIButton *button5 = [[UIButton alloc]initWithFrame:CGRectMake(320, 145, 50, 50)];
    [button5 setBackgroundImage:[UIImage imageNamed:@"icon_my_goods_order@3x"] forState:UIControlStateNormal];
    [_tableView.tableHeaderView addSubview:button5];
    
    UILabel *lable5 = [[UILabel alloc]initWithFrame:CGRectMake(280, 210, kScreen_W/3, 30)];
    lable5.text = @"商品订单";
    lable5.textAlignment = NSTextAlignmentCenter;
    [_tableView.tableHeaderView addSubview:lable5];
    

    
    
    
    
}


@end

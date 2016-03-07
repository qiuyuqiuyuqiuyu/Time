//
//  PayTicketViewController.m
//  项目一 01
//
//  Created by bever on 16/2/19.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "PayTicketViewController.h"
#import "PayTickeModel.h"
#import "PayTicketTableViewCell.h"
#import "LastView.h"

@interface PayTicketViewController ()<UITableViewDataSource,UITableViewDelegate,ChangeTableView>

@end

@implementation PayTicketViewController{
    NSMutableArray *mutablecinema;
    UITableView *_tableView;
    NSMutableArray *mutable;
    LastView *_view;
}

-(id)init{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cinema_head_bg"]];
        self.title = @"优惠";
        self.tabBarItem.image = [UIImage imageNamed:@"payticket_on@3x"];
        
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buttonView];
    [self model];
    [self tableView];
    [self lastView];
    

}
-(void)lastView{
    _view = [[LastView alloc]initWithFrame:CGRectMake(0, kScreen_H - 50, kScreen_W, kScreen_H - 250)];
    _view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_view];
    _view.hidden = YES;
    
    

}

-(void)buttonView{
    MyButtonView *buttonView = [[MyButtonView alloc]initWithFrame:CGRectMake(0, 0, kScreen_W, 50)];
    buttonView.buttonName = @[@"全部",@"附近",@"价格",@"筛选"];
    buttonView.imgName = @"color_line";
    
    buttonView.delegate = self;
    
    
    
    [self.view addSubview:buttonView];
}


-(void)model{

    NSArray *cinema = [Json json:@"cinema"];
    mutablecinema = [[NSMutableArray alloc]init];
    for (NSDictionary *dic in cinema) {
        PayTickeModel *model = [[PayTickeModel alloc]initWithDic:dic];
        [mutablecinema addObject:model];
    }
    mutable = mutablecinema;
    
}

-(void)tableView{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, kScreen_W, kScreen_H - 64-49-50) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
    [self.view addSubview:_tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return mutablecinema.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    PayTicketTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"PayTicketTableViewCell" owner:self options:nil]lastObject];
        
    }
    
    cell.payModel = mutablecinema[indexPath.row];

    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 200;
}

//单元格复用之后复原

-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    for ( UIView *view in cell.contentView.subviews) {
        if ([view isKindOfClass:[UIImageView class]]) {
            view.hidden = NO;
            view.transform = CGAffineTransformIdentity;
        }
    }
}


-(void)changTableView:(int)count{
    
    if (count == 0) {
        [self model];
        _view.transform=CGAffineTransformIdentity;

    }
    if (count == 2) {
        
        for (int i = 0; i < mutablecinema.count-1; i ++) {
            
            for (int j = 0; j < mutablecinema.count - i - 1; j++) {
                
                if ([[mutablecinema[j] minPrice]floatValue] >= [[mutablecinema[j + 1] minPrice]floatValue]) {
                    
                    [mutablecinema exchangeObjectAtIndex:j withObjectAtIndex:j+1];
                }
            }
        }
        _view.transform=CGAffineTransformIdentity;

    }
    if (count == 1) {
        
        for (int i = 0; i < mutablecinema.count - 1 ; i ++) {
            for (int j = 0; j < mutablecinema.count - 1 - i; j++) {
                
                PayTickeModel *model = mutablecinema[j];
                PayTickeModel *model2 = mutablecinema[j+1];
                
                float length = sqrtf( powf(([model.longitude floatValue] - 110), 2) + powf( ([model.latitude floatValue] - 36), 2));
                
                float length2 = sqrtf( powf(([model2.longitude floatValue] - 110), 2) + powf( ([model2.latitude floatValue] - 36), 2));
                
                if (length >= length2) {
                    [mutablecinema exchangeObjectAtIndex:j withObjectAtIndex:j+1];
                }
                
                
                

            }
        }
        _view.transform=CGAffineTransformIdentity;
    }

    if (count == 3) {
        _view.hidden = NO;
        
        [UIView animateWithDuration:0.3 animations:^{
            
            _view.transform = CGAffineTransformMakeTranslation(0, -500);
        }];
        
          
    }
    
    [_tableView reloadData];

}







@end

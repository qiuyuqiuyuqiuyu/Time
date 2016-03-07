//
//  SecondTableViewCell.h
//  项目一 01
//
//  Created by bever on 16/2/25.
//  Copyright © 2016年 bever. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NextModel.h"

@interface SecondTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *Lable1;
@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UILabel *Lable2;
@property (weak, nonatomic) IBOutlet UILabel *Lable3;
@property (weak, nonatomic) IBOutlet UILabel *Lable4;
@property (weak, nonatomic) IBOutlet UIButton *Button2;

@property (weak, nonatomic) IBOutlet UIButton *Button1;
@property (weak, nonatomic) IBOutlet UILabel *Lable5;


@property(nonatomic,strong)NextModel *nextmodel;

@end

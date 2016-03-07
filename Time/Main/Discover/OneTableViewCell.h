//
//  OneTableViewCell.h
//  Time
//
//  Created by bever on 16/2/24.
//  Copyright © 2016年 bever. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotModel.h"

@interface OneTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *Lable1;
@property (weak, nonatomic) IBOutlet UILabel *Lable2;
@property (weak, nonatomic) IBOutlet UILabel *Lable3;
@property (weak, nonatomic) IBOutlet UILabel *Lable4;

@property (weak, nonatomic) IBOutlet UIImageView *img1;

@property (weak, nonatomic) IBOutlet UIImageView *img2;
@property (weak, nonatomic) IBOutlet UIImageView *img3;

@property (weak, nonatomic) IBOutlet UILabel *Lable5;
@property (weak, nonatomic) IBOutlet UIButton *Button;


@property(nonatomic,retain)HotModel *model;

@end

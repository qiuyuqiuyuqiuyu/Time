//
//  NewsTableViewCell.h
//  Time
//
//  Created by bever on 16/3/1.
//  Copyright © 2016年 bever. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NerwsModel.h"

@interface NewsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img11;
@property (weak, nonatomic) IBOutlet UILabel *Lable11;
@property (weak, nonatomic) IBOutlet UILabel *Lable12;
@property (weak, nonatomic) IBOutlet UILabel *Lable13;
@property (weak, nonatomic) IBOutlet UILabel *Lable14;

@property (weak, nonatomic) IBOutlet UILabel *Lable21;
@property (weak, nonatomic) IBOutlet UILabel *Lable22;
@property (weak, nonatomic) IBOutlet UILabel *Lable23;
@property (weak, nonatomic) IBOutlet UIImageView *img21;

@property (weak, nonatomic) IBOutlet UIImageView *img22;
@property (weak, nonatomic) IBOutlet UIImageView *img23;
@property(nonatomic,strong)NerwsModel *model;
@end

//
//  FilmReviewTableViewCell.h
//  Time
//
//  Created by bever on 16/3/2.
//  Copyright © 2016年 bever. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilmReviewModel.h"

@interface FilmReviewTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *Lable1;
@property (weak, nonatomic) IBOutlet UILabel *Lable2;
@property (weak, nonatomic) IBOutlet UILabel *Lable3;
@property (weak, nonatomic) IBOutlet UILabel *Lable4;
@property (weak, nonatomic) IBOutlet UILabel *Lable5;
@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UIImageView *img2;

@property(nonatomic,strong)FilmReviewModel *model;

@end

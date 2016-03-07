//
//  TralierTableViewCell.h
//  Time
//
//  Created by bever on 16/3/1.
//  Copyright © 2016年 bever. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TralierModel.h"

@interface TralierTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *Lable1;
@property (weak, nonatomic) IBOutlet UILabel *Lable2;
@property (weak, nonatomic) IBOutlet UIButton *button;


@property(nonatomic,strong)TralierModel *model;

@end

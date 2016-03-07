//
//  HomeCellTableViewCell.h
//  Time
//
//  Created by bever on 16/2/20.
//  Copyright © 2016年 bever. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
#import "RatingView.h"

@interface HomeCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *Lable;
@property (weak, nonatomic) IBOutlet RatingView *View;
@property (weak, nonatomic) IBOutlet UILabel *Lable2;

@property(nonatomic,strong)HomeModel *homeModel;

@end

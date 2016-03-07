//
//  NerwsModel.h
//  Time
//
//  Created by bever on 16/3/1.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "BaseModel.h"

@interface NerwsModel : BaseModel

@property(nonatomic,strong)NSNumber *type,*publishTime,*commentCount;
@property(nonatomic,copy)NSString *image,*title,*title2,*summary;

@property(nonatomic,strong)NSArray *images;



@end

//
//  TralierModel.h
//  Time
//
//  Created by bever on 16/3/1.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "BaseModel.h"

@interface TralierModel : BaseModel

@property(nonatomic,copy)NSString *movieName,*coverImg,*url,*videoTitle,*summary;
@property(nonatomic,assign)NSNumber *movieId,*videoLength,*rating;
@property(nonatomic,strong)NSArray *type;


@end

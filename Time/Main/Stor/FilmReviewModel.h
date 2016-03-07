//
//  FilmReviewModel.h
//  Time
//
//  Created by bever on 16/3/2.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "BaseModel.h"

@interface FilmReviewModel : BaseModel

@property(nonatomic,copy)NSString *v,*userImage,*title,*summary,*nickname;
@property(nonatomic,strong)NSDictionary *relatedObj;
@property(nonatomic,strong)NSNumber *rating;

@end

//
//  NextModel.h
//  Time
//
//  Created by bever on 16/2/25.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "BaseModel.h"

@interface NextModel : BaseModel

@property(nonatomic,copy)NSString *title,*director,*type,*releaseDate,*actor1,*actor2,*locationName,*image;
@property(nonatomic,assign)NSNumber *rYear,*rMonth,*rDay,*wantedCount,*videoCount;
@property(nonatomic,assign)BOOL isTicket;

@end

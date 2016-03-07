//
//  NextHeadModel.h
//  Time
//
//  Created by bever on 16/2/25.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "BaseModel.h"

@interface NextHeadModel : BaseModel

@property(nonatomic,copy)NSString *title,*releaseDate,*type,*director,* actor1,*actor2,*locationName,*image;
@property(nonatomic,assign)NSNumber *rYear,*rMonth,*rDay,*wantedCount,*videoCount;
@property(nonatomic,assign)BOOL isTicket;

@end

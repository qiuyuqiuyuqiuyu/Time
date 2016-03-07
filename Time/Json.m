//
//  Json.m
//  Time
//
//  Created by bever on 16/2/22.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "Json.h"

@implementation Json

+(id)json:(NSString *)name{
    NSString *path = [[NSBundle mainBundle]pathForResource:name ofType:@"json"];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    return json;
}


@end

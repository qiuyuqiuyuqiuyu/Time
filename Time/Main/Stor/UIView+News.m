//
//  UIView+News.m
//  Time
//
//  Created by bever on 16/3/4.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "UIView+News.h"

@implementation UIView (News)
-(UIViewController *)newsViewController{
    UIResponder *resPonder = self.nextResponder;
    do {
        if ([resPonder isKindOfClass:[UIViewController class]]) {
            

            return (UIViewController *)resPonder;
        }
    resPonder = resPonder.nextResponder;
    } while (resPonder != nil);
    
    return nil;
    
    
}

@end

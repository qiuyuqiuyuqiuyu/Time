//
//  OneViewController.h
//  Time
//
//  Created by bever on 16/2/22.
//  Copyright © 2016年 bever. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol cityname <NSObject>

-(void)buttontext:(NSString *)text;


@end

@interface OneViewController : UIViewController

@property(nonatomic,assign)id <cityname>delegate;

@end

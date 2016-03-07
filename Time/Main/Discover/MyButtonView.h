//
//  MyButtonView.h
//  Time
//
//  Created by bever on 16/2/23.
//  Copyright © 2016年 bever. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ChangeTableView <NSObject>

-(void)changTableView:(int)count;

@end



@interface MyButtonView : UIView

@property(nonatomic,assign)NSArray *buttonName;
@property(nonatomic,copy)NSString *imgName;
@property(nonatomic,assign)id <ChangeTableView>delegate;



@end

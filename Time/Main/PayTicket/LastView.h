//
//  LastView.h
//  Time
//
//  Created by bever on 16/2/29.
//  Copyright © 2016年 bever. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LastView : UIView<ChangeTableView,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>


@property(nonatomic,copy)NSString *title;

@end

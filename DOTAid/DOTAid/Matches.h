//
//  Matches.h
//  DOTAid
//
//  Created by medicool on 14-9-18.
//  Copyright (c) 2014年 com. All rights reserved.
//

#define KEY @"84E45CA96D3126C5165A4ED390AED541"


#import <UIKit/UIKit.h>
#import "MainViewController.h"


@interface Matches : UIView<UITableViewDataSource,UITableViewDelegate>

@property (retain,nonatomic) MainViewController         *parent;
@property (nonatomic,retain) NSDictionary *matchDic;
@property (nonatomic,retain) NSMutableArray *matchesArray;
@property (nonatomic,retain)NSMutableArray *testArray;
@end

//
//  SetViewController.h
//  DOTAid
//
//  Created by medicool on 14-9-18.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "RootViewController.h"

@interface SetViewController : RootViewController<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic,retain)NSMutableArray *testArray;
@end

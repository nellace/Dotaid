//
//  HomeViewController.h
//  DOTAid
//
//  Created by WO on 15-4-24.
//  Copyright (c) 2015年 com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESideMenu.h"

@interface HomeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *matchesListTab;
@property (nonatomic,strong) NSArray *matchArray;
@end

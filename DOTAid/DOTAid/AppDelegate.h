//
//  AppDelegate.h
//  DOTAid
//
//  Created by medicool on 14-9-16.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESideMenu.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,RESideMenuDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (NSInteger)OSVersion;

@end

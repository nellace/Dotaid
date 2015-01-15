//
//  RootViewController.h
//  DOTAid
//
//  Created by medicool on 14-9-16.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESideMenu.h"

#define IS_WIDESCREEN ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

@interface RootViewController : UIViewController

@property (nonatomic,retain,readonly) RESideMenu *sideMenu;

@end

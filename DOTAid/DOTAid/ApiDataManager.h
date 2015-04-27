//
//  ApiDataManager.h
//  DOTAid
//
//  Created by hello on 15/3/17.
//  Copyright (c) 2015年 com. All rights reserved.
//

#define ApiUrl @"http://dailydota2.com/match-api"

#import <Foundation/Foundation.h>

@interface ApiDataManager : NSObject

+(ApiDataManager *)instance;

- (void)getMatchesListWithHolder:(UIView *)holder
                         Success:(void(^)(NSArray *array))success;

@end

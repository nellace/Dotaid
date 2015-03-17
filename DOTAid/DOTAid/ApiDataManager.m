//
//  ApiDataManager.m
//  DOTAid
//
//  Created by hello on 15/3/17.
//  Copyright (c) 2015年 com. All rights reserved.
//

#import "ApiDataManager.h"

@implementation ApiDataManager

+(ApiDataManager *)instance
{
    static ApiDataManager *instanceManagerData = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instanceManagerData = [[self alloc]init];
    });
    return instanceManagerData;
}
@end

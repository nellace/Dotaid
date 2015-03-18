//
//  ApiDataManager.m
//  DOTAid
//
//  Created by hello on 15/3/17.
//  Copyright (c) 2015年 com. All rights reserved.
//

#import "ApiDataManager.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"
#import "JSONKit.h"

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

- (void)getMatchesListWithHolder:(UIView *)holder Success:(void (^)(NSArray *))success
{
    AFHTTPRequestOperationManager *manager =[AFHTTPRequestOperationManager manager];
    [manager GET:ApiUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject) {
            NSArray *array =[[NSArray arrayWithObject:[responseObject objectForKey:@"matches"]]firstObject];
            success(array);
            NSLog(@"json:%@",array);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@",error);
    }];
}
@end

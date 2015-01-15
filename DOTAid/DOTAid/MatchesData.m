//
//  MatchesData.m
//  DOTAid
//
//  Created by medicool on 14-9-23.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "MatchesData.h"

@implementation MatchesData

-(MatchesData *)initWithDictionary:(NSDictionary *)dic
{
    if (self = [super init]) {
        if ([[dic objectForKey:@"teams"]count]!=0) {
            self.teamFirst = [[dic objectForKey:@"teams"][0] objectForKey:@"team_name"];
            
            if ([dic[@"teams"] count]==1) {
                
                self.teamSecond = @"TBD";
            }else
            {
                self.teamSecond = [dic[@"teams"][1] objectForKey:@"team_name"];
            }
        }else
        {
            self.teamFirst = @"TBD";
            self.teamSecond = @"TBD";
            
        }
    }
    return self;
}

+(MatchesData *)infoWithDictionary:(NSDictionary *)dic
{
    MatchesData *info = [[MatchesData alloc]initWithDictionary:dic];
    return info;
}

@end

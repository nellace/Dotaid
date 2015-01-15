//
//  MatchesData.h
//  DOTAid
//
//  Created by medicool on 14-9-23.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MatchesData : NSObject

@property (nonatomic,copy) NSString *teamFirst;
@property (nonatomic,copy) NSString *teamSecond;
@property (nonatomic,copy) NSString *vsLabel;

- (MatchesData *)initWithDictionary:(NSDictionary *)dic;


+ (MatchesData *)infoWithDictionary:(NSDictionary *)dic;

@end

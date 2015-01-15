//
//  matchesCell.m
//  DOTAid
//
//  Created by medicool on 14-9-23.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "matchesCell.h"
#import "MatchesData.h"

@interface matchesCell ()
{
    UILabel *team1;
    UILabel *vsLable;
    UILabel *team2;
}



@end

@implementation matchesCell

//- (void)awakeFromNib {
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }
    return self;
}

- (void)initSubView
{
    team1 = [[UILabel alloc]init];
//    team1.textAlignment = NSTextAlignmentCenter;
//    team1.font = [UIFont fontWithName:@"Arial" size:9];
    [self addSubview:team1];
    
    vsLable = [[UILabel alloc]init];
    vsLable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:vsLable];
    
    team2 = [[UILabel alloc]init];
    team2.textAlignment = NSTextAlignmentCenter;
    [self addSubview:team2];
}

- (void)setMatchData:(MatchesData *)matchData{
    
    
    team1.frame = CGRectMake(50, 10, 90, 20);
    team1.text = matchData.teamFirst;

    
    vsLable.frame = CGRectMake(150, 15, 20, 20);
    
    //        vs.backgroundColor = [UIColor blueColor];
    vsLable.text = @"vs";
    
    team2.frame = CGRectMake(180, 20, 90, 20);
    
    team2.text = matchData.teamSecond;
}
@end

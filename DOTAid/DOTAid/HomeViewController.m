//
//  HomeViewController.m
//  DOTAid
//
//  Created by WO on 15-4-24.
//  Copyright (c) 2015年 com. All rights reserved.
//

#import "HomeViewController.h"
#import "UIImageView+AFNetworking.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize matchesListTab;
@synthesize matchArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Matches";
    matchArray = [NSArray new];
    matchesListTab  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT+20)];
    matchesListTab.tableFooterView = [UIView new];
    matchesListTab.delegate = self;
    matchesListTab.dataSource = self;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"IconMenu"]
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(presentLeftMenuViewController:)];
    
    [[ApiDataManager instance]getMatchesListWithHolder:self.view Success:^(NSArray *array) {
        matchArray = [NSArray arrayWithArray:array];
        [matchesListTab reloadData];
    }];
    
    [self.view addSubview:matchesListTab];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (matchArray.count > 0) {
        return matchArray.count;
    }else
        return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        UIImageView *teamLeft = [[UIImageView alloc]initWithFrame:CGRectMake(40, 15, 40, 40)];
        teamLeft.tag = 2000;
        [cell.contentView addSubview:teamLeft];
        
        UIImageView *teamRight = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 80, 15, 40, 40)];
        teamRight.tag = 2001;
        [cell.contentView addSubview:teamRight];
        
        UILabel *nameLeft = [[UILabel alloc]initWithFrame:CGRectMake(0, 50, 120, 30)];
        nameLeft.tag = 1000;
        nameLeft.font = [UIFont boldSystemFontOfSize:13];
        nameLeft.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:nameLeft];
        
        UILabel *nameRight = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 120, 50, 120, 30)];
        nameRight.tag = 1001;
        nameRight.font = [UIFont boldSystemFontOfSize:13];
        nameRight.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:nameRight];
        
        UILabel *leaguesName = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 80, 5, 160, 30)];
        leaguesName.tag = 1002;
        leaguesName.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption1 ];
        leaguesName.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:leaguesName];
        
        UILabel *matchTime = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 60, 30, 120, 25)];
        matchTime.tag = 1003;
        matchTime.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
        matchTime.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:matchTime];
        
        UILabel *matchState = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 40, 55, 80, 20)];
        matchState.textAlignment = NSTextAlignmentCenter;
        matchState.tag = 1005;
        matchState.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
        [cell.contentView addSubview:matchState];
    }
    if (matchArray.count > 0) {
        NSDictionary *dic =[matchArray objectAtIndex:indexPath.row];
        
        NSString *imageStrLeft =[NSString stringWithFormat:@"%@%@",BASE_URL,[[dic objectForKey:@"team1"]objectForKey:@"logo_url"]];
        NSURL *imageUrlLeft = [NSURL URLWithString:imageStrLeft];
//        NSData *data = [NSData dataWithContentsOfURL:imageUrlLeft];
        
        UIImageView *teamLeft = (UIImageView*)[cell.contentView viewWithTag:2000];
        [teamLeft setImageWithURL:imageUrlLeft];
        
        NSString *imageStrRight =[NSString stringWithFormat:@"%@%@",BASE_URL,[[dic objectForKey:@"team2"]objectForKey:@"logo_url"]];
        NSURL *imageUrlRight =[NSURL URLWithString:imageStrRight];
        UIImageView *teamRight = (UIImageView*)[cell.contentView viewWithTag:2001];
        [teamRight setImageWithURL:imageUrlRight];
        
        UILabel *nameLeft =(UILabel*)[cell.contentView viewWithTag:1000];
        nameLeft.text = [[dic objectForKey:@"team1"]objectForKey:@"team_tag"];
        
        UILabel *nameRight =(UILabel*)[cell.contentView viewWithTag:1001];
        nameRight.text = [[dic objectForKey:@"team2"]objectForKey:@"team_tag"];
        
        UILabel *leaguesName =(UILabel*)[cell.contentView viewWithTag:1002];
        leaguesName.text = [[dic objectForKey:@"league"]objectForKey:@"name"];
        
        UILabel *matchTime =(UILabel*)[cell.contentView viewWithTag:1003];
        matchTime.text = [dic objectForKey:@"timediff"];
        
        UILabel *matchState =(UILabel*)[cell.contentView viewWithTag:1005];
        if ([[dic objectForKey:@"status"]isEqualToString:@"1"]) {
            matchState.text = @"进行中";
        }else
        {
            matchState.text = @"未开始";
        }
    }
    
    return cell;
}
@end

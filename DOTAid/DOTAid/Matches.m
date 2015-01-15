//
//  Matches.m
//  DOTAid
//
//  Created by medicool on 14-9-18.
//  Copyright (c) 2014年 com. All rights reserved.
//



#import "Matches.h"
#import "MatchDetailViewController.h"
#import "MainViewController.h"
#import "JSONKit.h"
#import "MatchesData.h"
#import "matchesCell.h"


@interface Matches ()
{
    NSString *scheduledURL;
    
    UILabel *time;
    UILabel *team1;
    UILabel *team2;
}

@property (nonatomic,retain) UITableView                *matchesTabView;

@property (strong, nonatomic) UIView                    *container;

@end

@implementation Matches

@synthesize parent;
@synthesize matchDic;
@synthesize matchesArray;
@synthesize testArray;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.container =  [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];
//        [self.container setBackgroundColor:[UIColor clearColor]];
//        self.container.backgroundColor = [UIColor redColor];
        [self addSubview:self.container];
        

//
//        self.backgroundColor = [UIColor redColor];
//        NSLog(@"%f    %f",self.bounds.origin.y,self.bounds.size.height);
//        [self getMatchesInfo];
        [self createTableView];
//        [self initData];
        
        NSLog(@"-------2");
    }
    return self;
}


- (void)createTableView
{
    _matchesTabView = [[UITableView alloc]initWithFrame:self.bounds];
//    NSLog(@"%f    %f",_matchesTabView.bounds.origin.y,_matchesTabView.bounds.size.height);
    
    _matchesTabView.delegate = self;
    _matchesTabView.dataSource = self;
    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    btn.frame = CGRectMake(100, 100, 100, 100);
//    [btn setTitle:@"11" forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
//    self.backgroundColor = [UIColor redColor];
//    self.container.backgroundColor = [UIColor blueColor];
//    [self addSubview:btn];
    
//    _matchesTabView.backgroundColor = [UIColor clearColor];
    
    
    [self addSubview:_matchesTabView];
    
}


//- (void)initData
//{
//    NSString *path = [[NSBundle mainBundle]pathForResource:@"CellList" ofType:@"plist"];
//    NSArray *array = [NSArray arrayWithContentsOfFile:path];
//    matchesArray = [[NSMutableArray alloc]init];
//    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        [matchesArray addObject:[MatchesData infoWithDictionary:obj]];
//    }];
//}



#pragma mark Tabelview

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return matchesArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    matchesCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    NSLog(@"%ld",(long)indexPath.row);
    if (!cell) {
        cell = [[matchesCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//        time.font = [UIFont fontWithName:@"Arial" size:9];
//        //        time.backgroundColor = [UIColor blueColor];
//        time.textAlignment = NSTextAlignmentCenter;
//        time.text = @"11";
//        [cell addSubview:time];

    }
    MatchesData *data = matchesArray[indexPath.row];
    cell.matchData = data;
    return cell;
}

/*- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    int _indexNum = indexPath.row;
    
    NSLog(@"%ld",(long)indexPath.row);
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        time = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, 30, 13)];
        
        time.font = [UIFont fontWithName:@"Arial" size:9];
//        time.backgroundColor = [UIColor blueColor];
        time.textAlignment = NSTextAlignmentCenter;
        [cell addSubview:time];
        
        UILabel *team1 = [[UILabel alloc]initWithFrame:CGRectMake(50, 10, 90, 20)];
        team1.textAlignment = NSTextAlignmentCenter;
//        team1.backgroundColor = [UIColor blueColor];

        [cell addSubview:team1];
        
        
        
        UILabel *vs = [[UILabel alloc]initWithFrame:CGRectMake(150, 15, 20, 20)];
        vs.textAlignment = NSTextAlignmentCenter;
//        vs.backgroundColor = [UIColor blueColor];
        vs.text = @"vs";
        [cell addSubview:vs];
        
        team2 = [[UILabel alloc]initWithFrame:CGRectMake(180, 20, 90, 20)];
        team2.textAlignment = NSTextAlignmentCenter;
//        team2.backgroundColor = [UIColor blueColor];


        [cell addSubview:team2];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    time.text = @"2h19m";
    
    
    NSString* teamName1 = [[matchesArray[_indexNum]objectForKey:@"teams"][0]objectForKey:@"team_name"];
    team1.text = teamName1;
    
    
    if ([[matchesArray[_indexNum]objectForKey:@"teams"]count]==2) {
        NSString *teamName2 = [[matchesArray[_indexNum]objectForKey:@"teams"][1] objectForKey:@"team_name"];
        team2.text = teamName2;
    }else
    {
        team2.text = @"TBD";
    }
    
    
    return cell;
}*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MatchDetailViewController *detail = [[MatchDetailViewController alloc]init];
    

    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleBordered target:nil action:nil];
    [parent.navigationItem setBackBarButtonItem:backItem];
    [parent.navigationController pushViewController:detail animated:YES];
}


#pragma GET

-(void)getMatchesInfo
{
//    NSString *getScheldedURL = @"http://api.steampowered.com/IDOTA2Match_570/GetScheduledLeagueGames/v1/";
    scheduledURL = [NSString stringWithFormat:@"http://api.steampowered.com/IDOTA2Match_570/GetScheduledLeagueGames/v1/?key=%@",KEY];
//
//    ASIFormDataRequest *request = [[ASIFormDataRequest alloc]initWithURL:[NSURL URLWithString:getScheldedURL]];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:scheduledURL]];
    request.delegate = self;
    [request setTimeOutSeconds:20];
//    [request setPostValue:KEY forKey:@"key"];
    [request startAsynchronous];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
    NSLog(@"错误%@",[error userInfo]);
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"%@",[request responseString]);
    if ([request responseString]) {
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:scheduledURL]];
        matchDic = [data objectFromJSONData];
        matchesArray = [[matchDic objectForKey:@"result"]objectForKey:@"games"];
        NSLog(@"%@",matchesArray[0]);
    }
    
    NSLog(@"succes");
    
}

@end

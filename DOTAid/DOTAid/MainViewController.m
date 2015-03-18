//
//  MainViewController.m
//  DOTAid
//
//  Created by medicool on 14-9-17.
//  Copyright (c) 2014年 com. All rights reserved.
//

#define SELECTED_VIEW_CONTROLLER_TAG 98456345

#import "MainViewController.h"

#import "Profile.h"
#import "Matches.h"
#import "Lives.h"
#import "JSONKit.h"
#import "MatchesData.h"



@interface MainViewController ()
{
    UITabBar *_tabBar;
    NSDictionary *matchesDic;
    NSMutableArray *gameArray;
    NSString *scheduledURL;
}

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    Matches *matchView = [[Matches alloc]init];
    
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.000];
    [self getMatchesInfo];
    [self createViews];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)createViews
{
    _tabBar = [[UITabBar alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.bounds)-44, CGRectGetWidth(self.view.bounds), 44)];
    NSLog(@"tabHeight%f",CGRectGetHeight(self.view.bounds)-44);

    
    _tabBar.delegate = self;
    
    UITabBarItem *tabMatches = [[UITabBarItem alloc]init];
    tabMatches.title = @"1";
    tabMatches.tag = 1;
    UITabBarItem *tabPersonal = [[UITabBarItem alloc]init];
    tabPersonal.title = @"2";
    tabPersonal.tag = 2;
    UITabBarItem *tabLive = [[UITabBarItem alloc]init];
    tabLive.title = @"3";
    tabLive.tag = 3;
    _tabBar.items = [NSArray arrayWithObjects:tabMatches,tabPersonal,tabLive, nil];
    [self.view addSubview:_tabBar];
    
    self.title = @"Main";
    
    UIView *currentView = [self.view viewWithTag:SELECTED_VIEW_CONTROLLER_TAG];
    [currentView removeFromSuperview];
    
    
    Profile *profile = [[Profile alloc]initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)-44-64)];
    //        [self.view addSubview:sec];
    profile.tag = SELECTED_VIEW_CONTROLLER_TAG;
    [self.view insertSubview:profile belowSubview:_tabBar];

    
    
//    _tabBar.backgroundColor = [UIColor blackColor];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if (item.tag == 1 ) {
        
        UIView *currentView = [self.view viewWithTag:SELECTED_VIEW_CONTROLLER_TAG];
        [currentView removeFromSuperview];
        

//        MatchesViewController *match = [[MatchesViewController alloc]init];
        //进入mainview的时候拿到所有比赛数据，传给matches view；
        Matches *matches = [[Matches alloc]initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)-44-64)];
        matches.matchDic = matchesDic;
        matches.matchesArray = gameArray;
        matches.parent = self;
        NSLog(@"%f",matches.bounds.origin.y);
//        [self.view addSubview:first];
        matches.tag = SELECTED_VIEW_CONTROLLER_TAG;
        [self.view insertSubview:matches belowSubview:_tabBar];
//        [self.view bringSubviewToFront:first];
//        [self.view insertSubview:match.view belowSubview:_tabBar];
        self.title = @"Matches";
        NSLog(@"matchView show");
        
    }if (item.tag == 2) {
        UIView *currentView = [self.view viewWithTag:SELECTED_VIEW_CONTROLLER_TAG];
        [currentView removeFromSuperview];
        
        
        Profile *profile = [[Profile alloc]initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)-44-64)];
//        [self.view addSubview:sec];
        self.title = @"Profile";
        profile.tag = SELECTED_VIEW_CONTROLLER_TAG;
        [self.view insertSubview:profile belowSubview:_tabBar];
        
        NSLog(@"personalView show");
        
    }if (item.tag == 3) {
        
        UIView *currentView = [self.view viewWithTag:SELECTED_VIEW_CONTROLLER_TAG];
        [currentView removeFromSuperview];
        
        Lives *lives = [[Lives alloc]initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)-44-64)];
        lives.tag = SELECTED_VIEW_CONTROLLER_TAG;
//        [self.view addSubview:lives];
        [self.view insertSubview:lives belowSubview:_tabBar];
        self.title = @"Live";
        
        NSLog(@"liveView show");
    }
}


- (void)getMatchesInfo
{
    scheduledURL = [NSString stringWithFormat:@"http://api.steampowered.com/IDOTA2Match_570/GetScheduledLeagueGames/v1/?key=%@",KEY];
    //
    //    ASIFormDataRequest *request = [[ASIFormDataRequest alloc]initWithURL:[NSURL URLWithString:getScheldedURL]];
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:scheduledURL]];
//    request.delegate = self;
//    [request setTimeOutSeconds:20];
//    //    [request setPostValue:KEY forKey:@"key"];
//    [request startAsynchronous];

    [[ApiDataManager instance]getMatchesListWithHolder:nil Success:^(NSArray *dic) {
        gameArray = [NSMutableArray arrayWithArray:dic];
    }];
}

/*- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
    NSLog(@"错误%@",[error userInfo]);
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"%@",[request responseString]);
    if ([request responseString]) {
        NSData *gameData = [NSData dataWithContentsOfURL:[NSURL URLWithString:scheduledURL]];
        matchesDic = [gameData objectFromJSONData];
//        [MatchesData infoWithDictionary:matchesDic];
        //got the matches,write them into MatchesData;
        gameArray = [[NSMutableArray alloc]init];
        NSArray *array = [[matchesDic objectForKey:@"result"]objectForKey:@"games"];
        [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [gameArray addObject:[MatchesData infoWithDictionary:obj]];
        }];
        NSLog(@"%@",gameArray[0]);
    }
    
    NSLog(@"succes");
    
}*/


@end

//
//  SetViewController.m
//  DOTAid
//
//  Created by medicool on 14-9-18.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "SetViewController.h"
#import "MatchesData.h"
#import "matchesCell.h"
#import "matchesCell.h"

@interface SetViewController ()
{
    
}

@property (nonatomic,retain) UITableView                *matchesTabView;

@end



@implementation SetViewController

@synthesize testArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createTableView];
    [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)createTableView
{
    _matchesTabView = [[UITableView alloc]initWithFrame:self.view.bounds];
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
    
    
    [self.view addSubview:_matchesTabView];
    
}

- (void)initData
{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"CellList" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    testArray = [[NSMutableArray alloc]init];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [testArray addObject:[MatchesData infoWithDictionary:obj]];
    }];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return testArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
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
    MatchesData *data = testArray[indexPath.row];
    cell.matchData = data;
    return cell;
}


@end

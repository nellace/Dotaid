//
//  RootViewController.m
//  DOTAid
//
//  Created by medicool on 14-9-16.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "RootViewController.h"
#import "SetViewController.h"
#import "AppDelegate.h"
#import "REBackgroundView.h"


#import "MainViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

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
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Menu" style:UIBarButtonItemStyleBordered target:self action:@selector(showMenu)];
    UIButton *detailBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    detailBtn.frame =CGRectMake(0, 0, 19, 14);
    detailBtn.tintColor = [UIColor whiteColor];
    [detailBtn addTarget:self action:@selector(showMenu) forControlEvents:UIControlEventTouchUpInside];
    [detailBtn setImage:[UIImage imageNamed:@"backLeft"] forState:UIControlStateNormal];
    
    UIBarButtonItem *leftBtn =[[UIBarButtonItem alloc]initWithCustomView:detailBtn];
    self.navigationItem.leftBarButtonItem = leftBtn;
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

-(void)showMenu
{
    if (!_sideMenu) {
        RESideMenuItem *homeItem = [[RESideMenuItem alloc]initWithTitle:@"Home" action:^(RESideMenu *menu, RESideMenuItem *item) {
            [menu hide];
            
            MainViewController *mainV = [[MainViewController alloc]init];
            mainV.title = item.title;
            UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:mainV];
            
            [menu setRootViewController:navigationController];
        }];
        RESideMenuItem *setItem = [[RESideMenuItem alloc]initWithTitle:@"Set" action:^(RESideMenu *menu, RESideMenuItem *item) {
            [menu hide];
            
            SetViewController *setView = [[SetViewController alloc]init];
            setView.title = item.title;
            UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:setView];
            [menu setRootViewController:navi];
        }];
        _sideMenu = [[RESideMenu alloc] initWithItems:@[homeItem,setItem]];
        _sideMenu.verticalOffset = IS_WIDESCREEN ? 110 : 76;
        _sideMenu.hideStatusBarArea = [AppDelegate OSVersion] < 7;
    }
    [_sideMenu show];
}

@end

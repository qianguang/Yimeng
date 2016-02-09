//
//  GameCenterViewController.m
//  Yimeng
//
//  Created by LQG on 16/2/9.
//  Copyright © 2016年 LQG. All rights reserved.
//

#import "GameCenterViewController.h"
#import "AllGamesViewController.h"
#import "MyGamesViewController.h"

@interface GameCenterViewController ()

@property (strong, nonatomic) NSArray *viewControllersArray;

@end

@implementation GameCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"游戏中心";
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

@end

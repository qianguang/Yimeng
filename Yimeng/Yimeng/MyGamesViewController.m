//
//  MyGamesViewController.m
//  Yimeng
//
//  Created by LQG on 16/2/10.
//  Copyright © 2016年 LQG. All rights reserved.
//

#import "MyGamesViewController.h"
#import "QGScrollView.h"

@interface MyGamesViewController ()

@end

@implementation MyGamesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    QGScrollView *mScorllView = [[QGScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.618)];
    [self.view addSubview:mScorllView];
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

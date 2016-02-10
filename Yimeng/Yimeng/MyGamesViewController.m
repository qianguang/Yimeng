//
//  MyGamesViewController.m
//  Yimeng
//
//  Created by LQG on 16/2/10.
//  Copyright © 2016年 LQG. All rights reserved.
//

#import "MyGamesViewController.h"
#import "QGScrollView.h"

@interface MyGamesViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation MyGamesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    self.mTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-40-64);
    [self.mTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell1"];
}

- (void)requestDataListPullDown:(BOOL)pullDown
{
    [self stopRefreshing];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.mTableView dequeueReusableCellWithIdentifier:@"cell1"];
    cell.textLabel.text = [NSString stringWithFormat:@"我的游戏第%ld行数据", (long)indexPath.row];
    return cell;
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

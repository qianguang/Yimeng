//
//  AllGamesViewController.m
//  Yimeng
//
//  Created by LQG on 16/2/9.
//  Copyright © 2016年 LQG. All rights reserved.
//

#import "AllGamesViewController.h"
#import "GamesCell.h"

@interface AllGamesViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation AllGamesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setup];
}

- (void)setup {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    self.mTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-40-64);
    [self.mTableView registerNib:[UINib nibWithNibName:@"GamesCell" bundle:nil] forCellReuseIdentifier:@"GamesCell"];
}

- (void)requestDataListPullDown:(BOOL)pullDown
{
    [self stopRefreshing];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GamesCell *cell = [self.mTableView dequeueReusableCellWithIdentifier:@"GamesCell" forIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  95.;
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

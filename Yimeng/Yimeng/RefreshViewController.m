//
//  RefreshViewController.m
//  QJYX
//
//  Created by Qianchuang on 14-8-22.
//  Copyright (c) 2014年 Qianchuang. All rights reserved.
//

#import "RefreshViewController.h"
#import "MJRefresh.h"

@interface RefreshViewController ()

@end

@implementation RefreshViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.view.backgroundColor = QGCOLOR(218, 218, 218, 1);
    _pageIndex = 0;
    _pageSize = 10;
    
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }

    _mTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
//    _mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _mTableView.backgroundColor = QGCOLOR(238, 239, 240, 1);
//    _mTableView.contentInset = UIEdgeInsetsMake(5, 0, 0, 0);
    [self.view addSubview:_mTableView];
    [self setRefreshControl];
    
}
-(void)startHeardRefresh
{
    [self.mTableView headerBeginRefreshing];
}
- (void)setRefreshControl
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0)];
    _mTableView.tableFooterView = view;
    if (_isRequireRefreshHeader) {
        __block RefreshViewController *vc = self;
        [self.mTableView addHeaderWithCallback:^{
            vc.pageIndex = 0;
//            [vc.dataArray removeAllObjects];
//            [vc.mTableView reloadData];
            [vc requestDataListPullDown:YES];
        }];
        [self startHeardRefresh];
    }
    if (_isRequireRefreshFooter) {
        __block RefreshViewController *vc = self;
        [self.mTableView addFooterWithCallback:^{
            if (vc.pageIndex == vc.totalPage-1) {
                [Utility popWithString:Localized(@"已经是最后一页了！") onView:vc.view];
                [vc.mTableView footerEndRefreshing];
                return;
            }
            vc.pageIndex++;
            [vc requestDataListPullDown:NO];
        }];
    }
}

- (void)requestDataListPullDown:(BOOL)pullDown
{
    
}

- (void)stopRefreshing
{
    if (_isRequireRefreshHeader) {
        [self.mTableView headerEndRefreshing];
    }
    if (_isRequireRefreshFooter) {
        [self.mTableView footerEndRefreshing];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

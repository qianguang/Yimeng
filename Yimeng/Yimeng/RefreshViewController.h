//
//  RefreshViewController.h
//  QJYX
//
//  Created by Qianchuang on 14-8-22.
//  Copyright (c) 2014年 Qianchuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RefreshViewController : UIViewController


@property (strong, nonatomic) UITableView *mTableView;

@property (strong, nonatomic) NSMutableArray *dataArray;
@property (assign, nonatomic) NSInteger pageIndex;
@property (assign, nonatomic) NSInteger pageSize;
@property (assign, nonatomic) NSInteger totalPage;

@property (assign, nonatomic) BOOL isRequireRefreshFooter;//是否需要上拉加载
@property (assign, nonatomic) BOOL isRequireRefreshHeader;//是否需要下拉刷新

- (void)requestDataListPullDown:(BOOL)pullDown;

- (void)stopRefreshing;

@end

//
//  FirstPageViewController.m
//  Yimeng
//
//  Created by LQG on 16/2/9.
//  Copyright © 2016年 LQG. All rights reserved.
//

#import "FirstPageViewController.h"

@interface FirstPageViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *mScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *mPageControl;

@property (weak, nonatomic) IBOutlet UIButton *gameCenterBtn;
@property (weak, nonatomic) IBOutlet UIButton *qiangHongbaoBtn;
@property (weak, nonatomic) IBOutlet UIButton *fenhongBtn;
@property (weak, nonatomic) IBOutlet UIButton *chengweiTuiguangyuanBtn;
@property (weak, nonatomic) IBOutlet UIButton *chongzhiFanliBtn;
@property (weak, nonatomic) IBOutlet UIButton *yaoqingPengyouBtn;
@property (weak, nonatomic) IBOutlet UIButton *lingquLibaoBtn;
@property (weak, nonatomic) IBOutlet UIButton *myGamesBtn;
@property (weak, nonatomic) IBOutlet UIButton *personalCenterBtn;


@end

@implementation FirstPageViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"首页";
    self.view.backgroundColor = [UIColor blackColor];
    [self createScrollView];
    [self cutView];
}

- (void)createScrollView
{
    NSArray *imageArray = [NSArray arrayWithObjects:@"1", @"2", nil];
    for (int i = 0; i < imageArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.618)];
        imageView.image = [UIImage imageNamed:imageArray[i]];
        [_mScrollView addSubview:imageView];
    }
    _mScrollView.contentSize = CGSizeMake(imageArray.count * SCREEN_WIDTH, _mScrollView.frame.size.height);
}

- (void)cutView
{
    [Utility setRoundRectWithView:_gameCenterBtn andCorner:5];
    [Utility setRoundRectWithView:_qiangHongbaoBtn andCorner:5];
    [Utility setRoundRectWithView:_fenhongBtn andCorner:5];
    [Utility setRoundRectWithView:_chengweiTuiguangyuanBtn andCorner:5];
    [Utility setRoundRectWithView:_chongzhiFanliBtn andCorner:5];
    [Utility setRoundRectWithView:_yaoqingPengyouBtn andCorner:5];
    [Utility setRoundRectWithView:_lingquLibaoBtn andCorner:5];
    [Utility setRoundRectWithView:_myGamesBtn andCorner:5];
    [Utility setRoundRectWithView:_personalCenterBtn andCorner:5];
}

- (IBAction)firstPageBtnAction:(UIButton *)sender
{
    NSInteger tag = sender.tag;
    switch (tag) {
        case FirstPageGameCenter:
        {
            NSLog(@"游戏中心");
        }
            break;
        case FirstPageQiangHongbao:
        {
            NSLog(@"抢红包");
        }
            break;
        case FirstPageFenHong:
        {
            NSLog(@"分红");
        }
            break;
        case FirstPageChengweiTuiguangyuan:
        {
            NSLog(@"成为推广员");
        }
            break;
        case FirstPageChongzhiFanli:
        {
            NSLog(@"充值返利");
        }
            break;
        case FirstPageYaoqingPengyou:
        {
            NSLog(@"邀请朋友");
        }
            break;
        case FirstPageLingquLibao:
        {
            NSLog(@"领取礼包");
        }
            break;
        case FirstPageMyGames:
        {
            NSLog(@"我的游戏");
        }
            break;
        case FirstPagePersonalCenter:
        {
            NSLog(@"个人中心");
        }
            break;
            
        default:
            break;
    }
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark --UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _mPageControl.currentPage = scrollView.contentOffset.x/SCREEN_WIDTH;
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

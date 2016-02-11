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

@interface GameCenterViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

{
    AllGamesViewController *allGamesVC;
    MyGamesViewController *myGamesVC;
}

@property (strong, nonatomic) NSArray *viewControllersArray;
@property (weak, nonatomic) IBOutlet UIButton *allGamesBtn;
@property (weak, nonatomic) IBOutlet UIButton *myGamesBtn;
@property (strong, nonatomic) UIPageViewController *pageVC;

@property (strong, nonatomic) UIView *indicator;

@end

@implementation GameCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"游戏中心";
    [self createTab];
    
    allGamesVC = [[AllGamesViewController alloc] init];
    allGamesVC.isRequireRefreshHeader = YES;
    allGamesVC.isRequireRefreshFooter = YES;
    
    myGamesVC = [[MyGamesViewController alloc] init];
    myGamesVC.isRequireRefreshHeader = YES;
    _viewControllersArray = [NSArray arrayWithObjects:allGamesVC, myGamesVC, nil];
    
    _pageVC = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    if (_gamesType == FirstPageGameCenter) {
        [_pageVC setViewControllers:@[allGamesVC] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:^(BOOL finished) {
            
        }];
    }else if (_gamesType == FirstPageMyGames) {
        [_pageVC setViewControllers:@[myGamesVC] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
            
        }];
    }
    
    _pageVC.delegate = self;
    _pageVC.dataSource = self;
    
    [self addChildViewController:_pageVC];
    _pageVC.view.frame = CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height-40);
    [self.view addSubview:_pageVC.view];
}

- (void)createTab
{
    _indicator = [[UIView alloc] init];
    _indicator.backgroundColor = [UIColor darkGrayColor];
    _indicator.bounds = CGRectMake(0, 0, 72, 1);
    
    [self.view addSubview:_indicator];
    [self performSelector:@selector(delaySelector) withObject:nil afterDelay:0.01];
}

- (void)delaySelector
{
    if (_gamesType == FirstPageGameCenter) {
        _indicator.center = CGPointMake(_allGamesBtn.center.x, 39);
    }else if (_gamesType == FirstPageMyGames) {
        _indicator.center = CGPointMake(_myGamesBtn.center.x, 39);
    }
}

- (IBAction)allGamesBtnAction:(UIButton *)sender
{
    [UIView animateWithDuration:0.25 animations:^{
        _indicator.center = CGPointMake(_allGamesBtn.center.x, 39);
    } completion:^(BOOL finished) {
        
    }];
    [_pageVC setViewControllers:@[[_viewControllersArray objectAtIndex:0]] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:^(BOOL finished) {
        
    }];
}

- (IBAction)myGamesBtnAction:(UIButton *)sender
{
    [UIView animateWithDuration:0.25 animations:^{
        _indicator.center = CGPointMake(_myGamesBtn.center.x, 39);
    } completion:^(BOOL finished) {
        
    }];
    [_pageVC setViewControllers:@[[_viewControllersArray objectAtIndex:1]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
        
    }];
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger index = [_viewControllersArray indexOfObject:viewController];
    if (index == 0 || index == NSNotFound) {
        return nil;
    }
    return _viewControllersArray[index-1];
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger index = [_viewControllersArray indexOfObject:viewController];
    if (index == _viewControllersArray.count-1 || index == NSNotFound) {
        return nil;
    }
    return _viewControllersArray[index+1];
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed
{
    UIViewController *vc = [pageViewController.viewControllers firstObject];
    if (vc == allGamesVC) {
        [UIView animateWithDuration:0.25 animations:^{
            _indicator.center = CGPointMake(_allGamesBtn.center.x, 39);
        } completion:^(BOOL finished) {
            
        }];
    }else if (vc == myGamesVC) {
        [UIView animateWithDuration:0.25 animations:^{
            _indicator.center = CGPointMake(_myGamesBtn.center.x, 39);
        } completion:^(BOOL finished) {
            
        }];
    }
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

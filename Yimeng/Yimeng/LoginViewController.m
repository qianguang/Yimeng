//
//  LoginViewViewController.m
//  Yimeng
//
//  Created by LQG on 16/2/7.
//  Copyright © 2016年 LQG. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *mScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *mPageControl;

@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UITextField *userpwdTF;
@property (weak, nonatomic) IBOutlet UIImageView *usernameLine;
@property (weak, nonatomic) IBOutlet UIImageView *userpwdLine;

@property (weak, nonatomic) IBOutlet UIButton *rememberBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"易梦";
    [self createNavigation];
    [self createScrollView];
    [self createView];
}

- (void)createNavigation
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 35, 35);
    [btn setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(rightItemAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = rightItem;
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

- (void)createView
{
    UIImageView *username = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    username.image = [UIImage imageNamed:@"username"];
    _usernameTF.leftView = username;
    _usernameTF.leftViewMode = UITextFieldViewModeAlways;
    
    UIImageView *userpwd = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 26, 26)];
    userpwd.image = [UIImage imageNamed:@"userpwd"];
    _userpwdTF.leftView = userpwd;
    _userpwdTF.leftViewMode = UITextFieldViewModeAlways;
    
    UIImage *lineImage = [[UIImage imageNamed:@"TFBottomLine"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 1, 1, 1) resizingMode:UIImageResizingModeStretch];
    _usernameLine.image = lineImage;
    _userpwdLine.image = lineImage;
    
    [Utility setRoundRectWithView:_loginBtn andCorner:3];
}

- (void)rightItemAction:(UIBarButtonItem *)item
{
    NSLog(@"");
}

- (IBAction)rememberBtnAction:(UIButton *)sender
{
    sender.selected = !sender.selected;
}

- (IBAction)forgetPwdAction:(UIButton *)sender
{
    [Utility popWithString:@"忘记密码" onView:self.view];
}

- (IBAction)loginBtnAction:(UIButton *)sender
{
    [Utility popWithString:@"login" onView:self.view];
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

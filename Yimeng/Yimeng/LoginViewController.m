//
//  LoginViewViewController.m
//  Yimeng
//
//  Created by LQG on 16/2/7.
//  Copyright © 2016年 LQG. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UITextField *userpwdTF;
@property (weak, nonatomic) IBOutlet UIImageView *usernameLine;
@property (weak, nonatomic) IBOutlet UIImageView *userpwdLine;

@property (weak, nonatomic) IBOutlet UIButton *rememberBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (strong, nonatomic) UITextField *currentTextField;

@end

@implementation LoginViewController

- (void)dealloc
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"易梦";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
    
    [self createNavigation];
    [self createView];
}

- (void)keyBoardWillShow:(NSNotification *)notify
{
    NSDictionary *dict = notify.userInfo;
    CGRect endRect = [[dict objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    if (endRect.size.height > self.view.frame.size.height-CGRectGetMaxY(_currentTextField.frame)) {
        self.view.frame = CGRectMake(0, -(endRect.size.height-(SCREEN_HEIGHT-CGRectGetMaxY(_currentTextField.frame))), SCREEN_WIDTH, self.view.frame.size.height);
    }
}

- (void)keyBoardWillHidden:(NSNotification *)notify
{
     NSLog(@"%@", notify);
    self.view.frame = CGRectMake(0, 64, SCREEN_WIDTH, self.view.frame.size.height);
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
    NSLog(@"了解易梦");
}

- (IBAction)rememberBtnAction:(UIButton *)sender
{
    sender.selected = !sender.selected;
}

- (IBAction)forgetPwdAction:(UIButton *)sender
{
    //TODO:忘记密码
    [Utility popWithString:@"忘记密码" onView:self.view];
}

- (IBAction)loginBtnAction:(UIButton *)sender
{
    //TODO:登录
    [appDelegate loginSuccess];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_currentTextField resignFirstResponder];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    _currentTextField = textField;
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
//    [_currentTextField resignFirstResponder];
    if (textField == _usernameTF) {
        [_userpwdTF becomeFirstResponder];
    }else if (textField == _userpwdTF){
        [_userpwdTF resignFirstResponder];
    }
    return YES;
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

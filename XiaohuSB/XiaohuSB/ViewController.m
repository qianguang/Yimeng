//
//  ViewController.m
//  XiaohuSB
//
//  Created by Qianchuang on 16/4/7.
//  Copyright © 2016年 Qianchuang. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "QGObject.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UIWebViewDelegate>

@property (strong, nonatomic) UIWebView *mWebView;
@property (weak, nonatomic) IBOutlet UITableView *mTableView;

@property (assign, nonatomic) CGFloat webHeight;

@property (strong, nonatomic) UILabel *mLabel;

@property (strong, nonatomic) QGObject *ob;

@end

@implementation ViewController
- (void)dealloc
{
    [_mWebView.scrollView removeObserver:self forKeyPath:@"contentSize"];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _webHeight = 100;
    
    _mWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0)];
    _mWebView.delegate = self;
    _mWebView.scrollView.alwaysBounceVertical = NO;
    _mWebView.scrollView.alwaysBounceHorizontal = NO;
    _mWebView.scrollView.scrollEnabled = NO;
    
    _ob = [[QGObject alloc] init];
    _ob.number = 0;
    
    [_mWebView.scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    [_ob addObserver:self forKeyPath:@"number" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    _ob.number = 10;
    
    [NSNotificationCenter defaultCenter] ;
    
    [_mWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.pgyer.com/QJ_iOS"]]];
//    _mTableView.tableHeaderView = _mWebView;

}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"%@, %@", keyPath, change);
    if ([keyPath isEqualToString:@"contentSize"]) {
        CGSize size = [[change objectForKey:@"new"] CGSizeValue];
        _mWebView.frame = CGRectMake(0, 0, self.view.frame.size.width, size.height);
        _mTableView.tableHeaderView = _mWebView;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    cell.titleLabel.text = [NSString stringWithFormat:@"评论：%ld", (long)indexPath.row];
    return cell;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
//    CGFloat height = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight"] floatValue];
//    NSLog(@"%f %@", height, _mWebView.scrollView);
    _mWebView.frame = CGRectMake(0, 0, self.view.frame.size.width, 1);
//    _mTableView.tableHeaderView = _mWebView;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

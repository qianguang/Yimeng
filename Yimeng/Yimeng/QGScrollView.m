//
//  QGScrollView.m
//  Yimeng
//
//  Created by LQG on 16/2/10.
//  Copyright © 2016年 LQG. All rights reserved.
//

#import "QGScrollView.h"

@interface QGScrollView () <UIScrollViewDelegate>

@property (strong, nonatomic) UIPageControl *mPageControl;

@end

@implementation QGScrollView

- (void)awakeFromNib
{
    [self performSelector:@selector(createScrollView) withObject:nil afterDelay:0.001];
//    [self createScrollView];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createScrollView];
    }
    return self;
}

- (void)createScrollView
{
    self.delegate = self;
    self.bounces = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.pagingEnabled = YES;
    
    NSArray *imageArray = [NSArray arrayWithObjects:@"1", @"2", nil];
    for (int i = 0; i < imageArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.618)];
        imageView.image = [UIImage imageNamed:imageArray[i]];
        [self addSubview:imageView];
    }
    self.contentSize = CGSizeMake(imageArray.count * SCREEN_WIDTH, self.frame.size.height);
    
    _mPageControl = [[UIPageControl alloc] init];
    _mPageControl.bounds = CGRectMake(0, 0, self.bounds.size.width, 30);
    _mPageControl.center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height-15);
    _mPageControl.numberOfPages = imageArray.count;
    _mPageControl.currentPage = 0;
    _mPageControl.pageIndicatorTintColor = [UIColor darkGrayColor];
    _mPageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    [self addSubview:_mPageControl];
}

#pragma mark --UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _mPageControl.currentPage = scrollView.contentOffset.x/SCREEN_WIDTH;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _mPageControl.center = CGPointMake(scrollView.contentOffset.x+self.bounds.size.width/2.0, self.bounds.size.height-15);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

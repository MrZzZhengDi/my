//
//  ViewController.m
//  my
//
//  Created by MrZz on 16/7/7.
//  Copyright © 2016年 MrZz. All rights reserved.
//

#import "ViewController.h"
#import "MyButtonViewController.h"
#import "LikeButtonViewController.h"

#define w [UIScreen mainScreen].bounds.size.width
#define h [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *bigScroll;

@property (nonatomic,strong) UIView *navView;

@property (nonatomic,assign) NSInteger buttonTag;

@property (nonatomic,strong) UIButton *selcedButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, w, 64)];
    [self.view addSubview:_navView];
    _navView.backgroundColor = [UIColor grayColor];
    
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeCustom];
    myButton.frame = CGRectMake(w/2 - 60, 20, 60, 44);
    myButton.tag = 1000;
    [myButton setTitle:@"我的" forState:UIControlStateNormal];
    [myButton addTarget:self action:@selector(scollView:) forControlEvents:UIControlEventTouchUpInside];
    [myButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [myButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_navView addSubview:myButton];
    
    UIButton *likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    likeButton.frame = CGRectMake(w/2, 20, 60, 44);
    likeButton.tag = 1001;
    [likeButton setTitle:@"关注" forState:UIControlStateNormal];
    [likeButton addTarget:self action:@selector(scollView:) forControlEvents:UIControlEventTouchUpInside];
    [likeButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [likeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_navView addSubview:likeButton];
    
    self.bigScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, w, h-64)];
    self.bigScroll.alwaysBounceHorizontal = YES;
    self.bigScroll.showsHorizontalScrollIndicator = NO;
    self.bigScroll.showsVerticalScrollIndicator = NO;
    self.bigScroll.delegate = self;
    [self.view addSubview:self.bigScroll];
    
    //3.添加子控制器
    NSArray *vcArray = @[@"MyButtonViewController", @"LikeButtonViewController"];
    for (NSString *vcStr in vcArray) {
        UIViewController *vc = [[NSClassFromString(vcStr) alloc] init];
        [self addChildViewController:vc];
    }
    //4.设置大的scrollView的滚动范围
    CGFloat contentX = self.childViewControllers.count * w;
    self.bigScroll.scrollEnabled = NO;
    self.bigScroll.contentSize = CGSizeMake(contentX, 0);
    self.bigScroll.pagingEnabled = YES;
    
    myButton.selected = YES;
    self.selcedButton = myButton;
    
    //5.添加默认子控制器 （第一个）
    UIViewController *vc1 = [self.childViewControllers objectAtIndex:0];
    UIViewController *vc2 = [self.childViewControllers objectAtIndex:1];
    vc1.view.frame = CGRectMake(0, 0, w, (h-64));
    vc2.view.frame = CGRectMake(w, 0, w, (h-64));
    [self.bigScroll addSubview:vc1.view];
    [self.bigScroll addSubview:vc2.view];
    
    [self.view bringSubviewToFront:_navView];
    
}

- (void)scollView:(UIButton *)button
{
    if (button.tag == 1001 && button.selected == NO) {
        button.selected = YES;
        UIButton *selBtn = [self.navView viewWithTag:self.selcedButton.tag];
        selBtn.selected = NO;
        self.selcedButton = button;
        CGPoint point = CGPointMake((button.tag - 1000)*w, self.bigScroll.contentOffset.y);
        [self.bigScroll setContentOffset:point animated:YES];
    } else if (button.tag == 1000 && button.selected == NO) {
        button.selected = YES;
        UIButton *selBtn = [self.navView viewWithTag:self.selcedButton.tag];
        selBtn.selected = NO;
        self.selcedButton = button;
        CGPoint point = CGPointMake((button.tag - 1000)*w, self.bigScroll.contentOffset.y);
        [self.bigScroll setContentOffset:point animated:YES];
    }
}

/**
 *  结束滚动后调用 (代码导致)
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
}
@end

//
//  LikeButtonViewController.m
//  my
//
//  Created by MrZz on 16/7/8.
//  Copyright © 2016年 MrZz. All rights reserved.
//

#import "LikeButtonViewController.h"

@interface LikeButtonViewController ()

@end

@implementation LikeButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"LikeButtonViewController --> viewWillAppear 即将出现");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"LikeButtonViewController --> viewWillDisappear 即将消失");
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

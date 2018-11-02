//
//  LNBaseViewController.m
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/7/6.
//  Copyright © 2018年 ZLN. All rights reserved.
//

#import "LNBaseViewController.h"

@interface LNBaseViewController ()

@end

@implementation LNBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addViews];
    
    [self addViewConstraints];
}

- (void)addViews {
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.view.backgroundColor = [UIColor whiteColor];
    if (@available(iOS 11, *)) {
        self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeNever;
    }
}

- (void)addViewConstraints {
    
}

@end

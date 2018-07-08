//
//  LNMainViewController.m
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/7/6.
//  Copyright © 2018年 ZLN. All rights reserved.
//

#import "LNMainViewController.h"
#import "LNMainNavigationBar.h"

@interface LNMainViewController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) LNMainNavigationBar *navigationBar;

@end

@implementation LNMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addViews];
}

- (void)addViews {
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.navigationBar];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGFloat naviY = [UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat naviH = naviY + 44.f;
    self.navigationBar.frame = CGRectMake(0, naviY, self.view.width, naviH);
    
    self.tableView.frame = self.view.bounds;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.f;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseId = @"UITableViewCellReuseId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    return cell;
}

#pragma mark - getter

- (LNMainNavigationBar *)navigationBar {
    if (!_navigationBar) {
        _navigationBar = [LNMainNavigationBar new];
    }
    return _navigationBar;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end

//
//  LNMainViewController.m
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/7/6.
//  Copyright © 2018年 ZLN. All rights reserved.
//

#import "LNMainViewController.h"
#import "LNMainViewModel.h"
#import "LNMainTableViewCell.h"
#import "LNMaintableSectionHeaderView.h"
#import "UIImageView+WebCache.h"
#import "LNDetailViewModel.h"
#import "LNStoryDetailViewController.h"

@interface LNMainViewController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) LNMainViewModel *viewModel;
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) MJRefreshNormalHeader *refreshHeader;
@property(nonatomic, strong) MJRefreshAutoNormalFooter *refreshFooter;

@end

@implementation LNMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self bindSignal];
    
    [self getData];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)addViews {
    [super addViews];
    self.title = @"日报";
    [self.view addSubview:self.tableView];
}

- (void)addViewConstraints {
    [super addViewConstraints];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

- (void)bindSignal {
    @weakify(self);
    [self.viewModel.updatedContentSignal subscribeNext:^(RACTuple *dataTuple) {
        @strongify(self);
        [self.refreshHeader endRefreshing];
        if ([self.refreshFooter isRefreshing]) {
            [self.refreshFooter endRefreshing];
        }
        [self.tableView reloadData];
    }];
    
    [self.viewModel.errorSignal subscribeNext:^(id x) {
        
    }];
}

- (void)getData {
    [self.viewModel getData];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [LNMainTableViewCell cellHeight];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 46.f;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.viewModel numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfRowsInSection:section];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    static NSString *reuseId = @"LNMaintableSectionHeaderViewReuseId";
    LNMaintableSectionHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:reuseId];
    if (!headerView) {
        headerView = [[LNMaintableSectionHeaderView alloc] initWithReuseIdentifier:reuseId];
    }
    return headerView;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    LNMaintableSectionHeaderView *headerView = (LNMaintableSectionHeaderView *)view;
    headerView.label.text = [self.viewModel titleAtSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseId = @"LNMainTableViewCellReuseId";
    LNMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (!cell) {
        cell = [[LNMainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [((LNMainTableViewCell *)cell).iconImageView sd_setImageWithURL:[NSURL URLWithString:[self.viewModel imageUrlAtIndexpath:indexPath]]];
    ((LNMainTableViewCell *)cell).titleLabel.attributedText = [self.viewModel titleAtIndexpath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LNStoryDetailViewController *vc = [LNStoryDetailViewController new];
    vc.viewModel = [self.viewModel fetchDetailViewModelAtIndexPath:indexPath];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - getter

- (LNMainViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [LNMainViewModel new];
    }
    return _viewModel;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.mj_header = self.refreshHeader;
        _tableView.mj_footer = self.refreshFooter;
    }
    return _tableView;
}

- (MJRefreshNormalHeader *)refreshHeader {
    if (!_refreshHeader) {
        @weakify(self);
        _refreshHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            @strongify(self);
            [self.viewModel getData];
        }];
    }
    return _refreshHeader;
}

- (MJRefreshAutoNormalFooter *)refreshFooter {
    if (!_refreshFooter) {
        @weakify(self);
        _refreshFooter = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            @strongify(self);
            [self.viewModel footerRefresh];
        }];
    }
    return _refreshFooter;
}

@end

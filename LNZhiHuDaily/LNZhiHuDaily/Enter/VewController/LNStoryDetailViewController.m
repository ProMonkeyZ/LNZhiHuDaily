//
//  LNStoryDetailViewController.m
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/10/19.
//  Copyright © 2018 ZLN. All rights reserved.
//

#import "LNStoryDetailViewController.h"
#import "LNDetailViewModel.h"

#import <WebKit/WebKit.h>

@interface LNStoryDetailViewController ()

@property(nonatomic, strong) WKWebView *webView;

@end

@implementation LNStoryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self bindSignal];
    
    [self getData];
}

- (void)addViews {
    [super addViews];
    [self.view addSubview:self.webView];
}

- (void)addViewsConstraint {
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

- (void)bindSignal {
    @weakify(self);
    [self.viewModel.updatedContentSignal subscribeNext:^(id x) {
        @strongify(self);
        [self.webView loadHTMLString:[self.viewModel getHtmlBody] baseURL:[NSURL URLWithString:@""]];
    }];
    
    [self.viewModel.errorSignal subscribeNext:^(id x) {
        
    }];
}

- (void)getData {
    [self.viewModel getData];
}

@end

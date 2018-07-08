//
//  LNMainNavigationBar.m
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/7/6.
//  Copyright © 2018年 ZLN. All rights reserved.
//

#import "LNMainNavigationBar.h"
#import "UIHeader.h"

@interface LNMainNavigationBar ()

@property(nonatomic, strong) UILabel *titleLabel;

@end

@implementation LNMainNavigationBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addViews];
    }
    return self;
}

- (void)addViews {
    self.backgroundColor = [UIColor mainColor];
    [self addSubview:self.leftButton];
    [self addSubview:self.titleLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.leftButton.frame = CGRectMake(0, 0, CGRectGetHeight(self.bounds), CGRectGetHeight(self.bounds));
}

#pragma mark - getter

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont boldSystemFontOfSize:16.f];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.backgroundColor = [UIColor redColor];
    }
    return _leftButton;
}

@end

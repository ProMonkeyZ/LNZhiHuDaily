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
@property(nonatomic, strong) UIView *contentView;

@end

@implementation LNMainNavigationBar

+ (CGFloat)getScaleWithStart:(CGFloat)startValue
                      andEnd:(CGFloat)endValue
                    andRatio:(CGFloat)ratio {
    if (startValue == endValue) {
        return startValue;
    }
    return (startValue - (startValue - endValue) * ratio);
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addViews];
    }
    return self;
}

- (void)addViews {
    self.backgroundColor = [UIColor mainColor];
    [self addSubview:self.contentView];
    [self.contentView addSubview:self.leftButton];
    [self.contentView addSubview:self.titleLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat statusH = [UIApplication sharedApplication].statusBarFrame.size.height;
    self.contentView.frame = CGRectMake(0, statusH, self.width, self.height - statusH);
    
    self.leftButton.frame = CGRectMake(0, 0, self.contentView.height, self.contentView.height);
    
    self.titleLabel.frame = CGRectMake(self.contentView.height, 0, self.contentView.width - self.contentView.height * 2, self.contentView.height);
}

#pragma mark - setter

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

- (void)setLn_backgroundColor:(UIColor *)ln_backgroundColor {
    _ln_backgroundColor = ln_backgroundColor;
    
    self.backgroundColor = ln_backgroundColor;
}

#pragma mark - getter

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [UIView new];
    }
    return _contentView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont boldSystemFontOfSize:16.f];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.backgroundColor = [UIColor yellowColor];
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

//
//  LNMainTableViewCell.m
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/10/9.
//  Copyright © 2018 ZLN. All rights reserved.
//

#import "LNMainTableViewCell.h"
#import "ConstVariableHeader.h"

#import <Masonry/Masonry.h>

@implementation LNMainTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        [self addViews];
        [self addViewsConstraint];
    }
    return self;
}

- (void)addViews {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.titleLabel];
}

- (void)addViewsConstraint {
    self.separatorInset = UIEdgeInsetsMake(0, kDefaultLeftRightMargin, 0, 0);
    
    CGFloat imageW = 90.f;
    CGFloat imageH = 90.f / 90.f * imageW;
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(kDefaultLeftRightMargin);
        make.width.mas_equalTo(imageW);
        make.height.mas_equalTo(imageH);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconImageView);
        make.left.mas_equalTo(self.iconImageView.mas_right).offset(10);
    }];
}

+ (CGFloat)cellHeight {
    CGFloat imageW = 90.f;
    return imageW + 20;
}

#pragma mark - getter

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [UIImageView new];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _iconImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        CGFloat imageW = (SCREEN_WIDTH - kDefaultLeftRightMargin * 2 - 5 * 2) / 3;
        _titleLabel.numberOfLines = 3;
        _titleLabel.preferredMaxLayoutWidth = SCREEN_WIDTH - imageW - kDefaultLeftRightMargin * 2 - 10;
    }
    return _titleLabel;
}

@end

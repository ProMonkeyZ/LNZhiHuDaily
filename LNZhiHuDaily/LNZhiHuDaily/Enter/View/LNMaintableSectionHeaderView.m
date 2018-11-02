//
//  LNMaintableSectionHeaderView.m
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/10/17.
//  Copyright © 2018 ZLN. All rights reserved.
//

#import "LNMaintableSectionHeaderView.h"
#import "UIColor+LNExtension.h"

#import <Masonry/Masonry.h>

@implementation LNMaintableSectionHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self addViews];
        [self addViewsConstraint];
    }
    return self;
}

- (void)addViews {
    [self.contentView addSubview:self.label];
}

- (void)addViewsConstraint {
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

#pragma mark - getter

- (UILabel *)label {
    if (!_label) {
        _label = [UILabel new];
        _label.backgroundColor = [UIColor mainColor];
        _label.textColor = [UIColor whiteColor];
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}

@end

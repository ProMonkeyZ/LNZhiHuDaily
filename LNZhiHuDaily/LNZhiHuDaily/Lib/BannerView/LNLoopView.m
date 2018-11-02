//
//  LNLoopView.m
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/10/10.
//  Copyright © 2018 ZLN. All rights reserved.
//

#import "LNLoopView.h"

#import "UIHeader.h"
#import "ConstVariableHeader.h"

@interface LNLoopView ()

@property(nonatomic, strong) UICollectionView *collectionView;
@property(nonatomic, strong) UICollectionViewFlowLayout *layout;

@end

@implementation LNLoopView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addViews];
        [self addViewsConstraint];
    }
    return self;
}

- (void)addViews {
    [self addSubview:self.collectionView];
}

- (void)addViewsConstraint {
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}

#pragma mark - getter

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)layout {
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.itemSize = CGSizeMake(SCREEN_WIDTH - kDefaultLeftRightMargin * 2, 210);
    }
    return _layout;
}

@end

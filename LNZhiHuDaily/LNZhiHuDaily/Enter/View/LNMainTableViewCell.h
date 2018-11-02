//
//  LNMainTableViewCell.h
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/10/9.
//  Copyright © 2018 ZLN. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LNMainTableViewCell : UITableViewCell

@property(nonatomic, strong) UIImageView *iconImageView;
@property(nonatomic, strong) UILabel *titleLabel;

+ (CGFloat)cellHeight;

@end

NS_ASSUME_NONNULL_END

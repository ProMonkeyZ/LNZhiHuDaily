//
//  LNMainNavigationBar.h
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/7/6.
//  Copyright © 2018年 ZLN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LNMainNavigationBar : UIView

+ (CGFloat)getScaleWithStart:(CGFloat)startValue
                      andEnd:(CGFloat)endValue
                    andRatio:(CGFloat)ratio;

@property(nonatomic, copy) NSString *title;
@property(nonatomic, strong) UIColor *ln_backgroundColor;
@property(nonatomic, strong) UIButton *leftButton;
@property(nonatomic, strong) UIButton *rightButton;

@end

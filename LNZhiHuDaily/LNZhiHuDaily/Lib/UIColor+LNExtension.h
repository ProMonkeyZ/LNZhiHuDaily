//
//  UIColor+LNExtension.h
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/7/6.
//  Copyright © 2018年 ZLN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LNExtension)

+ (UIColor *)mainColor;

+ (UIColor *)colorWithRGBHex:(UInt32)Hex;
+ (UIColor *)colorWithRGBHex:(UInt32)hex alpha:(float)alpha;
+ (UIColor *)colorWithHEXString:(NSString *)stringToConvert;
+ (UIColor *)colorWithHEXString:(NSString *)stringToConvert alpha:(float)alpha;

/**
 将UIColor转换为RGB值

 @param color 颜色对象
 @return 色值数组(red,green,blue)
 */
+ (NSArray *)colorToRGB:(UIColor *)color;

#pragma mark - 固定常用颜色
+ (UIColor *)backgroundColor;

@end

//
//  UIColor+LNExtension.m
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/7/6.
//  Copyright © 2018年 ZLN. All rights reserved.
//

#import "UIColor+LNExtension.h"

@implementation UIColor (LNExtension)

+ (UIColor *)mainColor {
    return [UIColor colorWithHEXString:@"17ADDF"];
}

+ (UIColor *)colorWithRGBHex:(UInt32)hex {
    return [UIColor colorWithRGBHex:hex alpha:1.0];
}

+ (UIColor *)colorWithRGBHex:(UInt32)hex alpha:(float)alpha {
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    float al = (alpha >=0 && alpha <= 1.0f) ? alpha : 1.0f;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:al];
}

+ (UIColor *)colorWithHEXString:(NSString *)stringToConvert {
    return [UIColor colorWithHEXString:stringToConvert alpha:1.0];
}

+ (UIColor *)colorWithHEXString:(NSString *)stringToConvert alpha:(float)alpha {
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // 字符串应该是6个或者8个字节
    if ([cString length] < 6) return nil;
    
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor clearColor];
    
    stringToConvert = cString;
    
    NSScanner *scanner = [NSScanner scannerWithString:stringToConvert];
    unsigned hexNum;
    if (![scanner scanHexInt:&hexNum]) return [UIColor clearColor];
    float al = (alpha >=0 && alpha <= 1.0f) ? alpha : 1.0f;
    return [UIColor colorWithRGBHex:hexNum alpha:al];
}

//将UIColor转换为RGB值
+ (NSArray *)colorToRGB:(UIColor *)color {
    NSMutableArray *RGBStrValueArr = [[NSMutableArray alloc] init];
    NSString *RGBStr = nil;
    //获得RGB值描述
    NSString *RGBValue = [NSString stringWithFormat:@"%@",color];
    //将RGB值描述分隔成字符串
    NSArray *RGBArr = [RGBValue componentsSeparatedByString:@" "];
    //获取红色值
    CGFloat r = [[RGBArr objectAtIndex:1] floatValue] * 255.f;
    RGBStr = [NSString stringWithFormat:@"%f",r];
    [RGBStrValueArr addObject:RGBStr];
    //获取绿色值
    CGFloat g = [[RGBArr objectAtIndex:2] floatValue] * 255.f;
    RGBStr = [NSString stringWithFormat:@"%f",g];
    [RGBStrValueArr addObject:RGBStr];
    //获取蓝色值
    CGFloat b = [[RGBArr objectAtIndex:3] floatValue] * 255.f;
    RGBStr = [NSString stringWithFormat:@"%f",b];
    [RGBStrValueArr addObject:RGBStr];
    //返回保存RGB值的数组
    return [NSArray arrayWithArray:RGBStrValueArr];
}

#pragma mark - 固定常用颜色
+ (UIColor *)backgroundColor {
    return [UIColor colorWithHEXString:@"#F8F8FB"];  //242,242,242
}

@end

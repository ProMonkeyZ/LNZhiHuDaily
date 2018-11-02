//
//  LNTools.h
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/10/17.
//  Copyright © 2018 ZLN. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LNTools : UIView

/**
 日期格式转换

 @param str yyyyMMdd
 @return yyyy年MM月dd日
 */
+ (NSString *)getDateStringWithTimeStr:(NSString *)str;

@end

NS_ASSUME_NONNULL_END

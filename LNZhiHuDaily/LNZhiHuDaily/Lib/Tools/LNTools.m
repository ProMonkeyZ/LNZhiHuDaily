//
//  LNTools.m
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/10/17.
//  Copyright © 2018 ZLN. All rights reserved.
//

#import "LNTools.h"

@implementation LNTools

// 时间戳转时间,时间戳为13位是精确到毫秒的，10位精确到秒
+ (NSString *)getDateStringWithTimeStr:(NSString *)str {
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init]; //实例化一个NSDateFormatter对象
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter1 setDateFormat:@"yyyyMMdd"];
    NSDate *date1 = [dateFormatter1 dateFromString:str];
    //将日期转为指定格式
    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc] init];
    [dateFormat2 setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"zyc"]];
    [dateFormat2 setLocale:[NSLocale currentLocale]];
    //将NSDate格式时间转成什么格式的字符串例如转成M-d
    [dateFormat2 setDateFormat:@"yyyy年MM月dd日"];
    [dateFormat2 setFormatterBehavior:NSDateFormatterBehaviorDefault];
    
    NSString *timeStr = [dateFormat2 stringFromDate:date1];
    
    return timeStr;
}

@end

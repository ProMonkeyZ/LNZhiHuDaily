//
//  LNStoryModel.m
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/10/8.
//  Copyright © 2018 ZLN. All rights reserved.
//

#import "LNStoryModel.h"

@implementation LNStoryModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"st_id":@"id"};
}

- (NSDictionary *)nomalAttributs {
    if (!_nomalAttributs) {
        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        //调整行间距
        paragraphStyle.lineSpacing = 6;
        _nomalAttributs = @{NSParagraphStyleAttributeName:paragraphStyle,NSForegroundColorAttributeName:[UIColor colorWithHEXString:@"#222222"],NSFontAttributeName:[UIFont systemFontOfSize:18]};
    }
    return _nomalAttributs;
}

- (NSDictionary *)readedAttributs {
    if (!_readedAttributs) {
        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        //调整行间距
        paragraphStyle.lineSpacing = 6;
        _readedAttributs = @{NSParagraphStyleAttributeName:paragraphStyle,NSForegroundColorAttributeName:[UIColor colorWithHEXString:@"#A9A9A9"],NSFontAttributeName:[UIFont systemFontOfSize:18]};
    }
    return _readedAttributs;
}

@end

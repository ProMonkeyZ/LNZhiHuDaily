//
//  LNStoryDetailModel.m
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/10/19.
//  Copyright © 2018 ZLN. All rights reserved.
//

#import "LNStoryDetailModel.h"

@implementation LNStorySectionModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"section_id":@"id"};
}

@end

@implementation LNStoryDetailModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"st_id":@"id"};
}

@end

//
//  LNDetailViewModel.h
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/10/19.
//  Copyright © 2018 ZLN. All rights reserved.
//

#import "LNBaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LNDetailViewModel : LNBaseViewModel

/// 消息详情ID
@property(nonatomic, strong) NSNumber *st_id;

- (void)getData;

- (NSString *)getHtmlBody;

@end

NS_ASSUME_NONNULL_END

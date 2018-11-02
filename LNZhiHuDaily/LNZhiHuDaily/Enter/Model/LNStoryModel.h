//
//  LNStoryModel.h
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/10/8.
//  Copyright © 2018 ZLN. All rights reserved.
//

#import "LNBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LNStoryModel : LNBaseModel

/// 故事id
@property(nonatomic, strong) NSNumber *st_id;
@property(nonatomic, strong) NSArray *images;
@property(nonatomic, copy) NSString *image;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, assign) NSInteger type;

#pragma mark - 缓存字段
/// 标题富文本
@property(nonatomic, strong) NSAttributedString *attributedTitle;
/// 未读富文本字典
@property(nonatomic, strong) NSDictionary *nomalAttributs;
/// 已读富文本字典
@property(nonatomic, strong) NSDictionary *readedAttributs;

@end

NS_ASSUME_NONNULL_END

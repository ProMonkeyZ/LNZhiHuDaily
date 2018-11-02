//
//  LNStoryDetailModel.h
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/10/19.
//  Copyright © 2018 ZLN. All rights reserved.
//

#import "LNBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LNStorySectionModel : LNBaseModel

@property(nonatomic, copy) NSString *thumbnail;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, strong) NSNumber *section_id;

@end

@interface LNStoryDetailModel : LNBaseModel

@property(nonatomic, copy) NSString *body;
@property(nonatomic, copy) NSString *image_source;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *image;
@property(nonatomic, copy) NSString *share_url;
@property(nonatomic, copy) NSString *ga_prefix;
@property(nonatomic, copy) LNStorySectionModel *section;
@property(nonatomic, copy) NSNumber *st_id;
@property(nonatomic, strong) NSArray *css;
@property(nonatomic, strong) NSArray *js;
@property(nonatomic, strong) NSArray *recommenders;

@end

NS_ASSUME_NONNULL_END

//
//  LNNetworking.h
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/10/8.
//  Copyright © 2018 ZLN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "RACAFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface LNNetworking : NSObject

+ (instancetype)sharedInstance;

#pragma mark - request

- (RACSignal *)ln_GET:(NSDictionary *)parameters domain:(NSString *)domain path:(NSString *)path;

- (RACSignal *)ln_POST:(NSDictionary *)parameters domain:(NSString *)domain path:(NSString *)path;

@end

NS_ASSUME_NONNULL_END

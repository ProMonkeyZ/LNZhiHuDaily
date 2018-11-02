//
//  LNDetailViewModel.m
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/10/19.
//  Copyright © 2018 ZLN. All rights reserved.
//

#import "LNDetailViewModel.h"
#import "LNNetworking.h"
#import "UrlHeader.h"
#import "LNStoryDetailModel.h"

@interface LNDetailViewModel ()

@property(nonatomic, strong) LNStoryDetailModel *model;

@end

@implementation LNDetailViewModel

- (void)getData {
    NSString *path = [NSString stringWithFormat:@"4/news/%@",self.st_id];
    @weakify(self);
    RACDisposable *disposable = [[[LNNetworking sharedInstance] ln_GET:@{} domain:domain path:path] subscribeNext:^(RACTuple *dataTuple) {
        @strongify(self);
        NSDictionary *dataDic = dataTuple.first;
        LNStoryDetailModel *model = [LNStoryDetailModel mj_objectWithKeyValues:dataDic];
        self.model = model;
        [self.updatedContentSignal sendNext:model];
    } error:^(NSError *error) {
        @strongify(self);
        [self.errorSignal sendNext:error];
    }];
    
    [self addDisposeSignal:disposable];
}

- (NSString *)getHtmlBody {
    return self.model.body;
}

@end

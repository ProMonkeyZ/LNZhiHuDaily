//
//  LNBaseViewModel.m
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/10/8.
//  Copyright © 2018 ZLN. All rights reserved.
//

#import "LNBaseViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface LNBaseViewModel ()

@property (nonatomic, strong) NSMutableArray *racDisposes;

@end

@implementation LNBaseViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _updatedContentSignal = [[RACSubject subject] setNameWithFormat:@"%@ updatedContentSignal", self.class];
        _errorSignal = [[RACSubject subject] setNameWithFormat:@"%@ errorSignal", self.class];
        _racDisposes = [NSMutableArray array];
        _autoDispose = YES;
    }
    
    return self;
}

- (void)addDisposeSignal:(RACDisposable *)signal {
    if (!signal) {
        return;
    }
    [self.racDisposes addObject:signal];
}

- (void)clearDisposeSignals {
    [self.racDisposes removeAllObjects];
}

- (void)dispose {
    for (RACDisposable *racdispose in self.racDisposes) {
        [racdispose dispose];
    }
    [self clearDisposeSignals];
    self.loading = NO;
}

- (NSArray *)getDisposeArray {
    return _racDisposes;
}

- (void)dealloc {
#ifdef DEBUG
    NSLog(@"dealloc -- %@",self.class);
#endif
    if (self.autoDispose && self.racDisposes.count > 0) {
        [self dispose];
    }
}

@end

//
//  LNBaseViewModel.h
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/10/8.
//  Copyright © 2018 ZLN. All rights reserved.
//

#import "RVMViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@class RACSubject;
@class RACDisposable;

@interface LNBaseViewModel : RVMViewModel

@property (nonatomic, assign, getter = isLoading) BOOL loading;
@property (nonatomic, assign, readonly) NSInteger currentPageStatus;

//! 内容更新信号
@property (nonatomic, readonly) RACSubject *updatedContentSignal;
//! 错误信号
@property (nonatomic, readonly) RACSubject *errorSignal;
@property (nonatomic, readonly, getter = getDisposeArray) NSArray *disposeArray;

//! 默认为YES，ViewModel在dealloc时自动调用dispose。设为NO，则手动调用销毁方法
@property (nonatomic, assign) BOOL autoDispose;
//! 添加销毁信号
- (void)addDisposeSignal:(RACDisposable *)signal;
//! 清空销毁信号列表
- (void)clearDisposeSignals;
//! 调用销毁信号
- (void)dispose;

@end

NS_ASSUME_NONNULL_END

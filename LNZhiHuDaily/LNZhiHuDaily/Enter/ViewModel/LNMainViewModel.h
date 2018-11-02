//
//  LNMainViewModel.h
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/10/8.
//  Copyright © 2018 ZLN. All rights reserved.
//

#import "LNBaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@class LNDetailViewModel;

@interface LNMainViewModel : LNBaseViewModel

- (void)getData;

- (void)footerRefresh;

- (NSInteger)numberOfSections;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;

- (LNDetailViewModel *)fetchDetailViewModelAtIndexPath:(NSIndexPath *)indexPath;

- (NSString *)titleAtSection:(NSInteger)section;

- (NSString *)imageUrlAtIndexpath:(NSIndexPath *)indexPath;

- (NSAttributedString *)titleAtIndexpath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END

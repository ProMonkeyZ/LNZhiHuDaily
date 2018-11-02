//
//  LNStoryDetailViewController.h
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/10/19.
//  Copyright © 2018 ZLN. All rights reserved.
//

#import "LNBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@class LNDetailViewModel;

@interface LNStoryDetailViewController : LNBaseViewController

@property(nonatomic, strong) LNDetailViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END

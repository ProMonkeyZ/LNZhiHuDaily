//
//  LNMainViewModel.m
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/10/8.
//  Copyright © 2018 ZLN. All rights reserved.
//

#import "LNMainViewModel.h"
#import "LNNetworking.h"
#import "LNStoryModel.h"
#import "LNTools.h"
#import "LNDetailViewModel.h"
#import "UrlHeader.h"

@interface LNMainViewModel ()

/// 轮播图数据
@property(nonatomic, strong) NSMutableArray <LNStoryModel *>*topStories;
/// 故事列表数据
@property(nonatomic, strong) NSMutableArray <NSArray *>*stories;
/// 分组标题
@property(nonatomic, strong) NSMutableArray <NSString *>*titles;
/// 最后更新的日期
@property(nonatomic, copy) NSString *date;

@end

@implementation LNMainViewModel

- (void)getData {
    @weakify(self);
    RACDisposable *disposable = [[[LNNetworking sharedInstance] ln_GET:@{} domain:@"https://news-at.zhihu.com/api" path:@"4/news/latest"] subscribeNext:^(RACTuple *dataTuple) {
        @strongify(self);
        self.date = [dataTuple.first valueForKey:@"date"];
        NSArray *topModels = [LNStoryModel mj_objectArrayWithKeyValuesArray:[dataTuple.first valueForKey:@"top_stories"]];
        for (LNStoryModel *model in topModels) {
            model.attributedTitle = [[NSAttributedString alloc] initWithString:model.title attributes:model.nomalAttributs];
        }
        NSArray *models = [LNStoryModel mj_objectArrayWithKeyValuesArray:[dataTuple.first valueForKey:@"stories"]];
        for (LNStoryModel *model in models) {
            model.attributedTitle = [[NSAttributedString alloc] initWithString:model.title attributes:model.nomalAttributs];
        }
        
        // 添加数据
        [self.topStories setArray:topModels];
        [self.stories setArray:@[models]];
        [self.titles setArray:@[@"今天"]];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.updatedContentSignal sendNext:RACTuplePack(self.topStories,self.stories)];
        }];
    } error:^(NSError *error) {
        @strongify(self)
        [self.errorSignal sendNext:error];
    }];
    
    [self addDisposeSignal:disposable];
}

- (void)footerRefresh {
    NSString *path = [NSString stringWithFormat:@"4/news/before/%@",self.date];
    @weakify(self);
    RACDisposable *disposable = [[[LNNetworking sharedInstance] ln_GET:@{} domain:@"https://news-at.zhihu.com/api" path:path] subscribeNext:^(RACTuple *dataTuple) {
        @strongify(self);
        self.date = [dataTuple.first valueForKey:@"date"];
        NSString *date = [LNTools getDateStringWithTimeStr:self.date];
        NSArray *models = [LNStoryModel mj_objectArrayWithKeyValuesArray:[dataTuple.first valueForKey:@"stories"]];
        for (LNStoryModel *model in models) {
            model.attributedTitle = [[NSAttributedString alloc] initWithString:model.title attributes:model.nomalAttributs];
        }
        [self.stories addObject:models];
        [self.titles addObject:date];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.updatedContentSignal sendNext:RACTuplePack(self.topStories,self.stories)];
        }];
    } error:^(NSError *error) {
        @strongify(self)
        [self.errorSignal sendNext:error];
    }];

    [self addDisposeSignal:disposable];
}

- (NSInteger)numberOfSections {
    return self.stories.count;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return self.stories[section].count;
}

- (LNDetailViewModel *)fetchDetailViewModelAtIndexPath:(NSIndexPath *)indexPath {
    LNStoryModel *model = self.stories[indexPath.section][indexPath.row];
    LNDetailViewModel *viewModel = [LNDetailViewModel new];
    viewModel.st_id = model.st_id;
    return viewModel;
}

- (NSString *)titleAtSection:(NSInteger)section {
    return self.titles[section];
}

- (NSString *)imageUrlAtIndexpath:(NSIndexPath *)indexPath {
    LNStoryModel *model = self.stories[indexPath.section][indexPath.row];
    if (model.image) {
        return model.image;
    }
    if (model.images.count) {
        return model.images.firstObject;
    }
    return @"";
}

- (NSAttributedString *)titleAtIndexpath:(NSIndexPath *)indexPath {
    LNStoryModel *model = self.stories[indexPath.section][indexPath.row];
    if (model.attributedTitle) {
        return model.attributedTitle;
    }
    return [[NSAttributedString alloc] initWithString:@""];
}

#pragma mark - getter

- (NSMutableArray *)topStories {
    if (!_topStories) {
        _topStories = [NSMutableArray array];
    }
    return _topStories;
}

- (NSMutableArray<NSArray *> *)stories {
    if (!_stories) {
        _stories = [NSMutableArray array];
    }
    return _stories;
}

- (NSMutableArray<NSString *> *)titles {
    if (!_titles) {
        _titles = [NSMutableArray array];
    }
    return _titles;
}

@end

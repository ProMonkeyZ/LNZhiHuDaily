//
//  LNNetworking.m
//  LNZhiHuDaily
//
//  Created by 张立宁 on 2018/10/8.
//  Copyright © 2018 ZLN. All rights reserved.
//

#import "LNNetworking.h"

static LNNetworking *instance = nil;

static dispatch_queue_t contentHttp_sessionManager_Queue() {
    static dispatch_queue_t content_Http_sessionManager_Queue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        content_Http_sessionManager_Queue = dispatch_queue_create([@"com.zln.http-request" cStringUsingEncoding:NSASCIIStringEncoding], DISPATCH_QUEUE_CONCURRENT);
        
    });
    return content_Http_sessionManager_Queue;
}

@interface LNNetworking ()

@property(nonatomic, strong) AFHTTPSessionManager *netManager;

@end

@implementation LNNetworking

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LNNetworking alloc] init];
    });
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        // 默认超时时间为30秒
        [self setTimeoutInterval:30];
    }
    return self;
}

- (void)setTimeoutInterval:(NSTimeInterval)seconds {
    self.netManager.requestSerializer.timeoutInterval = seconds;
}

- (RACSignal *)ln_GET:(NSDictionary *)parameters domain:(NSString *)domain path:(NSString *)path {
    NSString *url = [self requestUrlDomain:domain andPath:path];
    return [self.netManager rac_GET:url parameters:parameters];
}

- (RACSignal *)ln_POST:(NSDictionary *)parameters domain:(NSString *)domain path:(NSString *)path {
    NSString *url = [self requestUrlDomain:domain andPath:path];
    return [self.netManager rac_POST:url parameters:parameters];
}

- (NSString *)requestUrlDomain:(NSString *)domain andPath:(NSString *)path {
    return [NSString stringWithFormat:@"%@/%@",domain,path];
}

#pragma mark - getter

- (AFHTTPSessionManager *)netManager {
    if (!_netManager) {
        _netManager = [AFHTTPSessionManager manager];
        _netManager.securityPolicy = [AFSecurityPolicy defaultPolicy];
        //不允许不信任的证书通过验证
        _netManager.securityPolicy.allowInvalidCertificates = NO;
        //验证域名
        _netManager.securityPolicy.validatesDomainName = YES;
        _netManager.requestSerializer = [AFJSONRequestSerializer serializer];
        _netManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"application/zip", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
        _netManager.completionQueue = contentHttp_sessionManager_Queue();
    }
    return _netManager;
}

@end

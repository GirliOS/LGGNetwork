//
//  LGGSessionNetEngine.m
//  LGGNetwork
//
//  Created by Asuna on 15/8/19.
//  Copyright (c) 2015年 GirliOS. All rights reserved.
//

#import "LGGSessionNetEngine.h"


static NSString* const baseUrl = @"http://www.jianshu.com/";

@implementation LGGSessionNetEngine
+ (LGGSessionNetEngine *)shareHttpTool
{
    static LGGSessionNetEngine* _instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc]initWithBaseURL:[NSURL URLWithString:baseUrl]];
    });
    
    return _instance;
}

- (instancetype)initWithBaseURL:(NSURL *)url
{
    if (self = [super initWithBaseURL:url]) {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer.timeoutInterval = 30;
    }
    return self;
    
}

- (void)getWithURLString:(NSString *)url params:(NSDictionary *)params success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    [self GET:url parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
            success(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(task,error);
        }
    }];
}

- (void)postWithURLString:(NSString *)url params:(NSDictionary *)params success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    
    [self POST:url parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
            success(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(task,error);
        }
    }];
}

- (void)postWithURLString:(NSString *)url params:(NSDictionary *)params formDataArray:(NSArray *)formDataArray success:(void (^)(NSURLSessionDataTask *task,id))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    [self POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> totalFormData) {
        for (LGGFormData *formData in formDataArray) {
            [totalFormData appendPartWithFileData:formData.data name:formData.name fileName:formData.filename mimeType:formData.mimeType];
        }
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
            success(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(task,error);
        }
    }];
    
}

@end


@implementation LGGFormData

@end

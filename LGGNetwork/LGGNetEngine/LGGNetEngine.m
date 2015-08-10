//
//  LGGNetEngine.m
//  LGGNetwork
//
//  Created by girlios on 8/10/15.
//  Copyright (c) 2015 GirliOS. All rights reserved.
//

#import "LGGNetEngine.h"

@interface LGGNetEngine ()

@property (nonatomic, strong) AFHTTPRequestOperationManager *requestManager;

@end

@implementation LGGNetEngine

+ (LGGNetEngine *)sharedInstance
{
    static LGGNetEngine *engine = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        engine = [[LGGNetEngine alloc] init];
    });
    return engine;
}

+ (void)setBaseURL:(NSString *)baseUrl
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 30;
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    [self sharedInstance].requestManager = manager;
    
}

+ (AFHTTPRequestOperation *)loginWithUserId:(NSString *)userId password:(NSString *)password success:(HTTPRequestSuccessBlock)success failure:(HTTPRequestFailureBlock)failure
{
    
    NSString *finalUrl = [NSString stringWithFormat:@"%@/index.php/User/login",[self sharedInstance].requestManager.baseURL];
    return [[self sharedInstance].requestManager POST:finalUrl parameters:@{@"userId":userId,@"password":password} success:success failure:failure];
}

@end

//
//  LGGNetEngine.h
//  LGGNetwork
//
//  Created by girlios on 8/10/15.
//  Copyright (c) 2015 GirliOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"

typedef void (^HTTPRequestSuccessBlock)(AFHTTPRequestOperation *operation, id responseObject);
typedef void (^HTTPRequestFailureBlock)(AFHTTPRequestOperation *operation, NSError *error);

@interface LGGNetEngine : NSObject

+ (void)setBaseURL:(NSString *)baseUrl;

+ (AFHTTPRequestOperation *)loginWithUserId:(NSString *)userId
                                   password:(NSString *)password
                                    success:(HTTPRequestSuccessBlock)success
                                    failure:(HTTPRequestFailureBlock)failure;


@end

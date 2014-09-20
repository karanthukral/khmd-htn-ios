//
//  htnHttpClient.m
//  htn-ios
//
//  Created by Karan Thukral on 2014-09-20.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "htnHttpClient.h"
#import <AFNetworking/AFNetworking.h>

@implementation htnHttpClient

+ (htnHttpClient *)sharedHttpClient {
    static htnHttpClient *sharedHttpClient = nil;
    if (!sharedHttpClient) {
        sharedHttpClient = [[super allocWithZone:nil] init];
    }
    return sharedHttpClient;
}

- (void)getPostsWithLat:(NSDecimal)latitude withLong:(NSDecimal)longitute withNewRadius:(NSDecimal)newRadius withOldRadius:(NSDecimal)oldRadius withSuccess:(void (^)(NSString *returnedObjects, NSError *error))success andFailure:(void(^)(NSError *error))failure
{
    
}

@end

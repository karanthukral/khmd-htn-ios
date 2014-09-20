//
//  htnHttpClient.h
//  htn-ios
//
//  Created by Karan Thukral on 2014-09-20.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface htnHttpClient : NSObject

+ (htnHttpClient *)sharedHttpClient;
- (void)getPostsWithLat:(NSDecimal)latitude withLong:(NSDecimal)longitute withNewRadius:(NSDecimal)newRadius withOldRadius:(NSDecimal)oldRadius withSuccess:(void (^)(NSString *returnedObjects, NSError *error))success andFailure:(void(^)(NSError *error))failure;

@end

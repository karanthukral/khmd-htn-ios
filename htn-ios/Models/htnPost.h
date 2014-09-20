//
//  htnPost.h
//  htn-ios
//
//  Created by Karan Thukral on 2014-09-20.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "htnUser.h"

@interface htnPost : NSObject

@property (nonatomic, strong) htnUser *userID;
@property (nonatomic, strong) NSString *postString;
@property (nonatomic, strong) NSNumber *postNumLikes;
@property (nonatomic, assign) NSDecimalNumber *postLat;
@property (nonatomic, assign) NSDecimalNumber *postLong;
@property (nonatomic, assign) NSDate *postDate;

- (instancetype)initPostWithUserID:(NSNumber *)userID withString:(NSString *)string;
- (instancetype)initPostWithUserID:(htnUser *)userID withString:(NSString *)string withNumLikes:(NSNumber*)numLikes withLat:(NSDecimalNumber *)latitude withLong:(NSDecimalNumber *)longitude;

@end

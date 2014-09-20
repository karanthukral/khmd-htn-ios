//
//  htnPost.m
//  htn-ios
//
//  Created by Karan Thukral on 2014-09-20.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "htnPost.h"

@implementation htnPost

- (instancetype)initPostWithUserID:(htnUser *)userID withString:(NSString *)string {
    return [self initPostWithUserID:userID withString:string withNumLikes:@0 withLat:[[NSDecimalNumber alloc] initWithDouble:0.0] withLong:[[NSDecimalNumber alloc] initWithDouble:0.0]];
}

- (instancetype)initPostWithUserID:(htnUser *)userID withString:(NSString *)string withNumLikes:(NSNumber*)numLikes withLat:(NSDecimalNumber *)latitude withLong:(NSDecimalNumber *)longitude
{
    return [self initPostWithUserID:userID withString:string withNumLikes:numLikes withLat:latitude withLong:longitude withDate:[NSDate date]];
}

- (instancetype)initPostWithUserID:(htnUser *)userID withString:(NSString *)string withNumLikes:(NSNumber*)numLikes withLat:(NSDecimalNumber *)latitude withLong:(NSDecimalNumber *)longitude withDate:(NSDate *)date
{
    self = [super init];
    if (self) {
        _userID = userID;
        _postString = string;
        _postNumLikes = numLikes;
        _postLat = latitude;
        _postLong = longitude;
        _postDate = date;
    }
    return self;
}

@end


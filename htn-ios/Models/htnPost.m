//
//  htnPost.m
//  htn-ios
//
//  Created by Karan Thukral on 2014-09-20.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "htnPost.h"

@implementation htnPost

- (instancetype)initPostWithUserID:(NSNumber *)userID withString:(NSString *)string {
    self = [super init];
    if (self) {
        _userID = userID;
        _postString = string;
    }
    return self;
}

@end

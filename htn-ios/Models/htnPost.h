//
//  htnPost.h
//  htn-ios
//
//  Created by Karan Thukral on 2014-09-20.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface htnPost : NSObject

@property (nonatomic, strong) NSNumber *userID;
@property (nonatomic, strong) NSString *postString;
@property (nonatomic, strong) NSNumber *postNumLikes;
@property (nonatomic, assign) NSDecimal postLat;
@property (nonatomic, assign) NSDecimal postLong;

- (instancetype)initPostWithUserID:(NSNumber *)userID withString:(NSString *)string;

@end

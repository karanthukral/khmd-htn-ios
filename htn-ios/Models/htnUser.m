//
//  htnUser.m
//  htn-ios
//
//  Created by Karan Thukral on 2014-09-20.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "htnUser.h"

@implementation htnUser

- (instancetype)initWithid:(NSNumber *)id withName:(NSString *)name
{
    self = [super init];
    
    if(self){
        _userID = id;
        _userName = name;
    }
    
    return self;
}

@end

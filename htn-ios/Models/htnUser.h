//
//  htnUser.h
//  htn-ios
//
//  Created by Karan Thukral on 2014-09-20.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface htnUser : NSObject

@property (strong, nonatomic) NSNumber *userID;
@property (strong, nonatomic) NSString *userName;

- (instancetype)initWithid:(NSNumber *)id withName:(NSString *)name;

@end

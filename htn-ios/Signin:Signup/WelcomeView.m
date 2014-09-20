//
//  WelcomeView.m
//  htn-ios
//
//  Created by Karan Thukral on 2014-09-20.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "WelcomeView.h"

const NSString *welcomeText = @"Welcome to Geo Board!";

@implementation WelcomeView
{
    UILabel *_welcomeTextLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _welcomeTextLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _welcomeTextLabel.text = [welcomeText copy];
        _welcomeTextLabel.backgroundColor = [UIColor yellowColor];
        [self addSubview:_welcomeTextLabel];
        
        _signinButton = [[UIButton alloc] initWithFrame:CGRectZero];
        _signinButton.titleLabel.text = @"Sign In";
        [self addSubview:_signinButton];
        
        _signupButton = [[UIButton alloc] initWithFrame:CGRectZero];
        _signupButton.titleLabel.text = @"Sign Up";
        [self addSubview:_signupButton];
    }
    return self;
}

- (void)layoutSubviews
{
    _welcomeTextLabel.frame = CGRectMake(25, 50, 100, 100); //VERY TEMP
}

@end

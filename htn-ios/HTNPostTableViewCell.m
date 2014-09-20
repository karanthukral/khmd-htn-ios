//
//  HTNPostTableViewCell.m
//  htn-ios
//
//  Created by Hyder SM on 2014-09-20.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "HTNPostTableViewCell.h"

@implementation HTNPostTableViewCell

- (void)setPost:(htnPost *)post
{
    _post = post;
    
    [self.postTitleLabel setText:_post.postString];
    [self.numLikesLabel setText:[_post.postNumLikes stringValue]];
    
    NSDate *now = [NSDate date];
    NSTimeInterval diff = [now timeIntervalSinceDate:now];
}

@end

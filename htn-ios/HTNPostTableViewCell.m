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
    
    NSTimeInterval diff = [_post.postDate timeIntervalSinceNow];
    int hoursOld = -(NSInteger)diff/60;
    [self.timeLabel setText:[NSString stringWithFormat:@"%dhrs", hoursOld]];
    [self.userNameLabel setText:_post.userID.userName];
}

- (void)upvote
{
    if(!self.upvoteClicked){
        [self.upvoteImage setImage:[UIImage imageNamed:@"greenVote"]];
        self.post.postNumLikes = [NSNumber numberWithInt:[self.post.postNumLikes intValue] + 1];
        [self.numLikesLabel setText:[self.post.postNumLikes stringValue]];
        self.upvoteClicked = YES;
    }
}

@end

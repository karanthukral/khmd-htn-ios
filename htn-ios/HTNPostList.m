//
//  HTNPostList.m
//  htn-ios
//
//  Created by Hyder SM on 2014-09-20.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "HTNPostList.h"
#import "htnUser.h"
#import "htnPost.h"


@implementation HTNPostList

+ (HTNPostList *)sharedInstance
{
    static HTNPostList *sharedList;
    
    if(!sharedList){
        sharedList = [[self alloc] initPrivate];
    }
    
    return sharedList;
}

- (HTNPostList *)initPrivate
{
    self = [super init];
    
    if(self){
        self.postList = [[NSMutableArray alloc] init];
        [self generateDummyData];
    }
    
    return self;
}

- (void)setPostList:(NSMutableArray *)postList
{
    _postList = postList;
    [self updateViewControllers];
}

- (void)generateDummyData
{
    htnUser *userOne = [[htnUser alloc] initWithid:@123 withName:@"hydersm"];
    htnPost *postOne = [[htnPost alloc] initPostWithUserID:userOne withString:@"does this work?"withNumLikes:@4 withLat:[[NSDecimalNumber alloc] initWithDouble:100.0] withLong:[[NSDecimalNumber alloc] initWithDouble:100.0] withDate:[[NSDate alloc] initWithTimeIntervalSinceNow:-180]];
    [self addPost:postOne];
    
    htnUser *userTwo = [[htnUser alloc] initWithid:@123 withName:@"duyeeee"];
    htnPost *postTwo = [[htnPost alloc] initPostWithUserID:userTwo withString:@"best designer ever?" withNumLikes:@2 withLat:[[NSDecimalNumber alloc] initWithDouble:100.0] withLong:[[NSDecimalNumber alloc] initWithDouble:100.0] withDate:[[NSDate alloc] initWithTimeIntervalSinceNow:-60]];
    [self.postList addObject:postTwo];
}

- (void)addPost:(htnPost *)post
{
    [self.postList addObject:post];
    [self updateViewControllers];
}

- (void)updateViewControllers
{
    self.tableViewController.posts = self.postList;
    
    //map update code here
}

@end

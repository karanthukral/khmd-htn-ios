//
//  HTNPostList.h
//  htn-ios
//
//  Created by Hyder SM on 2014-09-20.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTNPostTableViewController.h"

@interface HTNPostList : NSObject

@property (nonatomic) NSMutableArray *postList;
@property HTNPostTableViewController *tableViewController;

+ (HTNPostList *)sharedInstance;

@end

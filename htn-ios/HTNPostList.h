//
//  HTNPostList.h
//  htn-ios
//
//  Created by Hyder SM on 2014-09-20.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTNPostTableViewController.h"
#import "htnMapViewController.h"

@interface HTNPostList : NSObject

@property (nonatomic, strong) NSMutableArray *postList;
@property (nonatomic, strong) HTNPostTableViewController *tableViewController;
@property (nonatomic, strong) htnMapViewController *mapViewController;

+ (HTNPostList *)sharedInstance;

@end

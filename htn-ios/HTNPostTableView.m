//
//  HTNPostTableView.m
//  htn-ios
//
//  Created by Hyder SM on 2014-09-20.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "HTNPostTableView.h"
#import "htnPost.h"
#import "HTNPostTableViewCell.h"

@interface HTNPostTableView ()

@property (nonatomic, strong) NSMutableArray *posts;

@end

@implementation HTNPostTableView

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"woodBackground"]];
    [backgroundView setFrame:self.tableView.frame];
    
    self.tableView.backgroundView = backgroundView;
    
    self.tableView.separatorColor = [UIColor clearColor];
    
    
    _posts = [[NSMutableArray alloc] init];
    
    htnPost *postOne = [[htnPost alloc] initPostWithUserID:@123123 withString:@"Hello"];
    [self.posts addObject:postOne];
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%lu", (unsigned long)[self.posts count]);
    return [self.posts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HTNPostTableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"HTNPostTableViewCell"];
    
    if(!tableViewCell){
        [tableView registerNib:[UINib nibWithNibName:@"HTNPostTableViewCell" bundle:nil] forCellReuseIdentifier:@"HTNPostTableViewCell"];
        tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"HTNPostTableViewCell"];
    }
    
    return tableViewCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 97;
}


@end
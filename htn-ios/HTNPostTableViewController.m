//
//  HTNPostTableView.m
//  htn-ios
//
//  Created by Hyder SM on 2014-09-20.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "HTNPostTableViewController.h"
#import "htnPost.h"
#import "HTNPostTableViewCell.h"
#import "htnUser.h"
#import "HTNPostList.h"

@interface HTNPostTableViewController ()

@property (nonatomic, strong) IBOutlet UIView *headerView;

@end

@implementation HTNPostTableViewController

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
    
    _posts = [HTNPostList sharedInstance].postList;
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.tableHeaderView = self.headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.posts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HTNPostTableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"HTNPostTableViewCell"];
    
    if(!tableViewCell){
        [tableView registerNib:[UINib nibWithNibName:@"HTNPostTableViewCell" bundle:nil] forCellReuseIdentifier:@"HTNPostTableViewCell"];
        tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"HTNPostTableViewCell"];
    }
    
    tableViewCell.post = self.posts[indexPath.row];
    [tableViewCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [tableViewCell.upvoteButton addGestureRecognizer:singleFingerTap];
    
    return tableViewCell;
}


- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    [((HTNPostTableViewCell *)recognizer.view.superview.superview) upvote];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 97;
}

- (UIView *)headerView
{
    if(!_headerView){
        [[NSBundle mainBundle] loadNibNamed:@"HTNTableHeaderView" owner:self options:nil];
    }
    
    return _headerView;
}

- (void)setPosts:(NSMutableArray *)posts
{
    _posts = posts;
    if(self.tableView){
        [self.tableView reloadData];
    }
}

@end
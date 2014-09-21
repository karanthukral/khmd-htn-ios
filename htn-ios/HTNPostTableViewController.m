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
#import "HTNWritePostViewController.h"

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

    self.navigationItem.title = @"Bulletin";
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.16 green:0.18 blue:0.01 alpha:1];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:0.41 green:0.22 blue:0 alpha:1]};
//    self.tableView.backgroundColor = [UIColor colorWithRed:0.82 green:0.84 blue:0.85 alpha:1];
    
    _posts = [HTNPostList sharedInstance].postList;
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(goToWritePostView)];
}

- (void)goToWritePostView
{
    HTNWritePostViewController *writeViewController = [[HTNWritePostViewController alloc] init];
    [self.navigationController pushViewController:writeViewController animated:YES];
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
    [tableViewCell.layer setCornerRadius:20.0f];
    [tableViewCell.layer setMasksToBounds:YES];
    
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
    htnPost *currentPost = _posts[indexPath.row];
    CGRect titleLabelFontSize = [currentPost.postString boundingRectWithSize:CGSizeMake(240, CGFLOAT_MAX) options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:17.0] forKey:NSFontAttributeName] context:nil];

    return titleLabelFontSize.size.height + 50;
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
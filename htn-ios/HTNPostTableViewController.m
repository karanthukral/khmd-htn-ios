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

@interface HTNPostTableViewController ()

@property (nonatomic, strong) NSMutableArray *posts;
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
    
    _posts = [[NSMutableArray alloc] init];
    
    htnPost *post = [[htnPost alloc] initPostWithUserID:@123 withString:@"Hyder"];
    [self.posts addObject:post];
    [self.posts addObject:post];
    [self.posts addObject:post];
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.tableHeaderView = self.headerView;
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
    
    tableViewCell.post = self.posts[indexPath.row];
    
    return tableViewCell;
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

@end
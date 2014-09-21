//
//  HTNWritePostViewController.m
//  htn-ios
//
//  Created by Hyder SM on 2014-09-20.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "HTNWritePostViewController.h"

@interface HTNWritePostViewController ()

@end

@implementation HTNWritePostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect textViewRect = CGRectMake(10, 74, self.view.bounds.size.width - 20, self.view.bounds.size.height/2.0 - 20);
    UITextView *textView = [[UITextView alloc] initWithFrame:textViewRect];
    
    textView.layer.cornerRadius = 20;
    textView.layer.masksToBounds = YES;
    textView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.80];
    [textView setFont:[UIFont systemFontOfSize:25]];
    textView.textContainerInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
//    self.view.backgroundColor = [UIColor colorWithRed:0.82 green:0.84 blue:0.85 alpha:1];
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"woodBackground"]];
    [backgroundView setFrame:self.view.bounds];

    [self.view addSubview:backgroundView];
    [self.view addSubview:textView];
    [textView becomeFirstResponder];
    
    
    UIBarButtonItem *postButton = [[UIBarButtonItem alloc] initWithTitle:@"Post" style:UIBarButtonItemStylePlain target:self action:@selector(submitPost)];
    self.navigationItem.rightBarButtonItem = postButton;
}

- (void)submitPost
{
    //implement this
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  WelcomeViewController.m
//  htn-ios
//
//  Created by Karan Thukral on 2014-09-20.
//  Copyright (c) 2014 Karan Thukral. All rights reserved.
//

#import "WelcomeViewController.h"
#import "WelcomeView.h"

@interface WelcomeViewController ()
{
    WelcomeView *_welcomeView;
}

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _welcomeView = [[WelcomeView alloc] initWithFrame:self.view.bounds];
    _welcomeView.backgroundColor = [UIColor grayColor];
    self.view = _welcomeView;
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

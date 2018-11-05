//
//  RTViewController.m
//  RTMapSDK
//
//  Created by WWWZZ321 on 11/04/2018.
//  Copyright (c) 2018 WWWZZ321. All rights reserved.
//

#import "RTViewController.h"
#import "RealTimeNavigationViewController.h"

@interface RTViewController ()

@end

@implementation RTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (IBAction)jumpMap:(UIButton *)sender {
    RealTimeNavigationViewController *vc = [[RealTimeNavigationViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    //    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
    //    [self presentViewController:navi animated:YES completion:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

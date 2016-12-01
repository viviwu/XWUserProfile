//
//  ViewController.m
//  XWUserProfile
//
//  Created by viviwu on 2016/11/29.
//  Copyright © 2016年 viviwu. All rights reserved.
//

#import "ViewController.h"

#import "XWUserProfileVC.h"
#import "XWUserPageVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)UserProfile:(id)sender {
    
    XWUserProfileVC * vc=[[XWUserProfileVC alloc]initWithNibName:@"XWUserProfileVC" bundle:nil];
//    XWUserProfileVC * vc=[[XWUserProfileVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (IBAction)test:(id)sender {
    XWUserPageVC * vc=[[XWUserPageVC alloc]initWithNibName:@"XWUserProfileVC" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

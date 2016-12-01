//
//  XWUserPageVC.m
//  WeiboHomePage
//
//  Created by viviwu on 2016/11/30.
//  Copyright © 2016年 Maple. All rights reserved.
//

#import "XWUserPageVC.h"

@interface XWUserPageVC ()

@end

@implementation XWUserPageVC

-(instancetype)init
{
    if (self = [super initWithNibName:@"XWUserProfileVC" bundle:nil]) {
        ///<statements#>
    }
    return self;
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    if (self = [super initWithNibName:NSStringFromClass([self.superclass class]) bundle:nibBundleOrNil]) {
        ///<statements#>
    }
    return self; 
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text=@"wo wo wo";
    [self setupSegmentSectionTitles:@[@"电话号码", @"语音小号", @"通话记录"]];
    // Do any additional setup after loading the view.
}

#pragma mark-UITableViewDelegate,
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
#pragma mark-UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell=nil;
    if (2 == self.segmentControl.selectedSegmentIndex) {
        cell=[tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if (!cell) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
        }
    }else{
        cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        }
        cell.detailTextLabel.text=@"qwerty";
    }
    cell.textLabel.text=[NSString stringWithFormat:@"<%ld, %ld>", indexPath.section, indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (0 == self.segmentControl.selectedSegmentIndex) {
        return 55.0;
    }else if(2 == self.segmentControl.selectedSegmentIndex){
        return 25.0;
    }else
        return 44.0;
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

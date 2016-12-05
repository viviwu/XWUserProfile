//
//  XWUserProfileVC.m
//  UUtone
//
//  Created by viviwu on 2016/11/30.
//  Copyright © 2016年 viviwu. All rights reserved.
//

#import "XWUserProfileVC.h"

@interface XWUserProfileVC ()

@property (strong, nonatomic) IBOutlet UIView *profileHeader;
@property (strong, nonatomic) IBOutlet UIView *navigationView;

//Constraints
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *headerTopY;  //default 0
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *segCtrTopY;  //default 210 ->/0

@property (strong, nonatomic) IBOutlet UIView *tableClearHeader;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation XWUserProfileVC

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.tableView.tableHeaderView=_tableClearHeader;
        _navigationView.alpha=0;
    }
    return self;
}

#pragma mark - 初始化操作
- (void)setupSegmentSectionTitles:(NSArray<NSString*>*)sectionNames
{
    // 设置样式
    _segmentControl.sectionTitles =sectionNames;
    _segmentControl.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    _segmentControl.selectionIndicatorHeight = 2.0f;
    _segmentControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    _segmentControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    _segmentControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor lightGrayColor], NSFontAttributeName : [UIFont systemFontOfSize:17.0]};
    _segmentControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
    _segmentControl.selectionIndicatorColor = [UIColor blackColor];
    _segmentControl.selectedSegmentIndex = 1;
    // 添加点击事件
    [_segmentControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    _navigationView.alpha=0;
    [self setupSegmentSectionTitles:@[@"最热", @"微博", @"相册"]];
    _titleLabel.text=@"vivi wu";
 
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 设置导航栏背景为透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]forBarMetrics:UIBarMetricsDefault];
    // 隐藏导航栏底部黑线
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // 当都设置为nil的时候，导航栏会使用默认的样式，即还原导航栏样式
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = nil;
}

#pragma mark--UIScrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offY = scrollView.contentOffset.y;
    _headerTopY.constant = -offY;
    if (offY>0 && offY<=146.0) {
        _navigationView.alpha=offY/146.0;
    }else if(offY>146.0){
        _navigationView.alpha=1;
    }else{
        _navigationView.alpha=0;
    }
    
    if (offY > 146.0) {//210-64
        _segCtrTopY.constant=offY-146;
    }else{
        _segCtrTopY.constant=0;
    }
    if (offY<123.0) {
        _titleLabel.hidden=YES;
        _nameLabel.hidden=NO;
    }else{
        _titleLabel.hidden=NO;
        _nameLabel.hidden=YES;
    }
}
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    CGFloat offY = scrollView.contentOffset.y;
    NSLog(@"BeginDecelerating==%f", offY);
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat offY = scrollView.contentOffset.y;
    NSLog(@"EndDecelerating==%f\n *****", offY);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return 2;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.detailTextLabel.text=@"qwerty";
    cell.textLabel.text=[NSString stringWithFormat:@"<%ld, %ld>", indexPath.section, indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0;
}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segment
{
    NSLog(@"segment==%ld", (long)segment.selectedSegmentIndex);
    [self.tableView reloadData];
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

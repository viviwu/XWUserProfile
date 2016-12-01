//
//  XWUserProfileVC.h
//  UUtone
//
//  Created by viviwu on 2016/11/30.
//  Copyright © 2016年 viviwu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMSegmentedControl.h"

//@class XWContact;
@interface XWUserProfileVC : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIImageView *userAvater;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *profileLabel;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
//@property (nonatomic, assign) BOOL fromChatView;
//@property (nonatomic, strong) XWContact * contact;
@property (strong, nonatomic) IBOutlet HMSegmentedControl *segmentControl;
- (void)setupSegmentSectionTitles:(NSArray<NSString*>*)sectionNames;

@end


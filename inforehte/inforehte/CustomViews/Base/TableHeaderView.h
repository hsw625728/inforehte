//
//  DSTableHeaderView.h
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/7.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#ifndef TableHeaderView_h
#define TableHeaderView_h

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString *const kTableHeaderViewID;

@interface TableHeaderView : UITableViewHeaderFooterView

+ (CGFloat)viewHeight;

@property (strong, nonatomic) UILabel *titleLabel;

@end

#endif /* TableHeaderView_h */

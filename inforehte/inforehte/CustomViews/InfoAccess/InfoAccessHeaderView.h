//
//  InfoAccessHeaderView.h
//  inforehte
//
//  Created by HANSHAOWEN on 17/9/21.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#ifndef InfoAccessHeaderView_h
#define InfoAccessHeaderView_h

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString *const kInfoAccessHeaderViewID;

@interface InfoAccessHeaderView : UITableViewHeaderFooterView

+ (CGFloat)viewHeight;

@property (strong, nonatomic) UILabel *titleLabel;

@end

#endif /* InfoAccessHeaderView_h */

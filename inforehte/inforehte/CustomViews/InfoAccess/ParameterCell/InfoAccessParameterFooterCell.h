//
//  InfoAccessParameterFooterCell.h
//  inforehte
//
//  Created by HANSHAOWEN on 17/9/22.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#ifndef InfoAccessParameterFooterCell_h
#define InfoAccessParameterFooterCell_h

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString *const kInfoAccessParameterFooterCellID;

@interface InfoAccessParameterFooterCell : UITableViewHeaderFooterView

+ (CGFloat)viewHeight;

@property (strong, nonatomic) UIButton *infoBtn;

@end

#endif /* InfoAccessParameterFooterCell_h */

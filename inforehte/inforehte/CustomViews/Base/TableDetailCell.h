//
//  DSTableDetailCell.h
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/7.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#ifndef TableDetailCell_h
#define TableDetailCell_h
#import "BaseCell.h"

FOUNDATION_EXPORT NSString *const kTableDetailCellID;

@class SkillDetailItem;

@interface TableDetailCell : DSBaseCell

+ (CGFloat)cellHeight;

- (void)configureCellWithSearchItem:(SkillDetailItem *)item;


@end

#endif /* TableDetailCell_h */

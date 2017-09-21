//
//  DSTableAppSettingCell.h
//  dqxSkillSmltr
//
//  Created by SHAOWENn HAN on 16/12/17.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#ifndef TableAppSettingCell_h
#define TableAppSettingCell_h

#import "BaseCell.h"

FOUNDATION_EXPORT NSString *const kTableAppSettingCellID;

@interface TableAppSettingCell : BaseCell

+ (CGFloat)cellHeight;

- (void)configureCellWithTitle:(NSString *)title imageName:(NSString *)imageName atIndexPath:(NSIndexPath *)indexPath;
@end

#endif /* TableAppSettingCell_h */

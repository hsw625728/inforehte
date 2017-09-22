//
//  InfoAccessDetailCell.h
//  inforehte
//
//  Created by HANSHAOWEN on 17/9/22.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#ifndef InfoAccessDetailCell_h
#define InfoAccessDetailCell_h

#import "BaseCell.h"

FOUNDATION_EXPORT NSString *const kInfoAccessDetailCellID;


@interface InfoAccessDetailCell : BaseCell

+ (CGFloat)cellHeight;
-(void)setCommand:(CommandName)name;

@end

#endif /* InfoAccessDetailCell_h */

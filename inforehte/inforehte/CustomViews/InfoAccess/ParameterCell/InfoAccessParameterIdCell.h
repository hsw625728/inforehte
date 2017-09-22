//
//  InfoAccessParameterIdCell.h
//  inforehte
//
//  Created by HANSHAOWEN on 17/9/22.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#ifndef InfoAccessParameterIdCell_h
#define InfoAccessParameterIdCell_h

#import "InfoAccessParameterBaseCell.h"

FOUNDATION_EXPORT NSString *const kInfoAccessParameterIdCellID;


@interface InfoAccessParameterIdCell : InfoAccessParameterBaseCell

+ (CGFloat)cellHeight;
-(ParameterCellType)getCellType;
-(NSString*)getID;

@end

#endif /* InfoAccessParameterIdCell_h */

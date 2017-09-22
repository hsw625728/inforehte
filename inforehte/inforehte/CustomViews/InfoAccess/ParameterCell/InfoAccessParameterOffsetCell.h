//
//  InfoAccessParameterOffsetCell.h
//  inforehte
//
//  Created by HANSHAOWEN on 17/9/22.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#ifndef InfoAccessParameterOffsetCell_h
#define InfoAccessParameterOffsetCell_h

#import "InfoAccessParameterBaseCell.h"

FOUNDATION_EXPORT NSString *const kInfoAccessParameterOffsetCellID;


@interface InfoAccessParameterOffsetCell : InfoAccessParameterBaseCell

+ (CGFloat)cellHeight;
-(ParameterCellType)getCellType;
-(NSString*)getOffset;

@end

#endif /* InfoAccessParameterOffsetCell_h */

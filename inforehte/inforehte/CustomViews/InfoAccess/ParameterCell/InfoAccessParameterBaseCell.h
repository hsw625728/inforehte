//
//  InfoAccessParameterBaseCell.h
//  inforehte
//
//  Created by HANSHAOWEN on 17/9/22.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#ifndef InfoAccessParameterBaseCell_h
#define InfoAccessParameterBaseCell_h

#import "BaseCell.h"

FOUNDATION_EXPORT NSString *const kInfoAccessParameterBaseCellID;


@interface InfoAccessParameterBaseCell : BaseCell

-(ParameterCellType)getCellType;

@end

#endif /* InfoAccessParameterBaseCell_h */

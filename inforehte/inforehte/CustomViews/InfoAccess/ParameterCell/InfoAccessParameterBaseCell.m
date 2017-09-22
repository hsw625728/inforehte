//
//  InfoAccessParameterBaseCell.m
//  inforehte
//
//  Created by HANSHAOWEN on 17/9/22.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InfoAccessParameterIdCell.h"
#import "View+MASAdditions.h"

NSString *const kInfoAccessParameterBaseCellID = @"InfoAccessParameterBaseCellID";

@interface InfoAccessParameterBaseCell ()


@end

@implementation InfoAccessParameterBaseCell

-(ParameterCellType)getCellType
{
    return PCT_VOID;
}

@end

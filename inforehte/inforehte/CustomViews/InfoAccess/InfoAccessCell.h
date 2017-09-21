//
//  InfoAccessCell.h
//  inforehte
//
//  Created by HANSHAOWEN on 17/9/21.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#ifndef InfoAccessCell_h
#define InfoAccessCell_h

#import "BaseCell.h"

FOUNDATION_EXPORT NSString *const kInfoAccessCellID;

@interface InfoAccessCell : BaseCell

+ (CGFloat)cellHeight;

- (void)configureCellWithTitle:(NSString *)title imageName:(NSString *)imageName atIndexPath:(NSIndexPath *)indexPath;

@end

#endif /* InfoAccessCell_h */

//
//  BaseCommand.h
//  inforehte
//
//  Created by HANSHAOWEN on 17/9/22.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#ifndef BaseCommand_h
#define BaseCommand_h

@interface BaseCommand : NSObject

-(void)setCommand:(CommandName)name;
- (NSInteger)getParametersNum;
- (NSInteger)getResultNum;
- (void)doCommand:(NSString*)id offset:(NSString*)os count:(NSString*)cnt;

@end

#endif /* BaseCommand_h */

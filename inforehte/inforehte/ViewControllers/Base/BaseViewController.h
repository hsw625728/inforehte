//
//  DSBaseViewController.h
//  dqxRecipe
//
//  Created by HANSHAOWEN on 16/11/23.
//  Copyright © 2016年 mengyoutu.cn. All rights reserved.
//

#ifndef DSBaseViewController_h
#define DSBaseViewController_h

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic, assign) BOOL hideNavigationBar;

#pragma mark - HUD

- (void)showHUDWithText:(NSString *)text delay:(NSTimeInterval)delay;
- (void)showHUDDone;
- (void)showHUDDoneWithText:(NSString *)text;
- (void)showHUDErrorWithText : (NSString *)text;
- (void)showHUDNetError;
- (void)showHUDServerError;
- (void)showWithLabelText:(NSString *)showText executing:(SEL)method;
- (void)showHUDWithText:(NSString *)text;
- (void)modelTransformFailedWithError:(NSError *)error;
/**
 *  隐藏当前显示的提示框
 */
- (void)hideHud;

#pragma mark - UI

//添加导航栏左侧搜索图标
-(void)addNavigationBarLeftSearchItem;
-(void)addNavigationBarRightMeItem;

@end

#endif /*BaseViewController_h */

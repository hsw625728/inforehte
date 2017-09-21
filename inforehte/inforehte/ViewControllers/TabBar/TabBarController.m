//
//  DSTabBarControllers.m
//  dqxRecipe
//
//  Created by SHAOWENn HAN on 16/11/23.
//  Copyright © 2016年 mengyoutu.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TabBarController.h"
//#import "SkillPointViewController.h"
#import "AppSettingViewController.h"
//#import "SkillDetailViewController.h"


@interface TabBarController ()

@end


@implementation TabBarController

-(instancetype) init{
    self = [super init];
    if (self)
    {
        AppSettingViewController *cateViewController = [[AppSettingViewController alloc] init];
        UINavigationController *cateNavigationController = [[UINavigationController alloc] initWithRootViewController:cateViewController];
        cateNavigationController.title = InfoAccess;
        
        AppSettingViewController *cateViewController1 = [[AppSettingViewController alloc] init];
        UINavigationController *cateNavigationController1 = [[UINavigationController alloc] initWithRootViewController:cateViewController1];
        cateNavigationController1.title = BaseConcept;
        
        AppSettingViewController *cateViewController3 = [[AppSettingViewController alloc] init];
        UINavigationController *cateNavigationController3 = [[UINavigationController alloc] initWithRootViewController:cateViewController3];
        cateNavigationController3.title = AppSetting;
        
        [self setViewControllers:@[cateNavigationController, cateNavigationController1, cateNavigationController3]];
        
        [self setupTabBar];
    }
    return self;
}


- (void)setupTabBar {
    NSArray *tabBarItemImageNames = @[@"tab_home", @"tab_read", @"tab_music", @"tab_movie"];
    NSInteger index = 0;
    
    for (UIViewController *vc in self.viewControllers) {
        NSString *normalImageName =  [NSString stringWithFormat:@"%@_normal", [tabBarItemImageNames objectAtIndex:index]];
        NSString *selectedImageName = [NSString stringWithFormat:@"%@_selected", [tabBarItemImageNames objectAtIndex:index]];
        UIImage *normalImage = [UIImage imageNamed:normalImageName];
        UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
        
        vc.tabBarItem.image = normalImage;
        vc.tabBarItem.selectedImage = selectedImage;
        
        index++;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  DSSkillHistoryViewController.m
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/7.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "View+MASAdditions.h"
#import "UIImage+Common.h"
#import "AppSettingViewController.h"
#import "TableAppSettingCell.h"
#import "TableHeaderView.h"
#import "AppHelpViewController.h"


@interface AppSettingViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) TableHeaderView *headerView;

@end

@implementation AppSettingViewController {
    NSArray *sectionTitles;
    NSArray *rowTitles;
    NSArray *rowImageNames;
}

#pragma mark - Lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.hideNavigationBar = YES;
    //self.automaticallyAdjustsScrollViewInsets = NO;
    //self.edgesForExtendedLayout = UIRectEdgeAll;
    
    self.navigationItem.title = AppSetting;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    [self initDatas];
    [self setupViews];
    
}

#pragma mark - Private Method

- (void)initDatas {
    sectionTitles = @[@"软件相关", @"操作说明"];
    rowTitles = @[@[@"DQX相关工具", @"建议反馈邮箱：hsw625728@163.com"], @[@"主界面操作示例", @"等级设置界面操作示例", @"职业技能点洁面操作示例"]];
    rowImageNames = @[@[@"center_setting", @"tab_music_normal"], @[@"tab_movie_normal", @"tab_movie_normal", @"tab_movie_normal"]];
}

- (void)setupViews {
    //_headerView = [[DSTableHeaderView alloc] initWithUserType:MLBUserTypeMe];
    
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.backgroundColor = ViewControllerBGColor;
        tableView.dataSource = self;
        tableView.delegate = self;
        [tableView registerClass:[TableAppSettingCell class] forCellReuseIdentifier:kTableAppSettingCellID];
        [tableView registerClass:[TableHeaderView class] forHeaderFooterViewReuseIdentifier:kTableHeaderViewID];
        tableView.rowHeight = [TableAppSettingCell cellHeight];
        
        [self.view addSubview:tableView];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        
        tableView;
    });
}

#pragma mark - Public Method



#pragma mark - Action



#pragma mark - Network Request



#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return sectionTitles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *rows = rowTitles[section];
    return rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableAppSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableAppSettingCellID forIndexPath:indexPath];
    [cell configureCellWithTitle:rowTitles[indexPath.section][indexPath.row] imageName:rowImageNames[indexPath.section][indexPath.row] atIndexPath:indexPath];
    
    return cell;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [TableHeaderView viewHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    TableHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kTableHeaderViewID];
    view.titleLabel.text = sectionTitles[section];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0)
    {
        switch (indexPath.row)
        {
            case 0:
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/zhi-ren-pei-fang-su-caifor-dqx/id1181736107?l=zh&ls=1&mt=8"]];
                break;
            default:
                break;
        }
    }
    else{
        AppHelpViewController *view = [[AppHelpViewController alloc] init];
        switch (indexPath.row) {
            case 0:
                [view setHelpImageName:@"help_main"];
                break;
            case 1:
                [view setHelpImageName:@"help_level"];
                break;
            case 2:
                [view setHelpImageName:@"help_point"];
                break;
            default:
                break;
        }
        [self.navigationController pushViewController:view animated:YES];
    }
    //
}

@end

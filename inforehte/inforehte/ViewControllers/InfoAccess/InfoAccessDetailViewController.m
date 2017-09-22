//
//  InfoAccessDetailViewController.m
//  inforehte
//
//  Created by HANSHAOWEN on 17/9/22.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InfoAccessDetailViewController.h"
#import "View+MASAdditions.h"
#import "UIImage+Common.h"
#import "InfoAccessDetailCell.h"
#import "TableHeaderView.h"
#import "BaseCommand.h"
#import "InfoAccessParameterFooterCell.h"
#import "InfoAccessParameterBaseCell.h"
#import "InfoAccessParameterIdCell.h"
#import "InfoAccessParameterOffsetCell.h"

@interface InfoAccessDetailViewController() <UITableViewDataSource, UITableViewDelegate>


@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) BaseCommand *command;

@end

@implementation InfoAccessDetailViewController{
    AppDelegate *appDelegate;
}

#pragma mark - Lifecycle

- (void)dealloc {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    _command = [[BaseCommand alloc] init];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = InfoAccess;
    
    [self setupViews];
    
    //设置导航栏
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    [self initDatas];
    [self setupViews];
    
}
#pragma mark - Private Method

- (void)initDatas {
    appDelegate =  (AppDelegate *) [[UIApplication sharedApplication] delegate];
}

- (void)setupViews {
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.backgroundColor = ViewControllerBGColor;
        tableView.dataSource = self;
        tableView.delegate = self;
        
        [tableView registerClass:[TableHeaderView class] forHeaderFooterViewReuseIdentifier:kTableHeaderViewID];
        [tableView registerClass:[InfoAccessDetailCell class] forCellReuseIdentifier:kInfoAccessDetailCellID];
        [tableView registerClass:[InfoAccessParameterFooterCell class] forHeaderFooterViewReuseIdentifier:kInfoAccessParameterFooterCellID];
        tableView.rowHeight = [InfoAccessDetailCell cellHeight];
        
        tableView.tableFooterView = [UIView new];
        [self.view addSubview:tableView];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        
        tableView;
    });
}
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //[(ParallaxHeaderView *)_tableView.tableHeaderView layoutHeaderViewForScrollViewOffset:scrollView.contentOffset];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_command getParametersNum] > 0 ? 2 : 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InfoAccessDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:kInfoAccessDetailCellID forIndexPath:indexPath];
    
    [cell setCommand:(_command)];
    return cell;
}


#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return [InfoAccessParameterFooterCell viewHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    InfoAccessParameterFooterCell *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kInfoAccessParameterFooterCellID];
    
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [TableHeaderView viewHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    TableHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kTableHeaderViewID];

    if ([_command getParametersNum] > 0)
    {
        if (section == 0)
            view.titleLabel.text = @"查询参数";
        else
            view.titleLabel.text = @"查询结果";
    }
    else
    {
        view.titleLabel.text = @"查询结果";
    }
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)setCommand:(CommandName)name
{
    [_command setCommand:name];
}

-(void)doCommand
{
    NSInteger pNum = [_command getParametersNum];
    switch(pNum)
    {
        case 0:
            [_command doCommand:nil offset:0 count:0];
            break;
        case 1:
        {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
            InfoAccessParameterBaseCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
            ParameterCellType type = [cell getCellType];
            if (type == PCT_ID)
            {
                [_command doCommand:[(InfoAccessParameterIdCell*)cell getID] offset:@"0" count:@"0"];
            }
            else
            {
                [_command doCommand:@"" offset:[(InfoAccessParameterOffsetCell*)cell getOffset] count:@"0"];
            }
        }
            break;
        case 2:
        {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
            InfoAccessParameterBaseCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
            NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:1 inSection:0];
            InfoAccessParameterBaseCell *cell1 = [_tableView cellForRowAtIndexPath:indexPath1];
            ParameterCellType type = [cell getCellType];
            [_command doCommand:[(InfoAccessParameterIdCell*)cell getID] offset:[(InfoAccessParameterOffsetCell*)cell getOffset] count:@"0"];
        }
            break;
        case -1:
            break;
        default:
            break;
    }
}
@end

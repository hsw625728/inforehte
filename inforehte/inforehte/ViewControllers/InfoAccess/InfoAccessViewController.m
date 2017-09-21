//
//  InfoAccessViewController.m
//  inforehte
//
//  Created by HANSHAOWEN on 17/9/21.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InfoAccessViewController.h"
#import "UIImage+Common.h"
#import "InfoAccessCell.h"
#import "InfoAccessHeaderView.h"
#import "View+MASAdditions.h"
//#import "SubInfoAccessViewController.h"

@interface InfoAccessViewController() <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation InfoAccessViewController{
    NSArray *sectionTitles;
    NSArray *rowTitles;
    NSArray *rowImageNames;
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
    // Do any additional setup after loading the view.
    self.navigationItem.title = InfoAccess;
    
    [self addNavigationBarLeftSearchItem];
    //[self addNavigationBarRightMeItem];
    [self setupViews];
    
    //设置导航栏
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    [self initDatas];
    [self setupViews];
    
    
    
}
#pragma mark - Private Method

- (void)initDatas {
    //加载分类标题数据
    sectionTitles = @[@"账户信息(ACCOUNTS)", @"区块信息(BLOCKS)", @"统计信息(STATISTICS)", @"交易信息(TRANSACTIONS)"];
    rowTitles = @[@[@"GetAccount", @"GetAccountCount", @"GetAccountNonce", @"GetAccountSource", @"GetAccountTransactions", @"GetAccounts", @"GetMinedBlocks", @"GetMinedBlocksHistory", @"GetMinedUnclesHistory", @"GetMultipleAccounts"],
                  @[@"BlockCount", @"GetBlockByNumberOrHash", @"GetBlocks", @"GetTxForBlock"],
                  @[@"AllStatistics", @"BasicStatistics", @"Difficulty", @"GasPrice", @"MiningEstimator", @"Nodes", @"Price", @"Supply"],
                  @[@"GetTransaction", @"GetTransactionCount", @"GetTransactions"]];
    
    rowImageNames = @[@[@"GetAccount", @"GetAccountCount", @"GetAccountNonce", @"GetAccountSource", @"GetAccountTransactions", @"GetAccounts", @"GetMinedBlocks", @"GetMinedBlocksHistory", @"GetMinedUnclesHistory", @"GetMultipleAccounts"],
                      @[@"BlockCount", @"GetBlockByNumberOrHash", @"GetBlocks", @"GetTxForBlock"],
                      @[@"AllStatistics", @"BasicStatistics", @"Difficulty", @"GasPrice", @"MiningEstimator", @"Nodes", @"Price", @"Supply"],
                      @[@"GetTransaction", @"GetTransactionCount", @"GetTransactions"]];
}


- (void)setupViews {
    //_headerView = [[MLBUserHomeHeaderView alloc] initWithUserType:MLBUserTypeMe];
    //[_headerView configureHeaderViewForTestMe];
    
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.backgroundColor = ViewControllerBGColor;
        tableView.dataSource = self;
        tableView.delegate = self;
        [tableView registerClass:[InfoAccessCell class] forCellReuseIdentifier:kInfoAccessCellID];
        [tableView registerClass:[InfoAccessHeaderView class] forHeaderFooterViewReuseIdentifier:kInfoAccessHeaderViewID];
        tableView.rowHeight = [InfoAccessCell cellHeight];
        
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
    return sectionTitles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *rows = rowTitles[section];
    return rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InfoAccessCell *cell = [tableView dequeueReusableCellWithIdentifier:kInfoAccessCellID forIndexPath:indexPath];
    [cell configureCellWithTitle:rowTitles[indexPath.section][indexPath.row] imageName:rowImageNames[indexPath.section][indexPath.row] atIndexPath:indexPath];
    
    return cell;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [InfoAccessHeaderView viewHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    InfoAccessHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kInfoAccessHeaderViewID];
    view.titleLabel.text = sectionTitles[section];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CommandName command = (CommandName)(indexPath.section*100+indexPath.row);
    //if (indexPath.section == 1 && indexPath.row == 1)
    //{
    //    //[self presentLoginOptsViewController];
    //    return;
    //}
    //DRSubCategoriesViewController *subview = [[DRSubCategoriesViewController alloc] init];
    //[subview setIndex:((int)((indexPath.section+1)*10 + (indexPath.row+1)))];
    //[self.navigationController pushViewController:subview animated:YES];
}

@end

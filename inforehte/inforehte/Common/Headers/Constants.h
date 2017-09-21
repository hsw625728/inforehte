//
//  Constants.h
//  dqxSkillSmltr
//
//  Created by HANSHAOWEN on 16/12/7.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#ifndef Constants_h
#define Constants_h
#pragma mark - UISize
#define TableViewHigh 48
#define TableIconWidth 48

#pragma mark - UIColor

#define AppThemeColor                        [UIColor colorWithRed:142 / 255.0 green:182 / 255.0 blue:230 / 255.0 alpha:1]// #8EB6E6
#define NavigationBarTitleTextColor          [UIColor colorWithRed:78 / 255.0 green:92 / 255.0 blue:108 / 255.0 alpha:1]// #4E5C6C
#define ViewControllerBGColor                [UIColor colorWithRed:250 / 255.0 green:252 / 255.0 blue:255 / 255.0 alpha:1]// #FAFCFF
#define ScoreTextColor                       [UIColor colorWithRed:240 / 255.0 green:89 / 255.0 blue:93 / 255.0 alpha:1]// #F0595D
#define LightBlackTextColor                  [UIColor colorWithWhite:90 / 255.0 alpha:1]// #5A5A5A
#define DarkBlackTextColor                   [UIColor colorWithWhite:51 / 255.0 alpha:1]// #333333
#define DarkGrayTextColor                    [UIColor colorWithWhite:173 / 255.0 alpha:1]// #ADADAD
#define GrayTextColor                        [UIColor colorWithWhite:177 / 255.0 alpha:1]// #B1B1B1
#define LightGrayTextColor                   [UIColor colorWithWhite:198 / 255.0 alpha:1]// #C6C6C6
#define SeparatorColor                       [UIColor colorWithWhite:229 / 255.0 alpha:1]// #E5E5E5
#define ShadowColor                          [UIColor colorWithWhite:102 / 255.0 alpha:1]// #666666


#define DSLightGrayTextColor [UIColor colorWithWhite:198 / 255.0 alpha:1]// #C6C6C6

//Title
#define InfoAccess @"信息查询"
#define BaseConcept @"基本概念"
#define AppSetting @"其他设置"
#define JobLevelSetting @"等级设置"
#define AppHelp @"操作示例"

// Hint
#define CancelStr                             @"取消"
#define SaveStr                               @"保存"
#define BAD_NETWORK                             @"网络连接失败"
#define SERVER_ERROR                            @"服务器连接失败"

// HUD
#define HUD_DELAY                               1.5
#define MLBPullToRefreshBorderWidth             4

typedef enum {
    CN_GetAccount=0,
    CN_GetAccountCount,
    CN_GetAccountNonce,
    CN_GetAccountSource,
    CN_GetAccountTransactions,
    CN_GetAccounts,
    CN_GetMinedBlocks,
    CN_GetMinedBlocksHistory,
    CN_GetMinedUnclesHistory,
    CN_GetMultipleAccounts,
    CN_BlockCount=100,
    CN_GetBlockByNumberOrHash,
    CN_GetBlocks,
    CN_GetTxForBlock,
    CN_AllStatistics=200,
    CN_BasicStatistics,
    CN_Difficulty,
    CN_GasPrice,
    CN_MiningEstimator,
    CN_Nodes,
    CN_Price,
    CN_Supply,
    CN_GetTransaction=300,
    CN_GetTransactionCount,
    CN_GetTransactions
}CommandName;

#endif /* Constants_h */

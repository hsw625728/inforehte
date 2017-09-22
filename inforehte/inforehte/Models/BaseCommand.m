//
//  BaseCommand.m
//  inforehte
//
//  Created by HANSHAOWEN on 17/9/22.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseCommand.h"

@interface BaseCommand ()

@property (nonatomic, assign) CommandName command;

@end

@implementation BaseCommand

-(void)setCommand:(CommandName)name{
    _command = name;
}

- (void)doCommand:(NSString*)id offset:(NSString*)os count:(NSString*)cnt
{
        [UIApplication sharedApplication].networkActivityIndicatorVisible =YES;
        //NOTE with this way, cookie is send automatically, so it can be ignored
        //创建NSURLRequest
        NSString* root_url = [[NSString alloc] init];
        root_url = @"https://etherchain.org/api/account/0x0000000000000000000000000000000000000001";
        NSString* urlEncoding = [root_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSMutableURLRequest* urlrequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlEncoding] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:10];
        [UIApplication sharedApplication].networkActivityIndicatorVisible =NO;
        //通过NSURLConnection 发送NSURLRequest，这里是同步的，因此会又等待的过程，TIME_OUT为超时时间。
        //error可以获取失败的原因。
        NSError* error = nil;
        NSData* data = [NSURLConnection sendSynchronousRequest:urlrequest returningResponse:NULL error:&error];
        NSLog(@"data = %@",data);
        if(!error){
            //data是二进制数据－－下面的代码的作用就是将二进制转换为json字符串
            NSString *stringData = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
            NSLog(@"stringData = %@",stringData);
        }
        //    NSString* errorString = [NSString stringWithFormat:@"<error string=\"%@\"/>", [error localizedDescription]];
        NSString* errorString = [error localizedDescription];
        if (errorString != nil) {
            NSLog(@"errorString = %@",errorString);
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible =YES;
}
- (NSInteger)getParametersNum{
    switch(_command)
    {
        //无参数类型命令
        case CN_GetAccountCount:
        case CN_BlockCount:
        case CN_AllStatistics:
        case CN_BasicStatistics:
        case CN_Difficulty:
        case CN_GasPrice:
        case CN_MiningEstimator:
        case CN_Nodes:
        case CN_Price:
        case CN_Supply:
        case CN_GetTransactionCount:
            return 0;
            break;
        //1参数类型命令
        case CN_GetAccount://ID
        case CN_GetAccountNonce://ID
        case CN_GetAccountSource://ID
        case CN_GetAccounts://OFFSET
        case CN_GetMinedBlocks://ID
        case CN_GetMinedBlocksHistory://ID
        case CN_GetMinedUnclesHistory://ID
        case CN_GetMultipleAccounts://ID
        case CN_GetBlockByNumberOrHash://ID
        case CN_GetTxForBlock://ID
        case CN_GetTransaction://ID
            return 1;
            break;
        //2参数类型命令
        case CN_GetAccountTransactions://ID OFFSET
        case CN_GetBlocks://OFFSET COUNT
        case CN_GetTransactions://OFFSET COUNT
            return 2;
            break;
        default:
            return -1;
            break;
    }
    
}

- (NSInteger)getResultNum
{
    return 10;
}

@end

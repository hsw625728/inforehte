//
//  InfoAccessParameterFooterCell.m
//  inforehte
//
//  Created by HANSHAOWEN on 17/9/22.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InfoAccessParameterFooterCell.h"
#import "InfoAccessDetailViewController.h"
#import "View+MASAdditions.h"

NSString *const kInfoAccessParameterFooterCellID = @"InfoAccessParameterFooterCellID";

@implementation InfoAccessParameterFooterCell{
    InfoAccessDetailViewController *father;
}

+ (CGFloat)viewHeight {
    return 100;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setupViews];
    }
    
    return self;
}

- (void)setupViews {
    
    //self.contentView.backgroundColor = [UIColor colorWithRed:252 / 255.0 green:253 / 255.0 blue:254 / 255.0 alpha:1];// #FCFDFE
    
    _infoBtn = ({
        UIButton *btn = [[UIButton alloc] init];
        [self.contentView addSubview:btn];
        [btn setTitle:@"确定" forState:UIControlStateNormal];
        [btn addTarget:father action:@selector(doCommand) forControlEvents:UIControlEventTouchDown];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView);
            make.right.equalTo(self.contentView).offset(-8);
        }];
        btn;
    });
}

-(void)setFather:(InfoAccessDetailViewController*)f{
    father = f;
}

@end

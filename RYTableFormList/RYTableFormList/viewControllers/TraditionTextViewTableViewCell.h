//
//  TraditionTextViewTableViewCell.h
//  RYTableFormList
//
//  Created by wwt on 16/1/15.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

/**
 *
 *  @author zhangzhujuan
 *
 */

#import <UIKit/UIKit.h>
#import "RYTableViewCell.h"

typedef NS_ENUM(NSUInteger, TableTextViewCellStyle) {
    TableTextViewCellStyleDefault,//填写详细地址之类的
    TableTextViewCellStyleRemarks,//填写备注信息之类的
    TableTextViewCellStyleComment,//填写评价信息之类的
};


@interface TraditionTextViewTableViewCell : RYTableViewCell

/*
 属性/控件
 */
@property (nonatomic, assign) TableTextViewCellStyle tableTextViewCellStyle;

+ (instancetype)initCellWithTableView:(UITableView*)tableView;

- (void)reloadData;

@end

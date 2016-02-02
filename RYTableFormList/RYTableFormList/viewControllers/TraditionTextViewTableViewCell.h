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
    TableTextViewCellStyleRemarks,//填写备注信息之类的
    TableTextViewCellStyleComment,//填写评价信息之类的
};

//传统TextView
@interface TraditionTextViewTableViewCell : RYTableViewCell <UITextViewDelegate>

/*
 属性/控件
 */
@property (nonatomic, assign) TableTextViewCellStyle tableTextViewCellStyle;

@property (nonatomic, strong) UIView       *titleView;
@property (nonatomic, strong) UIButton     *redImgBtn;
@property (nonatomic, strong) UILabel      *titleLabel;
@property (nonatomic, strong) UIView       *labelBotLine;
@property (nonatomic, strong) UIButton     *tipBtn;
@property (nonatomic, strong) UITextView   *inputTV;

/*
 方法
 */
+ (instancetype)initCellWithTableView:(UITableView*)tableView;

@end

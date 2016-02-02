//
//  TraditionOthersTableViewCell.h
//  RYTableFormList
//
//  Created by wwt on 16/1/15.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYTableViewCell.h"

typedef NS_ENUM(NSUInteger, TableViewCellStyle) {
   TableViewCellStyleRemarks,//填写备注信息之类的
};

//其他自定义视图
@interface TraditionCustomerTableViewCell : RYTableViewCell<UITextViewDelegate>

/*
 属性/控件
 */
@property (nonatomic, assign) TableViewCellStyle tableViewCellStyle;

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

//
//  TraditionDatePickerTableViewCell.h
//  RYTableFormList
//
//  Created by wwt on 16/1/15.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYTableViewCell.h"
#import "PickerView.h"

//传统日期空间
@interface TraditionPickersTableViewCell : RYTableViewCell

@property (nonatomic, strong) UILabel      *contentLabel;
@property (nonatomic, strong) UILabel      *unitLabel;

- (void)reloadData;

@end

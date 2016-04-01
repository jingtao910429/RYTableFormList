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
#import "ListFormModel.h"

//传统日期控件
@interface TraditionPickersTableViewCell : RYTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

- (void)reloadDataWithModel:(ListFormModel *)listFormModel;

@end

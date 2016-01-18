//
//  UIFactory.h
//  RYTableFormList
//
//  Created by wwt on 16/1/18.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class PickerView;

@interface UIFactory : NSObject

+ (instancetype)shareInstance;

@property (nonatomic, strong) PickerView *pickerView;

- (UITableViewCell *)getEntryCell:(UITableView *)tableView identifier:(NSString *)identifier;

@end

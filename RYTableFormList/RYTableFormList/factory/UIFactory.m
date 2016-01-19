//
//  UIFactory.m
//  RYTableFormList
//
//  Created by wwt on 16/1/18.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import "UIFactory.h"
#import "FormListHeader.h"
#import "PickerView.h"

@implementation UIFactory

+ (instancetype)shareInstance {
    
    static dispatch_once_t onceTaken;
    static UIFactory *shareInstance = nil;
    dispatch_once(&onceTaken, ^{
        shareInstance = [[UIFactory alloc] init];
    });
    
    return shareInstance;
}

- (UITableViewCell *)getEntryCell:(UITableView *)tableView identifier:(NSString *)identifier{
    
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!tableViewCell) {
        
        if ([tableView isKindOfClass:[TraditionDatePickerTableViewCell class]]) {
            tableViewCell = [[TraditionDatePickerTableViewCell alloc] init];
        }
        
    }
    
    return tableViewCell;
}

- (PickerView *)pickerView {
    
    if (!_pickerView) {
        _pickerView = [[PickerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_BOUND_WIDTH,SCREEN_BOUND_HEIGHT) delegate:nil type:PickerViewTypeNone];
        _pickerView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    }
    return _pickerView;
}

@end

//
//  RYTableViewCell.h
//  RYTableFormList
//
//  Created by wwt on 16/1/15.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYTableViewCellHeader.h"
#import "PickerView.h"
#import "ReloadContentProtocol.h"

//const NSInteger max_width = 125;
const static NSInteger max_width = 125;

@interface RYTableViewCell : UITableViewCell <ReloadContentProtocol,PickerViewDelegte>

//条目名称
@property (nonatomic, strong) UILabel *nameLabel;

//属性控制
@property (nonatomic, copy)   NSDictionary *contentLabelAttributesDict;
@property (nonatomic, copy)   NSDictionary *unitLabelAttributesDict;

//索引值（section * 1000 + row）
@property (nonatomic, assign) NSInteger index;

@property (nonatomic, copy)   NSString *itemName;
@property (nonatomic, copy)   NSString *content;
@property (nonatomic, copy)   NSString *unitContent;
@property (nonatomic, assign) UITableViewCellUnitType unitType;

- (RYTableViewCell *)initWithReuseIdentifier:(NSString *)string;

- (void)reloadData;

@end

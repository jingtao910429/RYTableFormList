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

@interface RYTableViewCell : UITableViewCell <PickerViewDelegte>

//属性控制
@property (nonatomic, copy)   NSDictionary *ownerContentLabelAttributesDict;
@property (nonatomic, copy)   NSDictionary *ownerUnitLabelAttributesDict;

//索引值（section * 1000 + row）
@property (nonatomic, assign) NSInteger index;

@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *unitContent;

- (RYTableViewCell *)initWithReuseIdentifier:(NSString *)string;

@end

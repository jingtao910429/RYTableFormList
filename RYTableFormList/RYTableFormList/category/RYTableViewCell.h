//
//  RYTableViewCell.h
//  RYTableFormList
//
//  Created by wwt on 16/1/15.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RYTableViewCell : UITableViewCell

- (RYTableViewCell *)initWithReuseIdentifier:(NSString *)string;

- (void)setAttributeNameLabel:(NSDictionary *)itemDict;

@end

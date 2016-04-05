//
//  TraditionSwitcherTableViewCell.h
//  RYTableFormList
//
//  Created by wwt on 16/1/15.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYTableViewCell.h"

@interface TraditionSwitcherTableViewCell : RYTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *switchNameLabel;
@property (weak, nonatomic) IBOutlet UISwitch *switchCompent;
- (IBAction)switchValueChanged:(id)sender;

@end

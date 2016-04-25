//
//  TraditionSwitcherTableViewCell.m
//  RYTableFormList
//
//  Created by wwt on 16/1/15.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import "TraditionSwitcherTableViewCell.h"

@implementation TraditionSwitcherTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
}

///ValueChanged_Method
- (IBAction)switchValueChanged:(id)sender {
    
    UISwitch *switchItem = (UISwitch *)sender;
    
    if (switchItem.on) {
        
    }else {
        
    }
    
}
@end

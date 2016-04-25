//
//  TraditionSliderTableViewCell.m
//  RYTableFormList
//
//  Created by wwt on 16/1/15.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import "TraditionSliderTableViewCell.h"

@implementation TraditionSliderTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

///ValueChanged_Method
- (IBAction)sliderValueChanged:(id)sender {
    
    UISlider *sliderItem = (UISlider *)sender;
    
    NSLog(@"测试数据 %f",sliderItem.value);
    
}
@end

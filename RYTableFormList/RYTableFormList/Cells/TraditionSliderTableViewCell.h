//
//  TraditionSliderTableViewCell.h
//  RYTableFormList
//
//  Created by wwt on 16/1/15.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYTableViewCell.h"

@interface TraditionSliderTableViewCell : RYTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *sliderNameLabel;
@property (weak, nonatomic) IBOutlet UISlider *sliderCompent;
- (IBAction)sliderValueChanged:(id)sender;

@end

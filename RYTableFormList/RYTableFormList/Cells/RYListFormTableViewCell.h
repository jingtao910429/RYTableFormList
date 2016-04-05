//
//  RYListFormTableViewCell.h
//  RYTableFormList
//
//  Created by wwt on 16/4/1.
//  Copyright © 2016年 rongyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FormListHeader.h"

@interface RYListFormTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet TraditionPickersTableViewCell *traditionPickersTableViewCell;
@property (weak, nonatomic) IBOutlet TraditionTextFieldTableViewCell *traditionTextFieldTableViewCell;
@property (weak, nonatomic) IBOutlet TraditionSliderTableViewCell *traditionSliderTableViewCell;
@property (weak, nonatomic) IBOutlet TraditionSwitcherTableViewCell *traditionSwitcherTableViewCell;

@property (weak, nonatomic) IBOutlet TraditionImageTableViewCell *traditionImageTableViewCell;
@end

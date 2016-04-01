//
//  RYListFormTableViewCell.h
//  RYTableFormList
//
//  Created by wwt on 16/4/1.
//  Copyright © 2016年 rongyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TraditionPickersTableViewCell.h"

@interface RYListFormTableViewCell : UITableViewCell

///传统Picker弹出样式
@property (weak, nonatomic) IBOutlet TraditionPickersTableViewCell *traditionPickersTableViewCell;

@end

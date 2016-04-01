//
//  RYTableViewCell.m
//  RYTableFormList
//
//  Created by wwt on 16/1/15.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import "RYTableViewCell.h"
#import "RunTimeTool.h"
#import <objc/runtime.h>


@interface RYTableViewCell ()

@end

@implementation RYTableViewCell

- (RYTableViewCell *)initWithReuseIdentifier:(NSString *)string {
    
    if ([super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string]) {
        
        if ([self conformsToProtocol:@protocol(ReloadContentProtocol)]) {
            [self createSubviews];
        }else {
            NSAssert(0, @"子类必须要实现APIManager这个protocol。");
        }
    }
    
    return self;
}

- (void)createSubviews {
    /*
    [self.contentView addSubview:self.nameLabel];
    [[RunTimeTool shareInstance] setUIAttributeWithInstance:self.nameLabel attributes:[[RunTimeTool shareInstance] attributes]];
    [self setNeedsDisplay];
     */
}

#pragma mark UI和数据刷新

- (void)reloadData {
    
    /*
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:15]};
    
    CGSize size = [self.itemName boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, self.frame.size.height) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    //方法废弃DEPRECATED
    //CGSize size = [self.itemName sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(CGFLOAT_MAX, self.frame.size.height) lineBreakMode:NSLineBreakByWordWrapping];
    
    self.nameLabel.frame = CGRectMake(LEFT_SPACE, 0, size.width > max_width ? max_width : size.width, self.frame.size.height);
    
    self.nameLabel.text = self.itemName;
     */
}

- (void)reloadUI {
    
}

#pragma mark PickerViewDelegte

- (void)confirmSelectItem:(NSString *)value index:(NSInteger)index {
    
}

#pragma mark getters & setters

//- (UILabel *)nameLabel {
//    if (!_nameLabel) {
//        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_SPACE, 0, TITLE_LABEL_WIDTH + 20, self.frame.size.height)];
//        _nameLabel.font = [UIFont systemFontOfSize:15];
//        _nameLabel.textColor = [UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1.0f];
//        _nameLabel.textAlignment = NSTextAlignmentLeft;
//        _nameLabel.numberOfLines = 2;
//        
//    }
//    return _nameLabel;
//}

@end

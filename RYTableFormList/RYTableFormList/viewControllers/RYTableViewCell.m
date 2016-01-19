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

//用static修饰后，不能提供外界访问
//static const NSString *className = @"NameLabel";
//const NSString *baseNameLabel = @"NameLabel";

@interface RYTableViewCell ()

@property (nonatomic, strong) UILabel *nameLabel;

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
    
    [self.contentView addSubview:self.nameLabel];
    [[RunTimeTool shareInstance] setUIAttributeWithInstance:self.nameLabel attributes:[[RunTimeTool shareInstance] attributes]];
    [self setNeedsDisplay];
}

#pragma mark

#pragma mark PickerViewDelegte

- (void)confirmSelectItem:(NSString *)value index:(NSInteger)index {
    
}

#pragma mark getters & setters

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_SPACE, 0, TITLE_LABEL_WIDTH, self.frame.size.height)];
        
    }
    return _nameLabel;
}

@end

//
//  TraditionDatePickerTableViewCell.m
//  RYTableFormList
//
//  Created by wwt on 16/1/15.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import "TraditionPickersTableViewCell.h"
#import "RunTimeTool.h"
#import "UIFactory.h"
#import "PickerView+PickerViewMethod.h"

@interface TraditionPickersTableViewCell ()

@end

@implementation TraditionPickersTableViewCell

- (TraditionPickersTableViewCell *)initWithUnitType:(UITableViewCellUnitType)unitType content:(NSString *)pContent unitContent:(NSString *)pUnitContent {
    
    self.content = pContent;
    
    switch (unitType) {
        case UITableViewCellUnitTypeHave:{
            self.unitContent = pUnitContent;
        }
            break;
        case UITableViewCellUnitTypeNone:{
            self.unitContent = @"";
        }
            break;
        default:
            break;
    }
    
    self = [self init];
    
    if (self) {
        
        [self createSubviewsWithUnitType:unitType];
        
    }
    
    return self;
}

- (TraditionPickersTableViewCell *)init {
    
    if ([super initWithReuseIdentifier:@"TraditionDatePickerElement"]){
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.unitLabel];
    }
    return self;
}

- (void)createSubviewsWithUnitType:(UITableViewCellUnitType)unitType {
    
    [super layoutSubviews];
    
    self.contentLabelAttributesDict = @{
                                             @"text":self.content,
                                             @"textColor":[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0f],
                                             @"textAlignment":@(NSTextAlignmentRight),
                                             @"tag":@(CONTENTLABEL_TAG),
                                             @"font":[UIFont systemFontOfSize:14]
                                             };
    
    if (unitType == UITableViewCellUnitTypeNone) {
        
        self.unitLabelAttributesDict = nil;
        
    }else {
        
        CGRect frame = _contentLabel.frame;
        frame.origin.x -= (SINGLE_LETTER_WIDTH * ((NSString *)self.unitContent).length + 5);
        self.contentLabel.frame = frame;
        
        self.unitLabelAttributesDict = @{
                                              @"text":self.unitContent,
                                              @"textAlignment":@(NSTextAlignmentRight),
                                              @"numberOfLines":@(1),
                                              @"font":[UIFont systemFontOfSize:15],
                                              @"textColor":[UIColor blackColor],
                                              @"tag":@(UNITCONTENT_TAG)};
    }
    
    if (self.contentLabelAttributesDict) {
        [[RunTimeTool shareInstance] setUIAttributeWithInstance:_contentLabel attributes:self.contentLabelAttributesDict];
    }
    
    if (self.unitLabelAttributesDict) {
        [[RunTimeTool shareInstance] setUIAttributeWithInstance:_unitLabel attributes:self.unitLabelAttributesDict];
    }
    
    [self setNeedsLayout];
}

#pragma mark getters & setters

- (UILabel *)contentLabel {
    
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.frame = CGRectMake (LEFT_SPACE + GAP, 0, SCREEN_BOUND_WIDTH - (LEFT_SPACE + GAP + RIGHT_SPACE) - BETWEEN_CONTENTLABEL_UNITLABEL_SPACE, self.frame.size.height);
    }
    return _contentLabel;
}

- (UILabel *)unitLabel {
    if (!_unitLabel) {
        _unitLabel = [[UILabel alloc] init];
        _unitLabel.frame = CGRectMake(_contentLabel.frame.origin.x + _contentLabel.frame.size.width + BETWEEN_CONTENTLABEL_UNITLABEL_SPACE, 0, SINGLE_LETTER_WIDTH * self.unitContent.length, self.frame.size.height);
    }
    return _unitLabel;
}

@end

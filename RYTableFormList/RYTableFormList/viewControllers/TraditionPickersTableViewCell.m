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

- (TraditionPickersTableViewCell *)init {
    
    if ([super initWithReuseIdentifier:@"TraditionDatePickerElement"]){
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.unitLabel];
        
    }
    return self;
}

#pragma mark 数据刷新

- (void)reloadData {
    
    [super reloadData];
    
    self.contentLabelAttributesDict = @{
                                        @"text":self.content,
                                        @"textColor":[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0f],
                                        @"textAlignment":@(NSTextAlignmentRight),
                                        @"tag":@(CONTENTLABEL_TAG),
                                        @"font":[UIFont systemFontOfSize:14]
                                        };
    
    if (self.unitType == UITableViewCellUnitTypeNone) {
        
        self.unitLabelAttributesDict = nil;
        
        _contentLabel.frame = CGRectMake (LEFT_SPACE + GAP, 0, SCREEN_BOUND_WIDTH - (LEFT_SPACE + GAP + RIGHT_SPACE) - BETWEEN_CONTENTLABEL_UNITLABEL_SPACE, self.frame.size.height);
        
    }else {
        
        //判断状态改变frame
        if (_contentLabel.frame.origin.x == LEFT_SPACE + GAP) {
            CGRect frame = _contentLabel.frame;
            frame.origin.x -= (SINGLE_LETTER_WIDTH * ((NSString *)self.unitContent).length + 5);
            _contentLabel.frame = frame;
        }
        
        self.unitLabelAttributesDict = @{
                                         @"text":self.unitContent,
                                         @"textAlignment":@(NSTextAlignmentRight),
                                         @"numberOfLines":@(1),
                                         @"font":[UIFont systemFontOfSize:15],
                                         @"textColor":[UIColor blackColor],
                                         @"tag":@(UNITCONTENT_TAG)};
    }
    
    if (self.contentLabelAttributesDict) {
        [[RunTimeTool shareInstance] setUIAttributeWithInstance:self.contentLabel attributes:self.contentLabelAttributesDict];
    }
    
    if (self.unitLabelAttributesDict) {
        [[RunTimeTool shareInstance] setUIAttributeWithInstance:self.unitLabel attributes:self.unitLabelAttributesDict];
    }
    
    [self setNeedsLayout];
    
}

#pragma mark getters & setters

- (UILabel *)contentLabel {
    
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.frame = CGRectMake (LEFT_SPACE + GAP, 0, SCREEN_BOUND_WIDTH - (LEFT_SPACE + GAP + RIGHT_SPACE) - BETWEEN_CONTENTLABEL_UNITLABEL_SPACE, self.frame.size.height);
        _contentLabel.numberOfLines = 2;
    }
    return _contentLabel;
}

- (UILabel *)unitLabel {
    if (!_unitLabel) {
        _unitLabel = [[UILabel alloc] init];
    }
    _unitLabel.frame = CGRectMake(_contentLabel.frame.origin.x + _contentLabel.frame.size.width + BETWEEN_CONTENTLABEL_UNITLABEL_SPACE, 0, SINGLE_LETTER_WIDTH * self.unitContent.length, self.frame.size.height);
    return _unitLabel;
}

@end

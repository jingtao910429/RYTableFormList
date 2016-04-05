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

const NSInteger left_max_width = 145;

@interface TraditionPickersTableViewCell ()
//
//@property (nonatomic, assign) CGRect contentLabelFrame;
//
//@property (nonatomic, strong) UILabel      *contentLabel;
//@property (nonatomic, strong) UILabel      *unitLabel;

@end

@implementation TraditionPickersTableViewCell

//- (TraditionPickersTableViewCell *)init {
//    
//    if ([super initWithReuseIdentifier:@"TraditionDatePickerElement"]){
//        
//        [self initData];
//        [self.contentView addSubview:self.contentLabel];
//        [self.contentView addSubview:self.unitLabel];
//        
//    }
//    return self;
//}

#pragma mark private method

//- (void)initData {
//    
//    self.selectionStyle = UITableViewCellSelectionStyleNone;
//    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    self.contentLabelFrame = CGRectMake (LEFT_SPACE + GAP + left_max_width, 0, SCREEN_BOUND_WIDTH - (LEFT_SPACE + GAP + RIGHT_SPACE) - BETWEEN_CONTENTLABEL_UNITLABEL_SPACE - left_max_width, self.frame.size.height);
//    
//}

#pragma mark 数据刷新

- (void)reloadDataWithModel:(ListFormModel *)listFormModel {
    
    [super reloadData];
    
    self.contentLabelAttributesDict = @{
                                        @"text"         :listFormModel.name_value,
                                        @"textColor"    :[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0f],
                                        @"textAlignment":@(NSTextAlignmentRight),
                                        @"tag"          :@(CONTENTLABEL_TAG),
                                        @"font"         :[UIFont systemFontOfSize:14]
                                        };
    
    if (self.unitType == UITableViewCellUnitTypeNone) {
        
        self.unitLabelAttributesDict = nil;
        
    }else {
        
        self.unitLabelAttributesDict = @{
                                         @"text"         :listFormModel.content_value,
                                         @"textAlignment":@(NSTextAlignmentRight),
                                         @"numberOfLines":@(1),
                                         @"font"         :[UIFont systemFontOfSize:15],
                                         @"textColor"    :[UIColor blackColor],
                                         @"tag"          :@(UNITCONTENT_TAG)};
    }
    
    if (self.contentLabelAttributesDict) {
        [[RunTimeTool shareInstance] setUIAttributeWithInstance:self.valueLabel attributes:self.contentLabelAttributesDict];
    }
    
//    if (self.unitLabelAttributesDict) {
//        [[RunTimeTool shareInstance] setUIAttributeWithInstance:self.unitLabel attributes:self.unitLabelAttributesDict];
//    }
    
}

#pragma mark getters & setters

//- (UILabel *)contentLabel {
//    
//    if (!_contentLabel) {
//        _contentLabel = [[UILabel alloc] init];
//        _contentLabel.frame = _contentLabelFrame;
//    }
//    return _contentLabel;
//}
//
//- (UILabel *)unitLabel {
//    if (!_unitLabel) {
//        _unitLabel = [[UILabel alloc] init];
//    }
//    _unitLabel.frame = CGRectMake(_contentLabel.frame.origin.x + _contentLabel.frame.size.width + BETWEEN_CONTENTLABEL_UNITLABEL_SPACE, 0, SINGLE_LETTER_WIDTH * self.unitContent.length, self.frame.size.height);
//    return _unitLabel;
//}

@end

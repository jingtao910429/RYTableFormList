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
static const NSString *className = @"NameLabel";
const NSString *baseNameLabel = @"NameLabel";

@interface RYTableViewCell ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, copy) NSDictionary *attributes;

@end

@implementation RYTableViewCell

- (RYTableViewCell *)init {
    self = [self initWithReuseIdentifier:@"RYTableViewElement"];
    if (!self){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createSubviews];
    }
    return self;
}

- (RYTableViewCell *)initWithReuseIdentifier:(NSString *)string {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    return self;
}

- (void)createSubviews {
    
    [self.contentView addSubview:self.nameLabel];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //自定义设置cell属性
    [self layoutSubviewsInsideBounds:self.contentView.bounds];
    
}

- (void)layoutSubviewsInsideBounds:(CGRect)bounds {
    
    NSLog(@"自定义cell公共属性");
    [[RunTimeTool shareInstance] setUIAttributeWithInstance:self.nameLabel attributes:[[RunTimeTool shareInstance] attributes]];
}

#pragma mark getters & setters

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        
        //默认属性
        _nameLabel.textColor = [UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1.0f];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.numberOfLines = 2;
    }
    return _nameLabel;
}

//默认属性值
- (NSDictionary *)attributes {
    return @{
             @"textColor":[UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1.0f],
             @"textAlignment":@(NSTextAlignmentLeft),
             @"font":[UIFont systemFontOfSize:15],
             @"numberOfLines":@(2)
             };
}

@end

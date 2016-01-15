//
//  RYTableViewCell.m
//  RYTableFormList
//
//  Created by wwt on 16/1/15.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import "RYTableViewCell.h"
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
    [self setUIAttributeWithInstance:self.nameLabel attributes:self.attributes];
}

#pragma mark runtime设置nameLabel属性

- (void)setAttributeNameLabel:(NSDictionary *)itemDict {
    
    NSDictionary *attributesDict = itemDict;
    
    const char * className = [baseNameLabel cStringUsingEncoding:NSASCIIStringEncoding];
    
    Class nameLabelClass = objc_getClass(className);
    
    if (!nameLabelClass) {
        // 创建一个类
        Class superClass = [NSObject class];
        nameLabelClass = objc_allocateClassPair(superClass, className, 0);
        // 注册类
        objc_registerClassPair(nameLabelClass);
        
        attributesDict = self.attributes;
    }
    
    id instance = [[nameLabelClass alloc] init];
    
    [self setUIAttributeWithInstance:instance attributes:attributesDict];
    
}

/**
 *  遍历赋值
 *
 *  @param instance   实例变量
 *  @param attributes 属性列表
 */

- (void)setUIAttributeWithInstance:(id)instance attributes:(NSDictionary *)attributes {
    
    [attributes enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        if ([self checkIsExistPropertyWithInstance:instance verifyPropertyName:key]) {
            //利用kvc赋值
            [instance setValue:key forKey:attributes[key]];
            
        }
        
    }];
    
}

/**
 *  检测对象是否存在该属性
 *
 *  @param instance           实例变量
 *  @param verifyPropertyName 需要检测的属性值
 *
 *  @return BOOL
 */

- (BOOL)checkIsExistPropertyWithInstance:(id)instance verifyPropertyName:(NSString *)verifyPropertyName {
    
    unsigned int outCount ;
    
    objc_property_t *properties = class_copyPropertyList([instance class], &outCount);
    
    for (int i = 0; i < outCount; i ++) {
        
        objc_property_t property = properties[i];
        
        //  属性名转成字符串
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        // 判断该属性是否存在
        
        if ([propertyName isEqualToString:verifyPropertyName]) {
            free(properties);
            return YES;
        }
        
    }
    free(properties);
    return NO;
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

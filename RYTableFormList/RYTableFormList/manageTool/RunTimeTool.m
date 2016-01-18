//
//  RunTimeTool.m
//  RYTableFormList
//
//  Created by wwt on 16/1/18.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import "RunTimeTool.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

@interface RunTimeTool ()



@end

@implementation RunTimeTool

+ (instancetype)shareInstance {
    
    static dispatch_once_t onceTaken;
    static RunTimeTool *shareInstance = nil;
    dispatch_once(&onceTaken, ^{
        shareInstance = [[RunTimeTool alloc] init];
    });
    
    return shareInstance;
}

#pragma mark runtime设置UI属性

- (void)setAttributeUI:(NSDictionary *)itemDict className:(NSString *)className {
    
    NSDictionary *attributesDict = itemDict;
    
    const char * tempClassName = [className cStringUsingEncoding:NSASCIIStringEncoding];
    
    Class nameLabelClass = objc_getClass(tempClassName);
    
    if (!nameLabelClass) {
        // 创建一个类
        Class superClass = [NSObject class];
        nameLabelClass = objc_allocateClassPair(superClass, tempClassName, 0);
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

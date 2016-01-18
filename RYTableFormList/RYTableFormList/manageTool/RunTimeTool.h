//
//  RunTimeTool.h
//  RYTableFormList
//
//  Created by wwt on 16/1/18.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RunTimeTool : NSObject

@property (nonatomic, copy) NSDictionary *attributes;

+ (instancetype)shareInstance;

- (void)setAttributeUI:(NSDictionary *)itemDict className:(NSString *)className;

/**
 *  遍历赋值
 *
 *  @param instance   实例变量
 *  @param attributes 属性列表
 */

- (void)setUIAttributeWithInstance:(id)instance attributes:(NSDictionary *)attributes;


/**
 *  检测对象是否存在该属性
 *
 *  @param instance           实例变量
 *  @param verifyPropertyName 需要检测的属性值
 *
 *  @return BOOL
 */

- (BOOL)checkIsExistPropertyWithInstance:(id)instance verifyPropertyName:(NSString *)verifyPropertyName;
@end

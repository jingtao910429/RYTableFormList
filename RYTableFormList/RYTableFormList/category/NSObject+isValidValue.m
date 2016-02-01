//
//  NSObject+isValidValue.m
//  RYTableFormList
//
//  Created by wwt on 16/2/1.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import "NSObject+isValidValue.h"

@implementation NSObject (isValidValue)

- (BOOL)isValideValue {
    
    if (!self || [self isKindOfClass:[NSNull class]]) {
        return NO;
    }
    
    if (([self isKindOfClass:[NSArray class]] || [self isKindOfClass:[NSDictionary class]]) && 0 == [(NSArray *)self count]) {
        return NO;
    }
    
    if ([self isKindOfClass:[NSString class]] && 0 == [(NSString *)self length]) {
        return NO;
    }
    
    return YES;
}

@end

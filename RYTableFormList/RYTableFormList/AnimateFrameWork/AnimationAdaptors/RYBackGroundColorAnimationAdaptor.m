//
//  RYBackGroundColorAnimationAdaptor.m
//  RYTableFormList
//
//  Created by wwt on 16/1/19.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import "RYBackGroundColorAnimationAdaptor.h"

@implementation RYBackGroundColorAnimationAdaptor

- (CAAnimation*)animation {
    CABasicAnimation *backGroundColorAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    backGroundColorAnimation.duration = [self animationDuration:0.5];
    backGroundColorAnimation.autoreverses = NO;
    //如果是颜色变化，必须是KeyPath:@"backgroundColor"，而且，fromValue和toValue必须是CGColor
    
    UIColor *startColor = _isVerse ? [UIColor colorWithRed:.0 green:.0 blue:.0 alpha:0.6] : [UIColor clearColor];
    UIColor *endColor = _isVerse ? [UIColor clearColor] : [UIColor colorWithRed:.0 green:.0 blue:.0 alpha:0.6];
    
    backGroundColorAnimation.fromValue = (id)startColor.CGColor;
    backGroundColorAnimation.toValue = (id)endColor.CGColor;
    return backGroundColorAnimation;
}

@end

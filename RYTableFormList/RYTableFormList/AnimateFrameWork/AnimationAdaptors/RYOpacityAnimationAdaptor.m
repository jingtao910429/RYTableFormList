//
//  RYOpacityAnimationAdaptor.m
//  RYTableFormList
//
//  Created by wwt on 16/1/19.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import "RYOpacityAnimationAdaptor.h"

@implementation RYOpacityAnimationAdaptor

-(CAAnimation*)animation{
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = [self animationDuration:0.5];
    opacityAnimation.autoreverses = YES;
    opacityAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.6];
    opacityAnimation.fillMode = kCAFillModeBoth;
    
    return opacityAnimation;
}

@end

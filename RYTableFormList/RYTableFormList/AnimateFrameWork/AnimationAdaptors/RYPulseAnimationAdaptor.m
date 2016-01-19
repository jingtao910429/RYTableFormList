//
//  RYPulseAnimationAdaptor.m
//  RYAnimationDemo
//
//  Created by rongyu100 on 6/11/15.
//  Copyright (c) 2015 RY100. All rights reserved.
//

#import "RYPulseAnimationAdaptor.h"

@implementation RYPulseAnimationAdaptor

-(CAAnimation*)animation{
    CABasicAnimation *pulseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulseAnimation.duration = [self animationDuration:1];
    pulseAnimation.toValue = [NSNumber numberWithFloat:self.toValue];
    pulseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulseAnimation.autoreverses = YES;
    pulseAnimation.repeatCount = FLT_MAX;
    pulseAnimation.speed = self.speed;
    pulseAnimation.removedOnCompletion = YES;
    
    return pulseAnimation;
}

@end

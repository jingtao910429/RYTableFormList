//
//  RYRotationAnimationAdaptor.m
//  RYAnimationDemo
//
//  Created by rongyu100 on 6/11/15.
//  Copyright (c) 2015 RY100. All rights reserved.
//

#import "RYRotationAnimationAdaptor.h"

@implementation RYRotationAnimationAdaptor

-(CAAnimation*)animation{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: -1 * 2.0 * M_PI];
    rotationAnimation.duration = [self animationDuration:2];
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = FLT_MAX;
    rotationAnimation.removedOnCompletion = YES;

    return rotationAnimation;
}

@end

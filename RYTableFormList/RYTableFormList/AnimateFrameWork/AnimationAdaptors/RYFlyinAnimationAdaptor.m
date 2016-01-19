//
//  RYFlyinAnimationAdaptor.m
//  RYAnimationDemo
//
//  Created by rongyu100 on 6/11/15.
//  Copyright (c) 2015 RY100. All rights reserved.
//

#import "RYFlyinAnimationAdaptor.h"

@implementation RYFlyinAnimationAdaptor

-(CAAnimation*)animation{
    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    group.animations = @[[self positionAnimation],
                                  [self opacityAnimation]];
    group.removedOnCompletion = YES;
    group.repeatCount = 1;
    group.beginTime = [self animationBeginTime];
    group.duration = [self animationDuration:2];
    group.delegate = self;
    
    return group;
}

-(CAAnimation*)positionAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.duration = [self animationDuration:1.5];
    animation.fromValue = [NSValue valueWithCGPoint:self.targetView.center];
    animation.toValue = [NSValue valueWithCGPoint:self.endPoint];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    return animation;
}

-(CAAnimation*)opacityAnimation {
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = [self animationDuration:1.5];
    opacityAnimation.autoreverses = YES;
    opacityAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.0];
    opacityAnimation.fillMode = kCAFillModeBoth;
    return opacityAnimation;
}


@end

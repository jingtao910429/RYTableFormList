//
//  RYMoveAnimationAdaptor.m
//  RYTableFormList
//
//  Created by wwt on 16/1/19.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import "RYMoveAnimationAdaptor.h"
#import "FormListHeader.h"

@implementation RYMoveAnimationAdaptor

- (CAAnimation *)animation {
    
    CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAnimation.duration = [self animationDuration:0.5];
    
    CGPoint startPoint = _isVerse ? _endPoint : _startPoint;
    CGPoint endPoint = _isVerse ? _startPoint : _endPoint;
    
    moveAnimation.fromValue = [NSValue valueWithCGPoint:startPoint];
    moveAnimation.toValue = [NSValue valueWithCGPoint:endPoint];
    moveAnimation.autoreverses = NO;
    moveAnimation.fillMode = kCAFillModeBoth;
    
    return moveAnimation;
    
}

@end

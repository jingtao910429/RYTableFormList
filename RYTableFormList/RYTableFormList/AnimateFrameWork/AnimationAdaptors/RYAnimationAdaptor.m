//
//  RYAnimationAdaptor.m
//  RYAnimationDemo
//
//  Created by rongyu100 on 6/11/15.
//  Copyright (c) 2015 RY100. All rights reserved.
//

#import "RYAnimationAdaptor.h"

@implementation RYAnimationAdaptor

- (id)init {
    self = [super init];
    if(self) {
        [self setup];
    }
    return self;
}

- (void)play {
//    [self stop];
    [self beforeAnimation];
    [self commit];
    [self afterAnimation];
}

- (void)commit {
    CAAnimation *animation = [self animation];
    if(animation) {
        animation.delegate = self;

        if(!self.key)
            self.key = [NSString stringWithFormat:@"rk_%ld", (random() % 1000)];
        [self.targetView.layer addAnimation:animation forKey:self.key];
        self.isStop = NO;
    }
}

- (void)stop{
    CAAnimation *animation = [self animation];
    if(animation) {
        animation.delegate = nil;
        [self.targetView.layer removeAllAnimations];
        self.alwaysRestartAnimation = NO;
        self.isStop = YES;
    }
}

- (void)setup{
    self.alwaysRestartAnimation = NO;
    self.animationFactor = 1.0f;
    self.speed = 1.0f;
    self.delayInSeconds = 1.0f;
    self.isStop = YES;
}

- (CGFloat)animationDuration:(CGFloat)duration{
    return duration * self.animationFactor;
}

- (CGFloat)animationBeginTime{
    return CACurrentMediaTime() + self.delayInSeconds;
}

#pragma mark - Implemented by subclass

- (CAAnimation *)animation{
    return nil;
}

- (void)drawAnimation:(CGContextRef)context{
    
}

- (void)beforeAnimation{
    
}

- (void)afterAnimation{
    
}

- (void)didAnimation{
    if (self.nextAnimation) {
        self.nextAnimation.targetView = self.targetView;
        [self.nextAnimation play];
    }
    
    if (self.alwaysRestartAnimation) {
        [self play];
    }
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStart:(CAAnimation *)theAnimation{
    [self beforeAnimation];
    if (self.delegate && [self.delegate respondsToSelector:@selector(animationDidStart:)]) {
        [self.delegate animationDidStart:self];
    }
}

- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag{
    [self didAnimation];
    if (self.delegate && [self.delegate respondsToSelector:@selector(animationDidStop:finished:)]) {
        [self.delegate animationDidStop:self finished:flag];
    }
}

#pragma mark - Help
- (void)log:(NSString*)msg{

}

@end

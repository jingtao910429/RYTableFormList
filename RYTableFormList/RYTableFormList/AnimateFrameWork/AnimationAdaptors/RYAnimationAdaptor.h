//
//  RYAnimationAdaptor.h
//  RYAnimationDemo
//
//  Created by rongyu100 on 6/11/15.
//  Copyright (c) 2015 RY100. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class RYAnimationAdaptor;

@protocol RYAnimationAdaptorDelegate <NSObject>

/* Called when the animation begins its active duration. */

- (void)animationDidStart:(RYAnimationAdaptor *)animAdaptor;

/* Called when the animation either completes its active duration or
 * is removed from the object it is attached to (i.e. the layer). 'flag'
 * is true if the animation reached the end of its active duration
 * without being removed. */

- (void)animationDidStop:(RYAnimationAdaptor *)animAdaptor finished:(BOOL)flag;


@end

@interface RYAnimationAdaptor : NSObject

@property (nonatomic, weak) UIView *targetView;
@property (nonatomic, copy) NSString *key;
@property (nonatomic, assign) BOOL alwaysRestartAnimation;
@property (nonatomic, assign) BOOL isStop;

/* The delegate of the animation. */
@property(strong) id delegate;
// animation could be play one by one
@property (nonatomic, strong) RYAnimationAdaptor *nextAnimation;

// factor used to control animation speed, default 1.0
@property (nonatomic, assign) CGFloat animationFactor;

@property (nonatomic, assign) CGFloat speed;
@property (nonatomic, assign) CGFloat delayInSeconds;

- (void)play;
- (void)commit;
- (void)stop;

- (CGFloat)animationDuration:(CGFloat)duration;
- (CGFloat)animationBeginTime;

- (void)setup;
/*
 * implemented by subclass
 */

- (CAAnimation *)animation;
- (void)drawAnimation:(CGContextRef)context;

- (void)beforeAnimation;
- (void)afterAnimation;
- (void)didAnimation;

@end

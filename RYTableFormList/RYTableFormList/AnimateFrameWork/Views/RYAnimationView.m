//
//  RYAnimationView.m
//  RYAnimationDemo
//
//  Created by rongyu100 on 6/11/15.
//  Copyright (c) 2015 RY100. All rights reserved.
//

#import "RYAnimationView.h"
#import "RYAnimationAdaptor.h"

@interface RYAnimationView ()
@property (nonatomic, strong) NSMutableArray *animations;
@end


@implementation RYAnimationView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setup];
    }
    return self;
}

- (void)setup
{
    [self setBackgroundColor:[UIColor clearColor]];
    self.animations = [NSMutableArray array];
}

-(void)addSubview:(UIView *)view animationAdaptor:(RYAnimationAdaptor*)adaptor{
    if (view) {
        [super addSubview:view];
        
        if (adaptor) {
            adaptor.targetView = view;
            [adaptor play];
            
            [self.animations addObject:adaptor];
        }
    }
}

-(void)startAllAnimation{
    for (RYAnimationAdaptor *adapter in self.animations) {
        [adapter play];
    }
}

-(void)stopAllAnimation{
    for (RYAnimationAdaptor *adapter in self.animations) {
        [adapter stop];
    }
}

-(void)clear{
    for (UIView *subView in self.subviews) {
        [subView removeFromSuperview];
    }
    
    for (RYAnimationAdaptor *adapter in self.animations) {
        [adapter stop];
    }
}
@end

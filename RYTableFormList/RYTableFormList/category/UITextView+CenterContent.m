//
//  UITextView+CenterContent.m
//  RYTableFormList
//
//  Created by zzj on 16/2/3.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import "UITextView+CenterContent.h"

@implementation UITextView (CenterContent)

- (void)verticalSet {
    
    [self addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];//也可以监听contentSize属性
    
}

//接收处理
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    UITextView *mTrasView = object;
    
    CGFloat topCorrect = ([mTrasView bounds].size.height - [mTrasView contentSize].height);
    
    topCorrect = (topCorrect <0.0 ? 0.0 : topCorrect);
    
    mTrasView.contentOffset = (CGPoint){.x =0, .y = -topCorrect/2};
    
}

// kvc机制
- (void)dealloc {
    
    [self removeObserver:self forKeyPath:@"contentSize" context:nil];
    
}

@end

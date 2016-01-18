//
//  PickerView.h
//  RYTableFormList
//
//  Created by wwt on 16/1/18.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PickerViewType){
    
    PickerViewTypeDate    = 3,
    PickerViewTypeAddress = 5,
    PickerViewTypeNormal  = 7,
    PickerViewTypeNone    = 11
    
};


@protocol PickerViewDelegte <NSObject>

@required
- (void)confirmSelectItem:(NSString *)value index:(NSInteger)index;

@end

@interface PickerView : UIView

@property (nonatomic, strong) UIView *backGroundView;

- (instancetype)initWithFrame:(CGRect)frame delegate:(id <PickerViewDelegte> )delegate type:(PickerViewType)pickerViewType;

/**
 *  animationStart(动画开始) animationStop(动画结束)
 */

- (void)animationStart;
- (void)animationStop;

/**
 *  重新加载视图
 */

- (void)reloadData;

@end

//
//  PickerView.h
//  RYTableFormList
//
//  Created by wwt on 16/1/18.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  弹出控件类型
 */
typedef NS_ENUM(NSInteger, PickerViewType){
    /**
     *  日期 （1～6级）
     */
    PickerViewTypeDate    = 3,
    /**
     *  地址（省市县）（默认三级）
     */
    PickerViewTypeAddress = 5,
    /**
     *  普通（值数组）（1～4 暂定最高为4级）
     */
    PickerViewTypeNormal  = 7,
    /**
     *  无
     */
    PickerViewTypeNone    = 11
};

/**
 *  日期空间类型
 */
typedef NS_ENUM(NSInteger, PickerViewTypeDateType){
    /**
     *  显示年
     */
    PickerViewTypeDateTypeY      = 1,
    /**
     *  显示年月
     */
    PickerViewTypeDateTypeYM     = 2,
    /**
     *  显示年月日
     */
    PickerViewTypeDateTypeYMD    = 3,
    /**
     *  显示年月日，小时
     */
    PickerViewTypeDateTypeYMDH   = 4,
    /**
     *  显示年月日，小时、分钟
     */
    PickerViewTypeDateTypeYMDHM  = 5,
    /**
     *  显示年月日，小时、分钟、秒
     */
    PickerViewTypeDateTypeYMDHMS = 6,
};

/**
 *  普通类型（1～4级）
 */
typedef NS_ENUM(NSInteger, PickerViewNormalType){
    /**
     *  单值（如有、无）
     */
    PickerViewNormalTypeOne   = 1,
    /**
     *  多值 －－－ 暂时闲置
     */
    PickerViewNormalTypeTwo   = 2,
    /**
     *  业务决定（本例子三级行业）
     */
    PickerViewNormalTypeThree = 3,
    /**
     *  业务决定（本例子四级行业）
     */
    PickerViewNormalTypeFour  = 4
};

/**
 *  弹出控件代理
 */

@protocol PickerViewDelegte <NSObject>

@required

/**
 *  选中值，回传索引和结果，如果需要序号对应，则直接返回正确值
 *
 *  @param value 值
 *  @param index 索引
 */
- (void)confirmSelectItem:(NSString *)value index:(NSInteger)index;

@end

@interface PickerView : UIView

- (instancetype)initWithFrame:(CGRect)frame delegate:(id <PickerViewDelegte> )delegate type:(PickerViewType)pickerViewType;

/**
 *  animationStart(动画开始) 
 *  animationStop (动画结束)
 */

- (void)animationStart;
- (void)animationStop;

/**
 *  重新加载视图
 */

- (void)reloadData;

@end

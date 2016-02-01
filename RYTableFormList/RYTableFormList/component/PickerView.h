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
     *  Display Date type （one to six level）
     */
    PickerViewTypeDate    = 3,
    /**
     *  Display Address（province, city, country）（Default three level）
     */
    PickerViewTypeAddress = 5,
    /**
     *  Display Normal（value Array）（One to Four level, tentative Highest four level）
     */
    PickerViewTypeNormal  = 7,
    /**
     *  None
     */
    PickerViewTypeNone    = 11
};

/**
 *  日期空间类型,是用系统UIDatePickerMode类型
 *
 */
typedef NS_ENUM(NSInteger, PickerViewDateMode){
    /**
     *  Displays month, day, and year depending on the locale setting (e.g. November | 15 | 2007)
     */
    PickerViewDateModeDateOnly           = 1,
    /**
     *  Displays date, hour, minute, and optionally AM/PM designation depending on the locale setting (e.g. Wed Nov 15 | 6 | 53 | PM)
     */
    PickerViewDateModeDateAndTime    = 2,
    /**
     *  Displays hour, minute, and optionally AM/PM designation depending on the locale setting (e.g. 6 | 53 | PM)
     */
    PickerViewDateModeTime   = 3,
    /**
     *  Displays hour and minute (e.g. 1 | 53)
     */
    PickerViewDateModeCountDownTimer  = 4,
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

//Picker数据源，根据不同类型，数据源数据结构可能有所变化
@property (nonatomic, strong) NSMutableArray *dataSource;

//弹出控件类型
@property (nonatomic, assign) PickerViewType       popUpPickerViewType;
//日期类弹出视图类型
@property (nonatomic, assign) PickerViewDateMode   datePickerViewMode;
//普通类弹出视图类型
@property (nonatomic, assign) PickerViewNormalType normalPickerViewType;

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

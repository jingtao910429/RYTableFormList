//
//  PickerView.m
//  RYTableFormList
//
//  Created by wwt on 16/1/18.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import "PickerView.h"
#import "RYTableViewCellHeader.h"
#import "PickerView+PickerViewMethod.h"

@interface PickerView () <UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic, strong) NSDateFormatter *formatter;
@property (nonatomic, strong) NSLocale        *locale;

@property (nonatomic, strong) UIView    *lineView;
@property (nonatomic, strong) UIButton  *confirmButton;
@property (nonatomic, assign) NSInteger pickerViewType;

//日期控件
@property (nonatomic, strong) UIDatePicker *datePicker;
//省市县控件 （同normal，一般为三级）
@property (nonatomic, strong) UIPickerView *addressPickerView;
//普通控件   （一般为一级）
@property (nonatomic, strong) UIPickerView *normalPickerView;

@end

@implementation PickerView

- (instancetype)initWithFrame:(CGRect)frame delegate:(id < PickerViewDelegte >)delegate type:(PickerViewType)pickerViewType {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.pickerViewType = pickerViewType;
        self.pickerViewDelegte = delegate;
        [self createSubviews];
    }
    return self;
}

#pragma mark UIPickerViewDataSource,UIPickerViewDelegate

//列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 0;
}

//行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return @"";
    
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 40;
}

//选中之后执行方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel *contentLabel = nil;
    NSString *contentStr = nil;
    
    return contentLabel;
}

#pragma mark private Method

/**
 *  临时数据初始化
 */

- (void)initData {
    
    _formatter = [[NSDateFormatter alloc] init];
    [_formatter setDateFormat:@"yyyy-MM-dd"];
    
    _locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hans_CN"];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backGroundViewtap:)];
    [self addGestureRecognizer:tap];
}


/**
 *  UI初始化
 */

- (void)createSubviews {
    
    [self.backGroundView addSubview:self.lineView];
    [self.backGroundView addSubview:self.confirmButton];
    
    
    switch (self.pickerViewType) {
        case PickerViewTypeDate:{
            [self.backGroundView addSubview:_datePicker];
        }
            break;
        case PickerViewTypeAddress:{
            [self.backGroundView addSubview:_addressPickerView];
        }
            break;
        case PickerViewTypeNormal:{
            [self.backGroundView addSubview:_normalPickerView];
        }
            break;
        case PickerViewTypeNone:{
            
        }
            break;
        default:
            break;
    }
    [self addSubview:self.backGroundView];
}

- (void)animationStart {
    
    
    
}

- (void)animationStop {
    
    
    
}

/**
 *  视图刷新
 */

- (void)reloadData {
    
}

#pragma mark event response

/**
 *  点击确定按钮时间处理
 *
 *  @param sender UIButton实例
 */

- (void)comfirmBtnClick:(UIButton *)sender {
    
    self.backgroundColor = [UIColor whiteColor];
    [self removeFromSuperview];
    
    if ([self.pickerViewDelegte respondsToSelector:@selector(confirmSelectItem:index:)]) {
        [self.pickerViewDelegte confirmSelectItem:@"" index:0];
    }
    
}

/**
 *  弹出视图触摸背景处理
 *
 *  @param tap tap
 */

- (void)backGroundViewtap:(UITapGestureRecognizer *)tap {
    
    self.backgroundColor = [UIColor whiteColor];
    [self removeFromSuperview];
    
}

#pragma mark getters & setters

- (UIView *)backGroundView {
    
    if (!_backGroundView) {
        _backGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_BOUND_HEIGHT - 240, SCREEN_BOUND_WIDTH, 240)];
        _backGroundView.backgroundColor = [UIColor whiteColor];
        _backGroundView.userInteractionEnabled = YES;
    }
    return _backGroundView;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.backGroundView.frame.size.height - 50, SCREEN_BOUND_WIDTH, 0.5)];
        _lineView.backgroundColor = [UIColor colorWithRed:219/255.0 green:219/255.0 blue:219/255.0 alpha:1.0f];
    }
    return _lineView;
}

- (UIButton *)confirmButton {
    if (!_confirmButton) {
        _confirmButton                 = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirmButton.frame           = CGRectMake(0, self.backGroundView.frame.size.height - 50, SCREEN_BOUND_WIDTH, 50);
        
        [_confirmButton setTitle:@"确定" forState:UIControlStateNormal];
        [_confirmButton setTitleColor:[UIColor colorWithRed:64/255.0f green:174/255.0f blue:236/255.0f alpha:1.0f] forState:UIControlStateNormal];
        _confirmButton.titleLabel.font = [UIFont boldSystemFontOfSize:19];
        [_confirmButton addTarget:self action:@selector(comfirmBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmButton;
}

- (UIDatePicker *)datePicker {
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, SCREEN_BOUND_WIDTH, self.backGroundView.frame.size.height - 50)];
        _datePicker.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        _datePicker.datePickerMode   = UIDatePickerModeDate;
        _datePicker.locale           = _locale;
    }
    return _datePicker;
}

- (UIPickerView *)addressPickerView {
    if (!_addressPickerView) {
        _addressPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_BOUND_WIDTH, self.backGroundView.frame.size.height - 50)];
        _addressPickerView.dataSource = self;
        _addressPickerView.delegate   = self;
    }
    return _addressPickerView;
}

- (UIPickerView *)normalPickerView {
    if (!_normalPickerView) {
        _normalPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_BOUND_WIDTH, self.backGroundView.frame.size.height - 50)];
        _normalPickerView.dataSource = self;
        _normalPickerView.delegate   = self;
    }
    return _normalPickerView;
}

@end

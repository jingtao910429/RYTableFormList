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
#import "RYAnimations.h"
#import "RYAnimationView.h"
#import "NSObject+isValidValue.h"

@interface PickerView () <UIPickerViewDataSource,UIPickerViewDelegate,RYAnimationAdaptorDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, strong) NSDateFormatter                   *formatter;
@property (nonatomic, strong) NSLocale                          *locale;

@property (nonatomic, strong) UIView                            *lineView;
@property (nonatomic, strong) UIButton                          *confirmButton;

//日期控件
@property (nonatomic, strong) UIDatePicker                      *datePicker;
//省市县控件 （同normal，一般为三级）
@property (nonatomic, strong) UIPickerView                      *addressPickerView;
//普通控件   （一般为一级）
@property (nonatomic, strong) UIPickerView                      *normalPickerView;
@property (nonatomic, strong) UIView                            *backGroundView;

//动画相关
@property (nonatomic, strong) RYBackGroundColorAnimationAdaptor *backGroundColorAnimationAdaptor;
@property (nonatomic, strong) RYMoveAnimationAdaptor            *moveAnimationAdaptor;
@property (nonatomic, assign) BOOL                              animationOver;

@end

@implementation PickerView

- (instancetype)initWithFrame:(CGRect)frame delegate:(id <PickerViewDelegte >)delegate type:(PickerViewType)pickerViewType {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.popUpPickerViewType = pickerViewType;
        self.pickerViewDelegte = delegate;
        [self initData];
        [self createSubviews];
    }
    return self;
}

#pragma mark UIPickerViewDataSource,UIPickerViewDelegate

//列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return self.dataSource.count;
}

//行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [self.dataSource[component] count];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 45;
}

//选中之后执行方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    //更新组件
    for (int i = (int)component; i < self.dataSource.count ; i ++) {
        
        for (int j = i + 1; j < self.dataSource.count ; j ++) {
            
            [pickerView selectRow:0 inComponent:j animated:YES];
            [pickerView reloadComponent:j];
            
        }
        
    }
    
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UILabel *contentLabel = view ? (UILabel *) view : [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, SCREEN_BOUND_WIDTH, 20.0f)];
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.text = self.dataSource[component][row];
    
    return contentLabel;
}

#pragma mark RYAnimationAdaptorDelegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    if (self.backGroundColorAnimationAdaptor.isVerse) {
        [self removeFromSuperview];
    }else {
        self.animationOver = YES;
    }
}

- (void)animationDidStart:(CAAnimation *)anim {
    
}

#pragma mark UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    if (touch.view == self.backGroundView && ![touch.view isKindOfClass:[UIButton class]]) {
        return NO;
    }
    return YES;
}

#pragma mark private Method

/**
 *  临时数据初始化
 */

- (void)initData {
    
    self.animationOver = YES;
    
    _formatter = [[NSDateFormatter alloc] init];
    [_formatter setDateFormat:@"yyyy-MM-dd"];
    
    _locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hans_CN"];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backGroundViewtap:)];
    tap.cancelsTouchesInView = NO;
    tap.delegate = self;
    [self addGestureRecognizer:tap];
    
}


/**
 *  UI初始化
 */

- (void)createSubviews {
    
    [self.backGroundView addSubview:self.lineView];
    [self.backGroundView addSubview:self.confirmButton];
    
    [self addSubview:self.backGroundView];
}

/**
 *  动画开始
 */

- (void)animationStart {
    
    self.animationOver = NO;
    
    self.backgroundColor                         = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    self.backGroundView.frame                    = CGRectMake(0, SCREEN_BOUND_HEIGHT - 240, SCREEN_BOUND_WIDTH, 240);
    
    self.backGroundColorAnimationAdaptor.isVerse = NO;
    [self.backGroundColorAnimationAdaptor play];
    
    self.moveAnimationAdaptor.isVerse            = NO;
    [self.moveAnimationAdaptor play];

}

- (void)animationStop {
    
    self.backgroundColor                         = [UIColor clearColor];
    self.backGroundView.frame                    = CGRectMake(0, SCREEN_BOUND_HEIGHT, SCREEN_BOUND_WIDTH, 240);
    
    self.backGroundColorAnimationAdaptor.isVerse = YES;
    [self.backGroundColorAnimationAdaptor play];
    
    self.moveAnimationAdaptor.isVerse            = YES;
    [self.moveAnimationAdaptor play];
}

/**
 *  视图刷新
 */

- (void)reloadData {
    
    [self clearSubviews];
    
    switch (self.popUpPickerViewType) {
        case PickerViewTypeDate:{
            
            [self.backGroundView addSubview:self.datePicker];
            
            switch (self.datePickerViewMode) {
                case PickerViewDateModeDateOnly:
                    self.datePicker.datePickerMode = UIDatePickerModeDate;
                    break;
                case PickerViewDateModeDateAndTime:
                    self.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
                    break;
                case PickerViewDateModeTime:
                    self.datePicker.datePickerMode = UIDatePickerModeTime;
                    break;
                case PickerViewDateModeCountDownTimer:
                    self.datePicker.datePickerMode = UIDatePickerModeCountDownTimer;
                    break;
                default:
                    //默认(e.g. November | 15 | 2007)
                    self.datePicker.datePickerMode = UIDatePickerModeDate;
                    break;
            }
            
        }
            break;
        case PickerViewTypeAddress:{
            
            [self.backGroundView addSubview:self.addressPickerView];
            
            [self.normalPickerView reloadAllComponents];
        }
            break;
        case PickerViewTypeNormal:{
            
            [self.backGroundView addSubview:self.normalPickerView];
            
            NSMutableArray *normalArray = [[NSMutableArray alloc] init];
            
            switch (self.normalPickerViewType) {
                case PickerViewNormalTypeOne:
                    break;
                case PickerViewNormalTypeTwo:
                    break;
                case PickerViewNormalTypeThree:
                    break;
                case PickerViewNormalTypeFour:
                    break;
                default:
                    break;
            }
            
            if (self.dataSource.count < self.normalPickerViewType) {
                
                NSString *assertRes = [NSString stringWithFormat:@"PickerViewNormalTypeFour 数据源至少有%ld个子数组",(long)self.normalPickerViewType];
                NSAssert(0, assertRes);
            }
            
            for (int i = 0; i < self.normalPickerViewType; i ++) {
                [normalArray addObject:self.dataSource[i]];
            }
            [self.dataSource removeAllObjects];
            [self.dataSource addObjectsFromArray:normalArray];
            
            [self.normalPickerView reloadAllComponents];
        }
            break;
        case PickerViewTypeNone:{
            
        }
            break;
        default:
            break;
    }
    
    
}

/**
 *
 *  清除子视图
 *
 */

- (void)clearSubviews {
    
    [self.datePicker        removeFromSuperview];
    [self.addressPickerView removeFromSuperview];
    [self.normalPickerView  removeFromSuperview];
    
}

#pragma mark event response

/**
 *  点击确定按钮时间处理
 *
 *  @param sender UIButton实例
 */

- (void)comfirmBtnClick:(UIButton *)sender {
    
    if (self.animationOver) {
        
        [self animationStop];
        
        if ([self.pickerViewDelegte respondsToSelector:@selector(confirmSelectItem:index:)]) {
            [self.pickerViewDelegte confirmSelectItem:@"" index:0];
        }
    }

}

/**
 *  弹出视图触摸背景处理
 *
 *  @param tap tap
 */

- (void)backGroundViewtap:(UITapGestureRecognizer *)tap {
    
    if (self.animationOver) {
        [self animationStop];
    }
    
}

#pragma mark getters & setters

- (UIView *)backGroundView {
    
    if (!_backGroundView) {
        _backGroundView                        = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_BOUND_HEIGHT - 240, SCREEN_BOUND_WIDTH, 240)];
        _backGroundView.backgroundColor        = [UIColor whiteColor];
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
        _datePicker                  = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, SCREEN_BOUND_WIDTH, self.backGroundView.frame.size.height - 50)];
        _datePicker.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        _datePicker.datePickerMode   = UIDatePickerModeDate;
        _datePicker.locale           = _locale;
        _datePicker.date             = [NSDate date];
        
    }
    return _datePicker;
}

- (UIPickerView *)addressPickerView {
    if (!_addressPickerView) {
        _addressPickerView            = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_BOUND_WIDTH, self.backGroundView.frame.size.height - 50)];
        _addressPickerView.dataSource = self;
        _addressPickerView.delegate   = self;
    }
    return _addressPickerView;
}

- (UIPickerView *)normalPickerView {
    if (!_normalPickerView) {
        _normalPickerView            = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_BOUND_WIDTH, self.backGroundView.frame.size.height - 50)];
        _normalPickerView.dataSource = self;
        _normalPickerView.delegate   = self;
    }
    return _normalPickerView;
}

- (RYBackGroundColorAnimationAdaptor *)backGroundColorAnimationAdaptor {
    if (!_backGroundColorAnimationAdaptor) {
        _backGroundColorAnimationAdaptor = [[RYBackGroundColorAnimationAdaptor alloc] init];
        _backGroundColorAnimationAdaptor.targetView = self;
        _backGroundColorAnimationAdaptor.delegate = self;
    }
    return _backGroundColorAnimationAdaptor;
}

- (RYMoveAnimationAdaptor *)moveAnimationAdaptor {
    if (!_moveAnimationAdaptor) {
        _moveAnimationAdaptor = [[RYMoveAnimationAdaptor alloc] init];
        _moveAnimationAdaptor.targetView = self.backGroundView;
        _moveAnimationAdaptor.startPoint = CGPointMake(SCREEN_BOUND_WIDTH/2, SCREEN_BOUND_HEIGHT + 120);
        _moveAnimationAdaptor.endPoint   = CGPointMake(SCREEN_BOUND_WIDTH/2, SCREEN_BOUND_HEIGHT - 120);
        _moveAnimationAdaptor.delegate   = self;
    }
    return _moveAnimationAdaptor;
}


@end

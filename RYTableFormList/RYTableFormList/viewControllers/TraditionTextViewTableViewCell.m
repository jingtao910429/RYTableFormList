//
//  TraditionTextViewTableViewCell.m
//  RYTableFormList
//
//  Created by wwt on 16/1/15.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import "TraditionTextViewTableViewCell.h"
#import "UITextView+CenterContent.h"

@interface TraditionTextViewTableViewCell () <UITextViewDelegate>

@property (nonatomic, strong) UIView       *titleView;
@property (nonatomic, strong) UIButton     *redImgBtn;
@property (nonatomic, strong) UILabel      *titleLabel;
@property (nonatomic, strong) UIView       *labelBotLine;
@property (nonatomic, strong) UIButton     *tipBtn;
@property (nonatomic, strong) UITextView   *inputTV;
@property (nonatomic, strong) UILabel      *unitLabel;

@end

@implementation TraditionTextViewTableViewCell

#pragma mark - life cycle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self loadViews];
    }
    
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
     /*-----------------设置控件位置------------------*/
    
    CGFloat redImgWH  = 8.0f;
    CGFloat margin    = 17.0f;
    CGFloat imgWH     = 20.0f;
    CGFloat labelH    = 40.0f;
    
    switch (self.tableTextViewCellStyle) {
        case TableTextViewCellStyleDefault:
        {
            labelH                   = CGRectGetHeight(self.frame);
            self.redImgBtn.frame     = CGRectMake((margin-redImgWH)/2, (labelH-redImgWH)/2, redImgWH, redImgWH);
            self.titleLabel.frame    = CGRectMake(margin, 0.0f, 100.0f, labelH);
            self.titleView.frame     = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.frame), labelH);
            
            CGFloat unitWidth = 0.0f;
            if (self.unitType == UITableViewCellUnitTypeHave) {
                
                unitWidth = 42.0f;
                self.unitLabel.frame = CGRectMake(CGRectGetWidth(self.frame)- unitWidth - 17.0f, 0.0f, unitWidth, labelH);
                
            }else if (self.unitType == UITableViewCellUnitTypeNone){
                
                self.unitLabel.hidden = YES;
            }
            
            self.inputTV.frame       = CGRectMake(CGRectGetMaxX(self.titleLabel.frame), 0.0f, CGRectGetWidth(self.frame)-CGRectGetMaxX(self.titleLabel.frame)-unitWidth-17.0f,labelH);
            self.inputTV.textContainerInset = UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f);
            self.inputTV.textAlignment = NSTextAlignmentRight;//设置向右对齐
            [self.inputTV verticalSet];//设置垂直居中对齐
            
        }
        break;
        case TableTextViewCellStyleRemarks:
        case TableTextViewCellStyleComment:
        {
            labelH                   = 40.0f;
            self.redImgBtn.frame     = CGRectMake((margin-redImgWH)/2, (labelH-redImgWH)/2, redImgWH, redImgWH);
            self.titleLabel.frame    = CGRectMake(margin, 0.0f, CGRectGetWidth(self.frame)/2, labelH);
            self.titleView.frame     = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.frame), labelH);
            self.labelBotLine.frame  = CGRectMake(CGRectGetMinX(self.titleLabel.frame), CGRectGetMaxY(self.titleLabel.frame)-0.3f, CGRectGetWidth(self.frame), 0.3f);
            self.tipBtn.frame        = CGRectMake(CGRectGetWidth(self.frame)-imgWH - margin, (labelH-imgWH)/2, imgWH, imgWH);
            self.inputTV.frame       = CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)-labelH);
        }
            break;
            
        default:
            break;
    }
    
}

#pragma mark - private method

- (void)reloadData{
    
    /*-------------------设置内容-------------------*/
    self.titleLabel.text = self.itemName;
    self.inputTV.text = self.content ? self.content : @"未填写";
    
    switch (self.tableTextViewCellStyle) {
        case TableTextViewCellStyleDefault:
        {
            //可设置颜色
            self.titleView.backgroundColor = [UIColor whiteColor];
            //可设置显示不显示
            self.redImgBtn.backgroundColor = [UIColor redColor];
            self.unitLabel.text            = self.unitContent;
            
        }
        break;
        case TableTextViewCellStyleRemarks://备注
        {
            
        }
            break;
        case TableTextViewCellStyleComment://评价
        {
            //可设置颜色
            self.titleView.backgroundColor = [UIColor whiteColor];
            //可设置显示不显示
            self.redImgBtn.backgroundColor = [UIColor redColor];
            //可设置显示不显示
            self.tipBtn.backgroundColor = [UIColor purpleColor];
            [self.tipBtn addTarget:self action:@selector(TipRemarkAction) forControlEvents:UIControlEventTouchUpInside];
        }
            break;
            
        default:
            break;
    }
}

+ (instancetype)initCellWithTableView:(UITableView*)tableView{
    
    static NSString *cellId              = @"TraditionTextViewElement";
    TraditionTextViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[TraditionTextViewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = tableView.backgroundColor;
    
    return cell;
}

- (void)loadViews{
    
    [self addSubview:self.titleView];
    [self addSubview:self.redImgBtn];
    [self addSubview:self.titleLabel];
    [self addSubview:self.labelBotLine];
    [self addSubview:self.tipBtn];
    [self addSubview:self.inputTV];
}

#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView{
    
    if (textView.textColor == [UIColor lightGrayColor] && [textView.text isEqualToString:@"请填写"]) {
        textView.text = @"";
        textView.textColor = [UIColor darkGrayColor];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    
    if (textView.textColor == [UIColor darkGrayColor]) {
        if ([textView.text isEqualToString:@""]) {
            textView.text = @"请填写";
            textView.textColor = [UIColor lightGrayColor];
        }
    }
    
}

#pragma mark - event response

- (void)TipRemarkAction{
    
    NSLog(@"或弹出提示信息");
}

#pragma mark getters & setters 

- (UIView *)titleView {
    if (!_titleView) {
        _titleView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _titleView;
}

- (UIButton *)redImgBtn {
    if (!_redImgBtn) {
        _redImgBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    }
    return _redImgBtn;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel               = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor     = [UIColor blackColor];
        _titleLabel.font          = [UIFont systemFontOfSize:16.0f];
        _titleLabel.numberOfLines = 2;
        
    }
    return _titleLabel;
}

- (UIView *)labelBotLine {
    if (!_labelBotLine) {
        _labelBotLine                 = [[UIView alloc] initWithFrame:CGRectZero];
        _labelBotLine.backgroundColor = [UIColor lightGrayColor];
        _labelBotLine.alpha           = 0.6f;
    }
    return _labelBotLine;
}

- (UIButton *)tipBtn {
    if (!_tipBtn) {
        _tipBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    }
    return _tipBtn;
}

- (UITextView *)inputTV {
    if (!_inputTV) {
        _inputTV                 = [[UITextView alloc] initWithFrame:CGRectZero];
        _inputTV.textAlignment   = NSTextAlignmentLeft;
        _inputTV.textColor       = [UIColor lightGrayColor];
        _inputTV.font            = [UIFont systemFontOfSize:16.0f];
        _inputTV.backgroundColor = [UIColor whiteColor];
        _inputTV.delegate        = self;
        _inputTV.textContainerInset = UIEdgeInsetsMake(5.0f, 15.0f, 0.0f, 15.0f);
    }
    return _inputTV;
}

@end

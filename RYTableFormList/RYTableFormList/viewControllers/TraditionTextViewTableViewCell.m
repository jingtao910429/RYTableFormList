//
//  TraditionTextViewTableViewCell.m
//  RYTableFormList
//
//  Created by wwt on 16/1/15.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import "TraditionTextViewTableViewCell.h"

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
    
    CGFloat redImgWH  = 8.0f;
    CGFloat margin    = 17.0f;
    CGFloat imgWH     = 20.0f;
    CGFloat labelH    = 40.0f;
    
    self.titleView.frame = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.frame), labelH);
    self.redImgBtn.frame     = CGRectMake((margin-redImgWH)/2, (labelH-redImgWH)/2, redImgWH, redImgWH);
    self.titleLabel.frame    = CGRectMake(margin, 0.0f, CGRectGetWidth(self.frame)/2, labelH);
    self.labelBotLine.frame  = CGRectMake(CGRectGetMinX(self.titleLabel.frame), CGRectGetMaxY(self.titleLabel.frame)-0.3f, CGRectGetWidth(self.frame), 0.3f);
    self.tipBtn.frame        = CGRectMake(CGRectGetWidth(self.frame)-imgWH - margin, (labelH-imgWH)/2, imgWH, imgWH);
    self.inputTV.frame       = CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)-CGRectGetHeight(self.titleLabel.frame));
}

#pragma mark - private method

+ (instancetype)initCellWithTableView:(UITableView*)tableView{
    
    static NSString *cellId              = @"CellId";
    TraditionTextViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[TraditionTextViewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.backgroundColor = tableView.backgroundColor;
    return cell;
}

- (void)loadViews{
    
    [self initTitleView];
    [self initRedImgBtn];
    [self initTitleLabel];
    [self initLabelBotLine];
    [self initTipBtn];
    [self initInputTV];
}

- (void)initTitleView{
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectZero];
    [self addSubview:titleView];
    self.titleView = titleView;
}

- (void)initRedImgBtn{
    
    UIButton *redImgBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [self addSubview:redImgBtn];
    self.redImgBtn = redImgBtn;
}

- (void)initTitleLabel{
    
    UILabel *titleLabel      = [[UILabel alloc] initWithFrame:CGRectZero];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.textColor     = [UIColor blackColor];
    titleLabel.font          = [UIFont systemFontOfSize:16.0f];
    titleLabel.numberOfLines = 2;
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
}

- (void)initLabelBotLine{
    
    UIView *labelBotLine        = [[UIView alloc] initWithFrame:CGRectZero];
    labelBotLine.backgroundColor = [UIColor lightGrayColor];
    labelBotLine.alpha           = 0.6f;
    [self addSubview:labelBotLine];
    self.labelBotLine            = labelBotLine;
}

- (void)initTipBtn{
    
    UIButton *tipBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [self addSubview:tipBtn];
    self.tipBtn         = tipBtn;
}

- (void)initInputTV{
    
    UITextView *inputTV     = [[UITextView alloc] initWithFrame:CGRectZero];
    inputTV.textAlignment   = NSTextAlignmentLeft;
    inputTV.textColor       = [UIColor lightGrayColor];
    inputTV.font            = [UIFont systemFontOfSize:16.0f];
    inputTV.backgroundColor = [UIColor whiteColor];
    inputTV.delegate        = self;
    //padding
    inputTV.textContainerInset = UIEdgeInsetsMake(5.0f, 15.0f, 0.0f, 15.0f);
    [self addSubview:inputTV];
    self.inputTV          = inputTV;
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

@end

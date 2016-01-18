//
//  ExampleViewController.m
//  RYTableFormList
//
//  Created by wwt on 16/1/18.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import "ExampleViewController.h"
#import "FormListHeader.h"
#import "TraditionDatePickerTableViewCell.h"
#import "UIFactory.h"
#import "PickerView.h"
#import "PickerView+PickerViewMethod.h"

@interface ExampleViewController () <UITableViewDelegate,UITableViewDataSource,PickerViewDelegte>

@property (nonatomic, strong) UITableView *contentTableView;

@end

@implementation ExampleViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.contentTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TraditionDatePickerTableViewCell *traditionDatePickerTableViewCell = [tableView dequeueReusableCellWithIdentifier:@"TraditionDatePickerElement"];
    
    if (!traditionDatePickerTableViewCell) {
        traditionDatePickerTableViewCell = [[TraditionDatePickerTableViewCell alloc] initWithUnitType:UITableViewCellUnitTypeHave content:@"内容" unitContent:@"元"];
    }
    
    return traditionDatePickerTableViewCell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    PickerView *pickerView = [[UIFactory shareInstance] pickerView];
    pickerView.pickerViewDelegte = self;
    
    [UIView animateWithDuration:0.5 animations:^{
        
        pickerView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:pickerView];
        
    } completion:^(BOOL finished) {
        
        if (finished) {
            pickerView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6f];
        }
        
    }];
    
    
}

#pragma mark - PickerViewDelegte

- (void)confirmSelectItem:(NSString *)value index:(NSInteger)index{
    
}

#pragma mark - event response
#pragma mark - private method
#pragma mark - getters and setters

- (UITableView *)contentTableView {
    
    if (!_contentTableView) {
        _contentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_BOUND_WIDTH, SCREEN_BOUND_HEIGHT) style:UITableViewStylePlain];
        _contentTableView.delegate = self;
        _contentTableView.dataSource = self;
    }
    return _contentTableView;
}

@end

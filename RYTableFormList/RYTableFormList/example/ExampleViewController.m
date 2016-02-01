//
//  ExampleViewController.m
//  RYTableFormList
//
//  Created by wwt on 16/1/18.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import "ExampleViewController.h"
#import "FormListHeader.h"
#import "TraditionPickersTableViewCell.h"
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
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TraditionPickersTableViewCell *traditionPickersTableViewCell = [tableView dequeueReusableCellWithIdentifier:@"TraditionDatePickerElement"];
    
    if (!traditionPickersTableViewCell) {
        traditionPickersTableViewCell = [[TraditionPickersTableViewCell alloc] init];
    }
    
    NSString *content     = @"";
    NSString *unitContent = @"";
    NSString *itemContent = @"";
    UITableViewCellUnitType unitType = UITableViewCellUnitTypeHave;
    
    if (0 == indexPath.row) {
        
        //unit show
        content     = @"单位";
        unitContent = @"元";
        itemContent = @"ModeDateAndTime";
        unitType    = UITableViewCellUnitTypeHave;
        
    }else if (1 == indexPath.row){
        
        //unit hidden
        content     = @"无单位";
        itemContent = @"ModeDateOnly";
        unitType    = UITableViewCellUnitTypeNone;
        
    }else {
        
        content     = @"单位";
        unitContent = @"元";
        itemContent = @"ModeDateAndTime";
        unitType    = UITableViewCellUnitTypeHave;
        
    }
    
    traditionPickersTableViewCell.content     = content;
    traditionPickersTableViewCell.unitContent = unitContent;
    traditionPickersTableViewCell.itemContent = itemContent;
    traditionPickersTableViewCell.unitType    = unitType;
    [traditionPickersTableViewCell reloadData];
    
    return traditionPickersTableViewCell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    PickerView *pickerView = [[UIFactory shareInstance] pickerView];
    pickerView.pickerViewDelegte = self;
    
    if (0 == indexPath.row) {
        
        //TODO:测试
        pickerView.popUpPickerViewType  = PickerViewTypeDate;
        //如果是日期控件，需要设置控件日期类型
        pickerView.datePickerViewMode   = PickerViewDateModeDateAndTime;
        
    }else if (1 == indexPath.row){
        
        //TODO:测试
        pickerView.popUpPickerViewType  = PickerViewTypeDate;
        //如果是日期控件，需要设置控件日期类型
        pickerView.datePickerViewMode   = PickerViewDateModeDateOnly;
        
    }else if (2 == indexPath.row) {
        
        pickerView.popUpPickerViewType  = PickerViewTypeNormal;
        pickerView.normalPickerViewType = PickerViewNormalTypeOne;
        
        pickerView.dataSource = [NSMutableArray arrayWithObjects:@[@"有",@"无"], nil];
        
    }else if (3 == indexPath.row) {
        
        pickerView.popUpPickerViewType  = PickerViewTypeNormal;
        pickerView.normalPickerViewType = PickerViewNormalTypeTwo;
        
        pickerView.dataSource = [NSMutableArray arrayWithObjects:@[@"row1",@"row2"],@[@"row3",@"row4"], nil];
    }

    [self.view addSubview:pickerView];
    
    [pickerView animationStart];
//    pickerView.dataSource = [NSMutableArray arrayWithObjects:@[@"1",@"2",@"3",@"3",@"3",@"3",@"3",@"3",@"3",@"3",@"3",@"3"],@[@"1",@"2",@"3",@"3",@"3",@"3",@"3",@"3",@"3",@"3",@"3",@"3"],@[@"1",@"2",@"3",@"3",@"3",@"3",@"3",@"3",@"3",@"3",@"3",@"3"], nil];
    [pickerView reloadData];
    
    
}

#pragma mark - PickerViewDelegte

/**
 *  点击确定按钮返回值
 *
 *  @param value 返回值
 *  @param index 返回值所在索引值
 */
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

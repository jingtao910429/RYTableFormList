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
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapGesture:)];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.numberOfTouchesRequired = 1;
    [self.contentTableView addGestureRecognizer:tapGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (4 == indexPath.row || 5 == indexPath.row) {
        
        return 150.0f;
    }
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (4 == indexPath.row || 5 == indexPath.row) {
        
        TraditionCustomerTableViewCell *traditionCustomerTableViewCell = [TraditionCustomerTableViewCell initCellWithTableView:tableView];
        
        if (4 == indexPath.row) {
            
            traditionCustomerTableViewCell.titleLabel.text = @"备注";
            
        }else{
            
            traditionCustomerTableViewCell.titleLabel.text = @"评价如下：";
            //可设置颜色
            traditionCustomerTableViewCell.titleView.backgroundColor = [UIColor whiteColor];
            //可设置显示不显示
            traditionCustomerTableViewCell.redImgBtn.backgroundColor = [UIColor redColor];
            //可设置显示不显示
            traditionCustomerTableViewCell.tipBtn.backgroundColor = [UIColor purpleColor];
            [traditionCustomerTableViewCell.tipBtn addTarget:self action:@selector(TipRemarkAction) forControlEvents:UIControlEventTouchUpInside];
        }
        
        traditionCustomerTableViewCell.inputTV.text = @"请填写";
        
        traditionCustomerTableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return traditionCustomerTableViewCell;
        
    }else{
        
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
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (4 == indexPath.row || 5 == indexPath.row) {
        return;
    }else{
        
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

- (void)onTapGesture:(UITapGestureRecognizer*)tap{
    
    if (![tap.view isKindOfClass:[UITextView class]] || ![tap.view isKindOfClass:[UITextField class]]) {
        [self.view endEditing:YES];
    }
}

- (void)TipRemarkAction{
    
    NSLog(@"或弹出提示信息");
}

#pragma mark - private method
#pragma mark - getters and setters

- (UITableView *)contentTableView {
    
    if (!_contentTableView) {
        _contentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_BOUND_WIDTH, SCREEN_BOUND_HEIGHT) style:UITableViewStyleGrouped];
        _contentTableView.delegate = self;
        _contentTableView.dataSource = self;
    }
    return _contentTableView;
}

@end

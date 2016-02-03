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

@property (nonatomic, strong) UITableView     *contentTableView;

@property (nonatomic, strong) NSMutableArray  *dataSource;

@end

@implementation ExampleViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self configData];
    
    [self configUI];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (8 == indexPath.row || 9 == indexPath.row) {
        
        return 150.0f;
    }else if (10 == indexPath.row || 11 == indexPath.row){
        
        return 60.0f;
    }
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *valueArray = self.dataSource[indexPath.row];

   if (8 == indexPath.row || 9 == indexPath.row || 10 == indexPath.row || 11 == indexPath.row) {//TextView之类
        
        TraditionTextViewTableViewCell *traditionTextViewTableViewCell = [TraditionTextViewTableViewCell initCellWithTableView:tableView];
        
        traditionTextViewTableViewCell.itemName    = valueArray[0];
        traditionTextViewTableViewCell.content     = valueArray[1];
        traditionTextViewTableViewCell.unitContent = valueArray[2];
        traditionTextViewTableViewCell.unitType    = [valueArray[3] integerValue];
        
        if (8 == indexPath.row) {
            traditionTextViewTableViewCell.tableTextViewCellStyle = TableTextViewCellStyleRemarks;
        }else if (9 == indexPath.row){
            
            traditionTextViewTableViewCell.tableTextViewCellStyle = TableTextViewCellStyleComment;
        }else if (10 == indexPath.row || 11 == indexPath.row){
            
            traditionTextViewTableViewCell.tableTextViewCellStyle = TableTextViewCellStyleDefault;
        }
        
        [traditionTextViewTableViewCell reloadData];
        
        return traditionTextViewTableViewCell;
        
    }else{
        
        TraditionPickersTableViewCell *traditionPickersTableViewCell = [tableView dequeueReusableCellWithIdentifier:@"TraditionDatePickerElement"];
        
        if (!traditionPickersTableViewCell) {
            traditionPickersTableViewCell = [[TraditionPickersTableViewCell alloc] init];
        }
        
        traditionPickersTableViewCell.itemName    = valueArray[0];
        traditionPickersTableViewCell.content     = valueArray[1];
        traditionPickersTableViewCell.unitContent = valueArray[2];
        traditionPickersTableViewCell.unitType    = [valueArray[3] integerValue];
        [traditionPickersTableViewCell reloadData];
        
        return traditionPickersTableViewCell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        
    if (8 == indexPath.row || 9 == indexPath.row || 10 == indexPath.row) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        return;
    }else {
        
        PickerView *pickerView = [[UIFactory shareInstance] pickerView];
        pickerView.pickerViewDelegte = self;
        
        if (0 == indexPath.row) {
            
            //测试日期控件，类型为 UIDatePickerModeDateAndTime
            pickerView.popUpPickerViewType  = PickerViewTypeDate;
            //如果是日期控件，需要设置控件日期类型
            pickerView.datePickerViewMode   = PickerViewDateModeDateAndTime;
            
        }else if (1 == indexPath.row){
            
            //UIDatePickerModeDate
            pickerView.popUpPickerViewType  = PickerViewTypeDate;
            pickerView.datePickerViewMode   = PickerViewDateModeDateOnly;
            
        }else if (2 == indexPath.row) {
            
            //UIDatePickerModeTime
            pickerView.popUpPickerViewType  = PickerViewTypeDate;
            pickerView.datePickerViewMode   = PickerViewDateModeTime;
            
        }else if (3 == indexPath.row) {
            
            //UIDatePickerModeDate
            pickerView.popUpPickerViewType  = PickerViewTypeDate;
            pickerView.datePickerViewMode   = PickerViewDateModeCountDownTimer;
            
            
        }else if (indexPath.row >= 4 && indexPath.row <=7) {
            
            switch (indexPath.row) {
                case 4:
                    pickerView.dataSource = [NSMutableArray arrayWithObjects:@[@"有",@"无"], nil];
                    break;
                case 5:
                    pickerView.dataSource = [NSMutableArray arrayWithObjects:@[@"row1",@"row2"],@[@"row3",@"row4"], nil];
                    break;
                case 6:
                    pickerView.dataSource = [NSMutableArray arrayWithObjects:@[@"row1",@"row2"],@[@"row3",@"row4"],@[@"row3",@"row4"], nil];
                    break;
                case 7:
                    pickerView.dataSource = [NSMutableArray arrayWithObjects:@[@"row1",@"row2"],@[@"row3",@"row4"],@[@"row3",@"row4"],@[@"row3",@"row4"], nil];
                    break;
                default:
                    break;
            }
            
            
            pickerView.popUpPickerViewType  = PickerViewTypeNormal;
            pickerView.normalPickerViewType = pickerView.dataSource.count;
            
            
        }
        
        [self.view addSubview:pickerView];
        
        [pickerView animationStart];
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


#pragma mark - private method


- (void)configData {
    
    /**
     *    数据源
     *
     *    内部数组类型，@[@"条目名称（keyName）",@"条目内容（content）",@"单位（unit）",@"单位类型（有/无）"]
     */
    
    self.dataSource = [[NSMutableArray alloc] initWithObjects:
                       @[@"DateAndTime",@"DateAndTime_Content",@"元",@(UITableViewCellUnitTypeHave)],
                       @[@"DateOnly",@"DateOnly_Content",@"",@(UITableViewCellUnitTypeNone)],
                       @[@"DateTimeOnly",@"DateTimeOnly_Content",@"元",@(UITableViewCellUnitTypeHave)],
                       @[@"DateCountDownTimer",@"DateCountDownTimer_Content",@"元",@(UITableViewCellUnitTypeHave)],
                       @[@"Normal_One",@"Normal_One",@"钱元",@(UITableViewCellUnitTypeHave)],
                       @[@"Normal_Two",@"Normal_Two",@"个",@(UITableViewCellUnitTypeHave)],
                       @[@"Normal_Three",@"Normal_Three",@"栋",@(UITableViewCellUnitTypeHave)],
                       @[@"Normal_Four",@"Normal_Four",@"元",@(UITableViewCellUnitTypeHave)],
                       @[@"备注",@"content",@"",@(UITableViewCellUnitTypeNone)],
                       @[@"评价如下：",@"请填写",@"",@(UITableViewCellUnitTypeNone)],
                       @[@"详细地址：",@"请填写",@"平方米",@(UITableViewCellUnitTypeHave)],
                       @[@"公馆号",@"请填写",@"",@(UITableViewCellUnitTypeNone)],nil];
    
}

- (void)configUI {
    
    [self.view addSubview:self.contentTableView];
    
}

#pragma mark - getters and setters

- (UITableView *)contentTableView {
    
    if (!_contentTableView) {
        _contentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0.0f, SCREEN_BOUND_WIDTH, SCREEN_BOUND_HEIGHT) style:UITableViewStyleGrouped];
        _contentTableView.delegate = self;
        _contentTableView.dataSource = self;
    }
    return _contentTableView;
}

@end

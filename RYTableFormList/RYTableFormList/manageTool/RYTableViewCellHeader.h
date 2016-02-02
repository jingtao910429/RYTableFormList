//
//  RYTableViewCellHeader.h
//  RYTableFormList
//
//  Created by wwt on 16/1/18.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#define SCREEN_BOUND_WIDTH  ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_BOUND_HEIGHT ([[UIScreen mainScreen] bounds].size.height)


#define CONTENTLABEL_TAG                       (1 << 3)  //unitLabel的tag值
#define UNITCONTENT_TAG                        (1 << 5)  //contentLabel的tag值
#define TITLE_LABEL_WIDTH                      15
#define SINGLE_LETTER_WIDTH                    15
#define CELL_HEIGHT                            45        //cell高度
#define LEFT_SPACE                             18        //nameLabel居左距离
#define RIGHT_SPACE                            24        //unitLabel居右距离
#define BETWEEN_CONTENTLABEL_UNITLABEL_SPACE   5         //contentLabel与unitLabel距离
#define GAP                                    10        //nameLabel与contentLabel距离

typedef NS_ENUM(NSInteger, UITableViewCellUnitType){
    //有单位
    UITableViewCellUnitTypeHave = 0,
    //无单位
    UITableViewCellUnitTypeNone = 1
};

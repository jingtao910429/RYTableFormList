//
//  ReloadContentProtocol.h
//  RYTableFormList
//
//  Created by wwt on 16/1/19.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import <Foundation/Foundation.h>

//该协议必须实现
@protocol ReloadContentProtocol <NSObject>

- (void)reloadData;
- (void)refreshUI;

@end

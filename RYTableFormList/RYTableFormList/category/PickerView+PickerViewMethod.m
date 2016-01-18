//
//  PickerView+PickerViewMethod.m
//  RYTableFormList
//
//  Created by wwt on 16/1/18.
//  Copyright (c) 2016年 rongyu. All rights reserved.
//

#import "PickerView+PickerViewMethod.h"
#import <objc/runtime.h>

static void *PickerViewMethodDelegate;

@implementation PickerView (PickerViewMethod)

- (void)setPickerViewDelegte:(id <PickerViewDelegte>)delegate{
    
    objc_setAssociatedObject(self, &PickerViewMethodDelegate, delegate, OBJC_ASSOCIATION_RETAIN);
}

- (id)pickerViewDelegte{
    
    return objc_getAssociatedObject(self, &PickerViewMethodDelegate);
}

@end

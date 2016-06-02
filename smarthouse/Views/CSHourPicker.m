//
//  CSHourPicker.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 01.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSHourPicker.h"

@interface CSHourPicker ()
@property (nonatomic, copy) CSPickHourBlock pickHourBlock;
@end

@implementation CSHourPicker

- (instancetype)initWithPickHourBlock:(CSPickHourBlock)block {
    self = [super init];
    if (self) {
        _pickHourBlock = block;
        
        self.datePickerMode = UIDatePickerModeTime;
        
        [self addTarget:self action:@selector(taskDatePicked:) forControlEvents:UIControlEventValueChanged];
    }
    return self;
}

- (void)taskDatePicked:(CSHourPicker *)sender {
    if (_pickHourBlock) {
        _pickHourBlock(sender, sender.date);
    }
}

@end

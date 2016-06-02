//
//  CSNumberPicker.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 02.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSNumberPicker.h"

@interface CSNumberPickerView ()
@property (nonatomic, strong) NSArray* items;

@property (nonatomic, copy) CSNumberPickerViewPickingCompletion pickNumberBlock;
@end

@implementation CSNumberPickerView

- (instancetype)initWithMinValue:(NSInteger)min maxValue:(NSInteger)max block:(CSNumberPickerViewPickingCompletion)block {
    self = [super init];
    if (self) {
        
        self.delegate = self;
        self.dataSource = self;
        
        [self generateItemsWithMin:min max:max];
        
        _pickNumberBlock = block;
    }
    return self;
}

#pragma mark -
#pragma mark - UIPickerViewDelegate

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return (NSInteger)self.items.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return [self.items[(NSUInteger)row] stringValue];
}

#pragma mark -
#pragma mark - UIPickerViewDataSource

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (self.pickNumberBlock) {
        self.pickNumberBlock([self.items[(NSUInteger)row] integerValue]);
    };
}

#pragma mark -
#pragma mark - Private

- (void)generateItemsWithMin:(NSInteger)min max:(NSInteger)max {
    NSMutableArray *items = [NSMutableArray new];
    for (NSInteger i = min; i <= max; i++) {
        [items addObject:@(i)];
    }
    
    _items = items;
}

@end

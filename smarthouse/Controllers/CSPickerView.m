//
//  CSPickerView.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSPickerView.h"

@interface CSPickerView ()
@property (nonatomic, strong) NSArray <id<CSPickerItem>> *items;
@end

@implementation CSPickerView

- (instancetype)initWithItems:(NSArray<id<CSPickerItem>> *)items {
    self = [super init];
    if (self) {
        _items = items;
        
        self.delegate = self;
        self.dataSource = self;
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
    
    return [self.items[(NSUInteger)row] itemTitle];
}

#pragma mark -
#pragma mark - UIPickerViewDataSource

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (self.pickItemBlock) {
        self.pickItemBlock(self.items[(NSUInteger)row]);
    };
}

@end

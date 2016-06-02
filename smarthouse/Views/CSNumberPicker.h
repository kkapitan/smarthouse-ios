//
//  CSNumberPicker.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 02.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^CSNumberPickerViewPickingCompletion)(NSInteger number);

@interface CSNumberPickerView : UIPickerView <UIPickerViewDelegate, UIPickerViewDataSource>

- (instancetype)initWithMinValue:(NSInteger)min maxValue:(NSInteger)max block:(CSNumberPickerViewPickingCompletion)block;

@end
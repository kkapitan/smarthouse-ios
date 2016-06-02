//
//  CSHourPicker.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 01.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSHourPicker : UIDatePicker

typedef void(^CSPickHourBlock)(CSHourPicker *picker, NSDate *date);

- (instancetype)initWithPickHourBlock:(CSPickHourBlock)block;

@end



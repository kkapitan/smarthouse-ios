//
//  CSPickerView.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CSPickerItem <NSObject>

- (NSString *)itemTitle;

@end

typedef void(^CSPickerViewPickingCompletion)(id<CSPickerItem> item);

@interface CSPickerView : UIPickerView <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, copy) CSPickerViewPickingCompletion pickItemBlock;

- (instancetype)initWithItems:(NSArray <id<CSPickerItem>> *)items;


@end

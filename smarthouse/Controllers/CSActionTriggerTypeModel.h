//
//  CSActionTriggerTypeModel.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Model
#import "CSActionTrigger.h"

//Other
#import "CSPickerView.h"

@interface CSActionTriggerTypeModel : NSObject <CSPickerItem>

@property (nonatomic, assign, readonly) CSActionTriggerType triggerType;

- (instancetype)initWithActionTriggerType:(CSActionTriggerType)type;

@end

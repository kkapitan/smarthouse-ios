//
//  CSTimerTriggerWeaklyViewModel.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 02.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Configuration
#import "CSTimerTriggerConfiguration.h"

//Model
#import "CSWeeklyTimerActionTrigger.h"

//Categories
#import "UIAlertController+Error.h"

typedef void(^CSTimerTriggerViewModelCompletion)(BOOL success,CSWeeklyTimerActionTrigger *trigger, UIAlertController *alert);

@interface CSTimerTriggerWeeklyViewModel : NSObject

@property (nonatomic, strong, readonly) CSTimerTriggerConfiguration *configuration;

- (void)buildTimerTriggerWithCompletion:(CSTimerTriggerViewModelCompletion)block;

@end

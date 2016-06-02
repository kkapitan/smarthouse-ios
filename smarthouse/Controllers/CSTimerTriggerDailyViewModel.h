//
//  CSTimerTriggerDailyViewModel.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 02.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Configuration
#import "CSTimerTriggerConfiguration.h"

//Model
#import "CSDailyTimerActionTrigger.h"

//Categories
#import "UIAlertController+Error.h"

typedef void(^CSTimerTriggerViewModelCompletion)(BOOL success,CSDailyTimerActionTrigger *trigger, UIAlertController *alert);

@interface CSTimerTriggerDailyViewModel : NSObject

@property (nonatomic, strong, readonly) CSTimerTriggerConfiguration *configuration;

- (void)buildTimerTriggerWithCompletion:(CSTimerTriggerViewModelCompletion)block;

@end

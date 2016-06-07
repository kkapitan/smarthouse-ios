//
//  CSWeeklyTimerActionTrigger.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 01.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSActionTrigger.h"

//Configuration
#import "CSTimerTriggerConfiguration.h"

@interface CSWeeklyTimerActionTrigger : CSActionTrigger

@property (nonatomic, assign, readonly) NSUInteger weeks;
@property (nonatomic, strong, readonly) NSArray *weekDays;

@property (nonatomic, strong, readonly) NSDate *hour;

- (instancetype)initWithConfiguration:(CSTimerTriggerConfiguration *)configuration;

@end

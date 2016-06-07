//
//  CSDailyTimerActionTrigger.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 01.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSActionTrigger.h"

//Configuration
#import "CSTimerTriggerConfiguration.h"

@interface CSDailyTimerActionTrigger : CSActionTrigger

@property (nonatomic, assign, readonly) NSUInteger hours;
@property (nonatomic, assign, readonly) NSUInteger minutes;

@property (nonatomic, strong, readonly) NSDate *startHour;
@property (nonatomic, strong, readonly) NSDate *finishHour;

@property (nonatomic, strong, readonly) NSArray *weekDays;

- (instancetype)initWithConfiguration:(CSTimerTriggerConfiguration *)configuration;

@end

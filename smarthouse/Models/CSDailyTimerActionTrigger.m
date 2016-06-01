//
//  CSDailyTimerActionTrigger.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 01.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSDailyTimerActionTrigger.h"

@implementation CSDailyTimerActionTrigger
@synthesize triggerType = _triggerType;

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"uid" : @"id",
             @"triggerType" : @"type"
             };
}

- (instancetype)initWithConfiguration:(CSTimerTriggerConfiguration *)configuration {
    self = [super init];
    if (self) {
        _triggerType = CSActionTriggerTypeDailyTimer;
        
        _hours = configuration.hours;
        _minutes = configuration.minutes;
        _weekDays = configuration.weekdays;
        
        _startHour = configuration.startHour;
        _finishHour = configuration.finishHour;
    }
    return self;
}


@end

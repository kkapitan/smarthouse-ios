//
//  CSWeeklyTimerActionTrigger.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 01.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSWeeklyTimerActionTrigger.h"

@implementation CSWeeklyTimerActionTrigger
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
        _triggerType = CSActionTriggerTypeWeeklyTimer;
        
        _weeks = configuration.weeks;
        _weekDays = configuration.weekdays;
        _hour = configuration.dayHour;
    }
    return self;
}

@end

//
//  CSDailyTimerActionTrigger.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 01.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSDailyTimerActionTrigger.h"

//Category
#import "NSIndexSet+Array.h"

@implementation CSDailyTimerActionTrigger
@synthesize triggerType = _triggerType;

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"uid" : @"id",
             @"triggerType" : @"type",
             @"startHour" : @"start_hour",
             @"finishHour" : @"finish_hour",
             @"hours" : @"hours",
             @"minutes" : @"minutes",
             @"weekDays" : @"week_days"
             };
}

- (instancetype)initWithConfiguration:(CSTimerTriggerConfiguration *)configuration {
    self = [super init];
    if (self) {
        _triggerType = CSActionTriggerTypeDailyTimer;
        
        _hours = configuration.hours;
        _minutes = configuration.minutes;
        _weekDays = [configuration.weekdays arrayFromIndexes];
        
        _startHour = configuration.startHour;
        _finishHour = configuration.finishHour;
    }
    return self;
}

+ (NSValueTransformer *)startHourJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^NSDate*(NSNumber *value, BOOL *success, NSError *__autoreleasing *error) {
        return [NSDate dateWithTimeIntervalSince1970:[value integerValue]];
    }];
}

+ (NSValueTransformer *)finishHourJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^NSDate*(NSNumber *value, BOOL *success, NSError *__autoreleasing *error) {
        return [NSDate dateWithTimeIntervalSince1970:[value integerValue]];
    }];
}



@end

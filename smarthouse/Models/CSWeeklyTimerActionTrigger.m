//
//  CSWeeklyTimerActionTrigger.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 01.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSWeeklyTimerActionTrigger.h"

//Category
#import "NSIndexSet+Array.h"

@implementation CSWeeklyTimerActionTrigger
@synthesize triggerType = _triggerType;


+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"uid" : @"id",
             @"triggerType" : @"type",
             @"weeks" : @"weeks",
             @"hour" : @"day_hour",
             @"weekDays" : @"week_days"
             };
}

- (instancetype)initWithConfiguration:(CSTimerTriggerConfiguration *)configuration {
    self = [super init];
    if (self) {
        _triggerType = CSActionTriggerTypeWeeklyTimer;
        
        _weeks = configuration.weeks;
        _weekDays = [configuration.weekdays arrayFromIndexes];
        _hour = configuration.dayHour;
    }
    return self;
}

+ (NSValueTransformer *)hourJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^NSDate*(NSNumber *value, BOOL *success, NSError *__autoreleasing *error) {
        return [NSDate dateWithTimeIntervalSince1970:[value integerValue]];
    }];
}

@end

//
//  CSTimerActionCellViewModel.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSTimerActionCellViewModel.h"

//Models
#import "CSWeeklyTimerActionTrigger.h"
#import "CSDailyTimerActionTrigger.h"

//Picker
#import "CSDateFormatter.h"

@implementation CSTimerActionCellViewModel

- (instancetype)initWithAction:(CSAction *)action {
    self = [super init];
    if (self) {
        _subjectName = action.subject.name;
        _subjectImageURL = action.subject.imageURL;
        
        if (action.trigger.triggerType == CSActionTriggerTypeDailyTimer) {
            _timeRemainingString = [self dailyTriggerDescription:(CSDailyTimerActionTrigger *)action.trigger];
        } else if (action.trigger.triggerType == CSActionTriggerTypeWeeklyTimer) {
            _timeRemainingString = [self weeklyTriggerDescription:(CSWeeklyTimerActionTrigger *)action.trigger];
        }
        
    }
    return self;
}

#pragma mark -
#pragma mark - Private

- (NSString *)weeklyTriggerDescription:(CSWeeklyTimerActionTrigger *)trigger {
    NSString *weeks = [NSString stringWithFormat:@"Every %d weeks", trigger.weeks];
    
    CSDateFormatter *formatter = [CSDateFormatter hourMinuteDateFormatter];
    NSString *hour = [NSString stringWithFormat:@"At %@", [formatter stringFromDate:trigger.hour]];
    
    NSString *weekDays = [self weekDaysStringFromArray:trigger.weekDays];
    
    return [NSString stringWithFormat:@"%@\n%@\n%@", weeks, weekDays, hour];
}

- (NSString *)dailyTriggerDescription:(CSDailyTimerActionTrigger *)trigger {
    CSDateFormatter *formatter = [CSDateFormatter hourMinuteDateFormatter];
    
    NSString *minutesHours = [NSString stringWithFormat:@"Every %d hours and %d minutes", trigger.hours, trigger.minutes];
    
    NSString *startHourFinishHour = [NSString stringWithFormat:@"From %@ to %@", [formatter stringFromDate:trigger.startHour],[formatter stringFromDate: trigger.finishHour]];
  
    NSString *weekDays = [self weekDaysStringFromArray:trigger.weekDays];
    
    return [NSString stringWithFormat:@"%@\n%@\n%@", minutesHours, weekDays, startHourFinishHour];

}


- (NSString *)weekDaysStringFromArray:(NSArray *)array {
    NSArray *weekDays = @[@"Mon", @"Tue", @"Wed", @"Thu", @"Fri", @"Sat", @"Sun"];
    
    NSMutableString *weekDaysString = [NSMutableString stringWithString:@"On "];
    
    for (NSNumber *day in array) {
        NSUInteger dayNum = [day unsignedIntegerValue];
        NSString *weekDay = [NSString stringWithFormat:@"%@, ",weekDays[dayNum]];
        
        [weekDaysString appendString:weekDay];
    }
    [weekDaysString deleteCharactersInRange:NSMakeRange([weekDaysString length]-2, 2)];
    
    return [weekDaysString copy];
}



@end

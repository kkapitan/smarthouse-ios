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

- (NSString *)weeklyTriggerDescription:(CSWeeklyTimerActionTrigger *)trigger {
    NSString *weeks = [NSString stringWithFormat:@"Every %d weeks", trigger.weeks];
    
    CSDateFormatter *formatter = [CSDateFormatter hourMinuteDateFormatter];
    NSString *hour = [NSString stringWithFormat:@"On %@", [formatter stringFromDate:trigger.hour]];
    
    return [NSString stringWithFormat:@"%@\n%@", weeks, hour];
}

- (NSString *)dailyTriggerDescription:(CSDailyTimerActionTrigger *)trigger {
    return nil;
}


@end

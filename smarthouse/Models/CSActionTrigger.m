//
//  CSActionTrigger.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSActionTrigger.h"

//Models
#import "CSSwitchActionTrigger.h"
#import "CSBeaconActionTrigger.h"
#import "CSDailyTimerActionTrigger.h"
#import "CSWeeklyTimerActionTrigger.h"


@interface CSActionTrigger ()
@end

@implementation CSActionTrigger

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"uid" : @"id"
            };
}

+ (Class)classForParsingJSONDictionary:(NSDictionary *)JSONDictionary {
    CSActionTriggerType triggerType = (CSActionTriggerType)[JSONDictionary[@"type"]integerValue];
    
    switch (triggerType) {
        case CSActionTriggerTypeSwitch: return [CSSwitchActionTrigger class];
        
        case CSActionTriggerTypeBeacon: return [CSBeaconActionTrigger class];
        
        case CSActionTriggerTypeWeeklyTimer: return [CSWeeklyTimerActionTrigger class];
        
        case CSActionTriggerTypeDailyTimer: return [CSDailyTimerActionTrigger class];
        
        default: return [CSSwitchActionTrigger class];
    }
}

@end

//
//  CSCreateActionParams.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 22.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSCreateActionParams.h"

@implementation CSCreateActionParams

- (instancetype)initWithAction:(CSUploadAction *)action {
    self = [super init];
    if (self) {
        _action = action;
    }
    return self;
}

- (NSDictionary *)params {
    
    NSDictionary *baseParams =  @{
             @"action_subject_id" : @(_action.subject.uid),
             @"action_type" : _action.actionType.name,
            };
    
    NSDictionary *triggerParams = [self triggerParams];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:baseParams];
    if (triggerParams) {
        [params setObject:triggerParams forKey:@"trigger"];
    }
    
    return params;
}

#pragma mark -
#pragma mark - Private

- (NSDictionary *)triggerParams {
    switch (_action.actionTrigger.triggerType) {
        case CSActionTriggerTypeSwitch:
            return [[[CSSwitchActionTriggerParams alloc] initWithActionTrigger:_action.actionTrigger] params];
            
        case CSActionTriggerTypeBeacon:
            return [[[CSBeaconActionTriggerParams alloc] initWithActionTrigger:_action.actionTrigger] params];
            
        case CSActionTriggerTypeWeeklyTimer:
            return [[[CSWeeklyTimerActionTriggerParams alloc] initWithActionTrigger:_action.actionTrigger] params];
            
        case CSActionTriggerTypeDailyTimer:
            return [[[CSDailyTimerActionTriggerParams alloc] initWithActionTrigger:_action.actionTrigger] params];
            
        default:
            return [[[CSSwitchActionTriggerParams alloc] initWithActionTrigger:_action.actionTrigger] params];
    }

}

@end

@implementation CSSwitchActionTriggerParams

- (instancetype)initWithActionTrigger:(CSActionTrigger *)actionTrigger {
    self = [super init];
    if (self) {
        _trigger = actionTrigger;
    }
    return self;
}

- (NSDictionary *)params {
    return @{
      @"type":@(_trigger.triggerType)
    };
}

@end


@implementation CSDailyTimerActionTriggerParams

- (instancetype)initWithActionTrigger:(CSActionTrigger *)actionTrigger {
    self = [super init];
    if (self) {
        _trigger = actionTrigger;
    }
    return self;
}

- (NSDictionary *)params {
    return @{
        @"type":@(_trigger.triggerType)
    };
}

@end

@implementation CSWeeklyTimerActionTriggerParams

- (instancetype)initWithActionTrigger:(CSActionTrigger *)actionTrigger {
    self = [super init];
    if (self) {
        _trigger = actionTrigger;
    }
    return self;
}

- (NSDictionary *)params {
    return @{
        @"type":@(_trigger.triggerType)
    };
}


@end

@implementation CSBeaconActionTriggerParams

- (instancetype)initWithActionTrigger:(CSActionTrigger *)actionTrigger {
    self = [super init];
    if (self) {
        _trigger = actionTrigger;
    }
    return self;
}

- (NSDictionary *)params {
    return @{
        @"type":@(_trigger.triggerType)
    };
}


@end


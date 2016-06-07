//
//  CSSwitchActionTrigger.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 01.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSSwitchActionTrigger.h"

@interface CSSwitchActionTrigger ()
@end

@implementation CSSwitchActionTrigger
@synthesize triggerType = _triggerType;

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"uid" : @"id",
             @"triggerType" : @"type"
             };
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _triggerType = CSActionTriggerTypeSwitch;
    }
    return self;
}

@end

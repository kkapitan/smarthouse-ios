//
//  CSActionTriggerTypeModel.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSActionTriggerTypeModel.h"

@implementation CSActionTriggerTypeModel

- (instancetype)initWithActionTriggerType:(CSActionTriggerType)type {
    self = [super init];
    if (self) {
        _triggerType = type;
    }
    return self;
}

- (NSString *)itemTitle {
    switch (_triggerType) {
        case CSActionTriggerTypeSwitch:
            return @"Switch";
            break;
        case CSActionTriggerTypeTimer:
            return @"Timer";
            break;
        case CSActionTriggerTypeBeacon:
            return @"Beacon";
            break;
    }
}

@end

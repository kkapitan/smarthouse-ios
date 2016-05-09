//
//  CSActionTrigger.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSActionTrigger.h"

@implementation CSActionTrigger

- (instancetype)initWithTriggerType:(CSActionTriggerType)type {
    self = [super init];
    if (self) {
        _triggerType = type;
    }
    return self;
}

@end

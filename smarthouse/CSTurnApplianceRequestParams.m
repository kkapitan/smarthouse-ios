//
//  CSTurnApplianceRequestParams.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 09.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSTurnApplianceRequestParams.h"

@implementation CSTurnApplianceRequestParams

- (instancetype)initWithAction:(CSAction *)action {
    self = [super init];
    if (self) {
        _pin = action.subject.configuration.pin;
        _state = action.actionState;
    }
    return self;
}

- (NSDictionary *)params {
    return @{
             @"pin": @(_pin),
             @"state" : @(_state)
             };
}

@end

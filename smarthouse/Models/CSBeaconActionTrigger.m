//
//  CSBeaconActionTrigger.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 01.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSBeaconActionTrigger.h"

@implementation CSBeaconActionTrigger
@synthesize triggerType = _triggerType;

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"uid" : @"id",
             @"triggerType" : @"type",
             @"beacon" : @"beacon"
             };
}

- (instancetype)initWithBeacon:(CSBeacon *)beacon {
    self = [super init];
    if (self) {
        _triggerType = CSActionTriggerTypeBeacon;
        _beacon = beacon;
    }
    return self;
}

+ (NSValueTransformer *)beaconURLJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:CSBeacon.class];
}

@end

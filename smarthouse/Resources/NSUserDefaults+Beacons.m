//
//  NSUserDefaults+Beacons.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 05.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "NSUserDefaults+Beacons.h"

@implementation NSUserDefaults (Beacons)

- (void)setBeaconState:(CLBeacon *)beacon {
    NSString *key = [self beaconKeyWithBeacon:beacon];
    
    [self setObject:@(beacon.proximity) forKey:key];
}

- (CLProximity)previousStateForBeacon:(CLBeacon *)beacon {
    NSString *key = [self beaconKeyWithBeacon:beacon];
    
    return [[self objectForKey:key] integerValue];
}

#pragma mark -
#pragma mark - Private

- (NSString *)beaconKeyWithBeacon:(CLBeacon *)beacon {
    return [beacon.major stringValue];
}

@end

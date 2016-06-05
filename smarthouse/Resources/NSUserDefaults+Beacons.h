//
//  NSUserDefaults+Beacons.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 05.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <KontaktSDK/KontaktSDK.h>

@interface NSUserDefaults (Beacons)

- (void)setBeaconState:(CLBeacon *)beacon;

- (CLProximity)previousStateForBeacon:(CLBeacon *)beacon;

@end

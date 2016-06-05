//
//  CSBeaconActionManager.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 05.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Beacons
#import "NSUserDefaults+Beacons.h"

@interface CSBeaconActionManager : NSObject

- (void)handleBeacons:(NSArray <CLBeacon *> *)beacons;

@end

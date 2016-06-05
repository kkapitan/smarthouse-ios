//
//  CSBeaconActionTrigger.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 01.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSActionTrigger.h"

//Model
#import "CSBeacon.h"

@interface CSBeaconActionTrigger : CSActionTrigger

@property (nonatomic, strong, readonly) CSBeacon *beacon;

- (instancetype)initWithBeacon:(CSBeacon *)beacon;

@end

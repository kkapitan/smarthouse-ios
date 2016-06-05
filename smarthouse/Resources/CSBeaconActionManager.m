//
//  CSBeaconActionManager.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 05.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSBeaconActionManager.h"

//Manager
#import "CSActionManager.h"

//Service
#import "CSActionSubjectsService.h"

//Trigger
#import "CSBeaconActionTrigger.h"

@interface CSBeaconActionManager ()

@property (nonatomic, strong) CSActionManager *manager;
@property (nonatomic, strong) CSActionSubjectsService *service;

@end

@implementation CSBeaconActionManager

- (instancetype)init {
    self = [super init];
    if (self) {
        _manager = [CSActionManager new];
        
        NSOperationQueue *queue = [NSOperationQueue new];
        queue.maxConcurrentOperationCount = 5;
        
        _service = [[CSActionSubjectsService alloc] initWithQueue:queue];
    }
    return self;
}

- (NSArray *)actionsForBeacon:(CLBeacon *)beacon {
    NSArray <CSAction *> *actions = [_manager actionsByType][CSActionTypeKeyBeacon];
    NSMutableArray *beaconActions = [NSMutableArray new];
    for (CSAction *action in actions) {
        CSBeacon *triggerBeacon = [(CSBeaconActionTrigger*)action.trigger beacon];
        
        if ([triggerBeacon.major integerValue] == [beacon.major integerValue]) {
            [beaconActions addObject:action];
        }
    }

    return beaconActions;
}

- (void)handleBeacons:(NSArray <CLBeacon *> *)beacons {
    [_manager reload];
    
    for (CLBeacon *beacon in beacons) {
        [self handleBeacon:beacon];
    }
}

- (void)handleBeacon:(CLBeacon *)beacon {
    if ([self shouldLaunchActions:beacon]) {
        NSArray <CSAction *> *actions = [self actionsForBeacon:beacon];
        
        for (CSAction *action in actions) {
            [_service switchActionSubject:action.subject withCompletion:^(BOOL success, CSActionSubject *subject, NSError *error) {
                success ? NSLog(@"HURRA") : NSLog(@"DUPA");
            }];
        }
    }
         
    [[NSUserDefaults standardUserDefaults] setBeaconState:beacon];
}

- (BOOL)shouldLaunchActions:(CLBeacon *)beacon {
    //return YES;
    
    CLProximity previous = [[NSUserDefaults standardUserDefaults] previousStateForBeacon:beacon];
    
    return (previous != CLProximityNear) && beacon.proximity == CLProximityNear;
}



@end

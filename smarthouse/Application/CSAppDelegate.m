//
//  CSAppDelegate.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 5/8/16
//  Copyright (c) 2014 Cappsoft. All rights reserved.
//

#import "CSAppDelegate.h"

//Fabric
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>

//KontaktIO
#import <KontaktSDK/KontaktSDK.h>

//Environment
#import "CSEnvironment.h"

//Beacons
#import "CSBeaconActionManager.h"

@interface CSAppDelegate () <KTKBeaconManagerDelegate>
@property (nonatomic, strong) KTKBeaconManager *beaconManager;
@end

@implementation CSAppDelegate

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Fabric with:@[[Crashlytics class]]];
    [Kontakt setAPIKey:[[CSEnvironment sharedConfiguration] variableForKey:kCSEnvironmentKontaktIOApiKey]];

    [self setupBeacons];
    return YES;
}

- (void)setupBeacons {
    // Initiate Beacon Manager
    self.beaconManager = [[KTKBeaconManager alloc] initWithDelegate:self];
    
    // Request Location Authorization
    [self.beaconManager requestLocationAlwaysAuthorization];
    
    NSUUID *proximityUUID = [[NSUUID alloc] initWithUUIDString:@"f7826da6-4fa2-4e98-8024-bc5b71e0893e"];
    
    // Create region instance
    KTKBeaconRegion *region = [[KTKBeaconRegion alloc] initWithProximityUUID: proximityUUID identifier:@"identifier"];
    
    // Start Monitoring
    [self.beaconManager startMonitoringForRegion: region];
    
    // You can also start ranging ...
    [self.beaconManager startRangingBeaconsInRegion: region];
}

- (void)beaconManager:(KTKBeaconManager *)manager didEnterRegion:(__kindof KTKBeaconRegion *)region {
    
}

- (void)beaconManager:(KTKBeaconManager *)manager didExitRegion:(__kindof KTKBeaconRegion *)region {
    
}

- (void)beaconManager:(KTKBeaconManager *)manager didRangeBeacons:(NSArray<CLBeacon *> *)beacons inRegion:(__kindof KTKBeaconRegion *)region {
    [[CSBeaconActionManager new] handleBeacons:beacons];
}

@end

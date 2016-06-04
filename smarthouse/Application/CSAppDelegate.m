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

@implementation CSAppDelegate

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Fabric with:@[[Crashlytics class]]];
    [Kontakt setAPIKey:[[CSEnvironment sharedConfiguration] variableForKey:kCSEnvironmentKontaktIOApiKey]];
    return YES;
}



@end

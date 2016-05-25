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

@implementation CSAppDelegate

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Fabric with:@[[Crashlytics class]]];
    return YES;
}



@end

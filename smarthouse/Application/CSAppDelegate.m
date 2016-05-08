//
//  CSAppDelegate.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 5/8/16
//  Copyright (c) 2014 Cappsoft. All rights reserved.
//

#import "CSAppDelegate.h"

#if HAS_POD(CocoaLumberjack)
    #import <CocoaLumberjack/CocoaLumberjack.h>

    #if HAS_POD(Sidecar)
    #import <Sidecar/CRLMethodLogFormatter.h>
    #endif
#endif


@implementation CSAppDelegate

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self initializeLogging];

    return YES;
}


#pragma mark Amaro foundation goodies

/**
 Sets up CocoaLumberjack
 */
-(void)initializeLogging
{
    #if HAS_POD(CocoaLumberjack)
        #if HAS_POD(Sidecar)
        CRLMethodLogFormatter *logFormatter = [[CRLMethodLogFormatter alloc] init];
        [[DDASLLogger sharedInstance] setLogFormatter:logFormatter];
        [[DDTTYLogger sharedInstance] setLogFormatter:logFormatter];
        #endif

        // Emulate NSLog behavior for DDLog*
        [DDLog addLogger:[DDASLLogger sharedInstance]];
        [DDLog addLogger:[DDTTYLogger sharedInstance]];
    #endif
}

@end

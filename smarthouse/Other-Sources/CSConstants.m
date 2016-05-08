//
//  CSConstants.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 5/8/16
//  Copyright (c) 2014 Cappsoft. All rights reserved.
//

#import "smarthouse-Environment.h"

// Use this file to define the values of the variables declared in the header.
// For data types that aren't compile-time constants (e.g. NSURL), use the
// CSConstantsInitializer function below.

// See smarthouse-Environment.h for macros that are likely applicable in
// this file. TARGETING_{STAGING,PRODUCTION} and IF_STAGING are probably
// the most useful.

// The values here are just examples.

#ifdef TARGETING_STAGING

//NSString * const CSAPIKey = @"StagingKey";

#else

//NSString * const CSAPIKey = @"ProductionKey";

#endif


//NSURL *CSAPIRoot;
void __attribute__((constructor)) CSConstantsInitializer()
{
//    CSAPIRoot = [NSURL URLWithString:IF_STAGING(@"http://myapp.com/api/staging", @"http://myapp.com/api")];
}
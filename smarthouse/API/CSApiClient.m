//
//  TCApiClient.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSApiClient.h"

//Environment
#import "CSEnvironment.h"

@implementation CSApiClient

+ (instancetype)sharedManager {
    static CSApiClient *__sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // create base URL
        NSURL *url = [[CSEnvironment sharedConfiguration] apiBaseURL];
        
        // create default HTTP Client
        __sharedInstance = [CSApiClient httpManagerWithBaseURL:url];
    });
    
    return __sharedInstance;
}

#pragma mark -
#pragma mark REST actions

+ (CSApiClient *)httpManagerWithBaseURL:(NSURL *)baseURL {
    
    // create new http client
    CSApiClient *httpManager = [[CSApiClient alloc] initWithBaseURL:baseURL];
    
    // create JSON serializer
    AFJSONRequestSerializer *jsonSerializer = [AFJSONRequestSerializer serializer];
    
    // setup default headers
    [jsonSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [jsonSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [httpManager setRequestSerializer:jsonSerializer];
    
    // update `X-AUTH-TOKEN` block
    void (^authTokenBlock)(void) = ^{
        // get auth token
        NSString *token = @"Skx1Z31rvWQaDuHBkBMG";//[[CSAccount account] authenticationToken:nil];
        
        // add HTTP header
        [jsonSerializer setValue:token forHTTPHeaderField:@"Authorization"];
    };
    
    if ([[CSAccount account] isLoggedIn]) {
        // update `X-AUTH-TOKEN`
        authTokenBlock();
    }
    
    // we should invalidate that value on every login
    [[NSNotificationCenter defaultCenter] addObserverForName:AUAccountDidLoginUserNotification object:nil queue:nil usingBlock:^(NSNotification *note) {
        // update `X-AUTH-TOKEN`
        authTokenBlock();
    }];

    
    // handle error globally
    [[NSNotificationCenter defaultCenter] addObserverForName:AFNetworkingOperationDidFinishNotification object:nil queue:nil usingBlock:^(NSNotification *note) {
        AFHTTPRequestOperation *operation = (AFHTTPRequestOperation *)[note object];
        
        // get response status code
        NSUInteger statusCode = (NSUInteger)[operation.response statusCode];
        
        // send error to Crashlytics if needed
        if (![operation.responseSerializer.acceptableStatusCodes containsIndex:statusCode] && statusCode > 99) {
            NSLog(@"HTTP Error: %lu, curl: %@", (long)[operation.response statusCode], [TTTURLRequestFormatter cURLCommandFromURLRequest:operation.request]);
        }
    }];
    
    return httpManager;
}

- (void)enqueueOperation:(NSOperation *)operation {
    [[NSOperationQueue mainQueue] addOperation:operation];
}

@end

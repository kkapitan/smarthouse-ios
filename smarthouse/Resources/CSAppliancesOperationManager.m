//
//  CSAppliancesOperationManager.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 09.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSAppliancesOperationManager.h"

@implementation CSAppliancesOperationManager

- (void)turnApplianceWithParams:(CSTurnApplianceRequestParams *)params completion:(CSAppliancesOperationManagerCompletion)block {
    
    NSURLRequest *request = [[CSApiClient sharedManager] requestTurnApplianceWithParams:params];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [CSJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *innerOperation, NSDictionary *responseObject) {
        NSLog(@"%@",[TTTURLRequestFormatter cURLCommandFromURLRequest:innerOperation.request]);
        if (block) {
            block(YES, nil);
        }
    } failure:^(AFHTTPRequestOperation *innerOperation, NSError *error) {
        if (block) {
            block(NO, error);
        }
    }];
    
    [[CSApiClient sharedManager] enqueueOperation:operation];
}

@end

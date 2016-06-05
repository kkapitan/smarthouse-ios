//
//  CSActionsService.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 22.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSActionsService.h"

//Serializers
#import "CSActionResponseSerializer.h"
#import "CSActionsResponseSerializer.h"

@implementation CSActionsService

- (void)fetchActionsWithCompletionBlock:(CSActionsServiceFetchActionsCompletionBlock)block {
    NSURLRequest *request = [[CSApiClient sharedManager] requestFetchActions];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [CSActionsResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *innerOperation, NSDictionary *responseObject) {
        if (block) {
            block(YES, responseObject[@"actions"], responseObject[@"action_types"], responseObject[@"beacons"],nil);
        }
    } failure:^(AFHTTPRequestOperation *innerOperation, NSError *error) {
        if (block) {
            block(NO, nil, nil, nil, error);
        }
    }];
    
    [[CSApiClient sharedManager] enqueueOperation:operation];
}

- (void)createAction:(CSUploadAction *)action withCompletion:(CSActionsServiceCreateActionCompletionBlock)block {
    CSCreateActionParams *params = [[CSCreateActionParams alloc] initWithAction:action];
    NSURLRequest *request = [[CSApiClient sharedManager] requestCreateActionWithParams:params];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [CSActionResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *innerOperation, NSDictionary *responseObject) {
        if (block) {
            block(YES, responseObject[@"action"], nil);
        }
    } failure:^(AFHTTPRequestOperation *innerOperation, NSError *error) {
        if (block) {
            block(NO, nil, error);
        }
    }];
    
    [[CSApiClient sharedManager] enqueueOperation:operation];
}

- (void)deleteAction:(CSAction *)action withCompletion:(CSActionsServiceDeleteActionCompletionBlock)block {
    CSDeleteActionParams *params = [[CSDeleteActionParams alloc] initWithAction:action];
    NSURLRequest *request = [[CSApiClient sharedManager] requestDeleteActionWithParams:params];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *innerOperation, NSDictionary *responseObject) {
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

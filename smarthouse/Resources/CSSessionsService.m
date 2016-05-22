//
//  CSSessionsService.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 22.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSSessionsService.h"

//Serializer
#import "CSUserResponseSerializer.h"

@implementation CSSessionsService

- (void)loginUserWithEmail:(NSString *)email password:(NSString *)password completion:(CSSessionsServiceCompletionBlock)block {
    
    CSLoginUserParams *params = [[CSLoginUserParams alloc] initWithEmail:email password:password];
    NSURLRequest *request = [[CSApiClient sharedManager] requestLoginUserWithParams:params];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [CSUserResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *innerOperation, NSDictionary *responseObject) {
        if (block) {
            block(YES, responseObject[@"user"], nil);
        }
    } failure:^(AFHTTPRequestOperation *innerOperation, NSError *error) {
        if (block) {
            block(NO, nil, error);
        }
    }];
    
    [[CSApiClient sharedManager] enqueueOperation:operation];
}

- (void)logoutUserWithCompletion:(CSSessionsServiceCompletionBlock)block {
    
    NSURLRequest *request = [[CSApiClient sharedManager] requestLogoutUser];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *innerOperation, NSDictionary *responseObject) {
        if (block) {
            block(YES, nil, nil);
        }
    } failure:^(AFHTTPRequestOperation *innerOperation, NSError *error) {
        if (block) {
            block(NO, nil, error);
        }
    }];
    
    [[CSApiClient sharedManager] enqueueOperation:operation];
}

@end

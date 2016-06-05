//
//  CSActionSubjectsService.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 22.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSActionSubjectsService.h"

//Serializers
#import "CSActionSubjectsResponseSerializer.h"
#import "CSActionSubjectResponseSerializer.h"

@interface CSActionSubjectsService ()
@property (nonatomic, strong) NSOperationQueue *queue;
@end

@implementation CSActionSubjectsService

- (instancetype)initWithQueue:(NSOperationQueue *)queue {
    self = [super init];
    if (self) {
        _queue = queue;
    }
    return self;
}

- (void)fetchActionSubjectsWithCompletion:(CSActionSubjectsCompletionBlock)block {

    NSURLRequest *request = [[CSApiClient sharedManager] requestFetchActionSubjects];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [CSActionSubjectsResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *innerOperation, NSDictionary *responseObject) {
        if (block) {
            block(YES, responseObject[@"subjects"], nil);
        }
    } failure:^(AFHTTPRequestOperation *innerOperation, NSError *error) {
        if (block) {
            block(NO, nil, error);
        }
    }];
    
    _queue ? [_queue addOperation:operation] : [[CSApiClient sharedManager] enqueueOperation:operation];
}

- (void)switchActionSubject:(CSActionSubject *)subject withCompletion:(CSActionSubjectSwitchSubjectCompletionBlock)block {
    
    NSURLRequest *request = [[CSApiClient sharedManager] requestFetchActionSubjects];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [CSActionSubjectResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *innerOperation, NSDictionary *responseObject) {
        if (block) {
            block(YES, responseObject[@"subject"], nil);
        }
    } failure:^(AFHTTPRequestOperation *innerOperation, NSError *error) {
        if (block) {
            block(NO, nil, error);
        }
    }];
    
    _queue ? [_queue addOperation:operation] : [[CSApiClient sharedManager] enqueueOperation:operation];
}

@end

//
//  TCApiClient.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

//Formater
#import "TTTURLRequestFormatter.h"

@interface CSApiClient : AFHTTPSessionManager

+ (instancetype)sharedManager;

- (void)enqueueOperation:(NSOperation *)operation;

@end

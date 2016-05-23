//
//  CSRequests.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSRequests.h"

@implementation AFHTTPSessionManager (Requests)

//Actions

- (NSMutableURLRequest *)requestFetchActions {
    return [self.requestSerializer requestWithMethod:@"GET"
                                           URLString:[NSString stringWithFormat:@"%@/actions",self.baseURL]
                                          parameters:nil
                                               error:nil];
}

- (NSMutableURLRequest *)requestCreateActionWithParams:(CSCreateActionParams *)params {
    return [self.requestSerializer requestWithMethod:@"POST"
                                           URLString:[NSString stringWithFormat:@"%@/actions",self.baseURL]
                                          parameters:params.params
                                               error:nil];
}

- (NSMutableURLRequest *)requestDeleteActionWithParams:(CSDeleteActionParams *)params {
    return [self.requestSerializer requestWithMethod:@"DELETE"
                                           URLString:[NSString stringWithFormat:@"%@/actions/%d",self.baseURL, params.action.uid]
                                          parameters:params.params
                                               error:nil];
}

//Action subjects

- (NSMutableURLRequest *)requestFetchActionSubjects {
    return [self.requestSerializer requestWithMethod:@"GET"
                                           URLString:[NSString stringWithFormat:@"%@/action_subjects",self.baseURL]
                                          parameters:nil
                                               error:nil];
}

//Sessions

- (NSMutableURLRequest *)requestLoginUserWithParams:(CSLoginUserParams *)params {
    return [self.requestSerializer requestWithMethod:@"POST"
                                           URLString:[NSString stringWithFormat:@"%@/actions",self.baseURL]
                                          parameters:params.params
                                               error:nil];
}

- (NSMutableURLRequest *)requestLogoutUser {
    return [self.requestSerializer requestWithMethod:@"DELETE"
                                           URLString:[NSString stringWithFormat:@"%@/actions",self.baseURL]
                                          parameters:nil
                                               error:nil];
}







@end

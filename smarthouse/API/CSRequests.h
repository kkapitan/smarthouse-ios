//
//  CSRequests.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

//Parameters
#import "CSLoginUserParams.h"
#import "CSCreateActionParams.h"
#import "CSDeleteActionParams.h"
#import "CSSwitchActionSubjectParams.h"

@interface AFHTTPSessionManager (Requests)

//Actions

- (NSMutableURLRequest *)requestFetchActions;
- (NSMutableURLRequest *)requestCreateActionWithParams:(CSCreateActionParams *)params;
- (NSMutableURLRequest *)requestDeleteActionWithParams:(CSDeleteActionParams *)params;

//Action subjects

- (NSMutableURLRequest *)requestFetchActionSubjects;
- (NSMutableURLRequest *)requestSwitchActionSubjectWithParams:(CSSwitchActionSubjectParams *)params;

//Sessions

- (NSMutableURLRequest *)requestLoginUserWithParams:(CSLoginUserParams *)params;
- (NSMutableURLRequest *)requestLogoutUser;

@end

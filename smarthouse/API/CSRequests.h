//
//  CSRequests.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

//Params
#import "CSTurnApplianceRequestParams.h"

@interface AFHTTPSessionManager (Requests)

- (NSMutableURLRequest *)requestTurnApplianceWithParams:(CSTurnApplianceRequestParams *)params;

@end

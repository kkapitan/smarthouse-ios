//
//  CSRequests.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSRequests.h"

@implementation AFHTTPSessionManager (Requests)

- (NSMutableURLRequest *)requestTurnApplianceWithParams:(CSTurnApplianceRequestParams *)params {
    return [self.requestSerializer requestWithMethod:@"GET"
                                           URLString:[NSString stringWithFormat:@"%@/turn",self.baseURL]
                                          parameters:params.params
                                               error:nil];
}

@end

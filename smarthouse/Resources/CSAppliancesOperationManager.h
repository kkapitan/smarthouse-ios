//
//  CSAppliancesOperationManager.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 09.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Client
#import "CSApiClient.h"

//Requests
#import "CSRequests.h"

//Serializer
#import "CSJSONResponseSerializer.h"

typedef void(^CSAppliancesOperationManagerCompletion)(BOOL success, NSError *error);

@interface CSAppliancesOperationManager : NSObject

- (void)turnApplianceWithParams:(CSTurnApplianceRequestParams *)params completion:(CSAppliancesOperationManagerCompletion)block;

@end

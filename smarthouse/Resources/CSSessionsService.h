//
//  CSSessionsService.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 22.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Model
#import "CSUser.h"

//Api
#import "CSApiClient.h"
#import "CSRequests.h"

typedef void(^CSSessionsServiceCompletionBlock)(BOOL success, CSUser *user, NSError *error);

@interface CSSessionsService : NSObject

//
- (void)loginUserWithEmail:(NSString *)email password:(NSString *)password completion:(CSSessionsServiceCompletionBlock)block;

//
- (void)logoutUserWithCompletion:(CSSessionsServiceCompletionBlock)block;

@end

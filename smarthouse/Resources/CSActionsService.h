//
//  CSActionsService.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 22.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Model
#import "CSAction.h"
#import "CSActionType.h"
#import "CSBeacon.h"
#import "CSUploadAction.h"

//Api
#import "CSApiClient.h"
#import "CSRequests.h"

typedef void(^CSActionsServiceFetchActionsCompletionBlock)(BOOL success, NSArray <NSArray <CSAction *> *> *actions, NSArray <CSActionType *> *actionTypes,  NSArray <CSBeacon *> *beacons, NSError *error);
typedef void(^CSActionsServiceCreateActionCompletionBlock)(BOOL success, CSAction *action, NSError *error);
typedef void(^CSActionsServiceDeleteActionCompletionBlock)(BOOL success, NSError *error);

@interface CSActionsService : NSObject

//
- (void)fetchActionsWithCompletionBlock:(CSActionsServiceFetchActionsCompletionBlock)block;

//
- (void)createAction:(CSUploadAction *)action withCompletion:(CSActionsServiceCreateActionCompletionBlock)block;

//
- (void)deleteAction:(CSAction *)action withCompletion:(CSActionsServiceDeleteActionCompletionBlock)block;

@end

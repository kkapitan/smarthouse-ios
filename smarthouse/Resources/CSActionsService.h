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
#import "CSUploadAction.h"

//Api
#import "CSApiClient.h"
#import "CSRequests.h"

typedef void(^CSActionsServiceFetchActionsCompletionBlock)(BOOL success, NSArray <NSArray <CSAction *> *> *actions, NSArray <CSActionType *> *actionTypes, NSError *error);
typedef void(^CSActionsServiceCompletionBlock)(BOOL success, CSAction *action, NSError *error);

@interface CSActionsService : NSObject

//
- (void)fetchActionsWithCompletionBlock:(CSActionsServiceFetchActionsCompletionBlock)block;

//
- (void)createAction:(CSUploadAction *)action withCompletion:(CSActionsServiceCompletionBlock)block;

//
- (void)deleteAction:(CSAction *)action withCompletion:(CSActionsServiceCompletionBlock)block;

@end

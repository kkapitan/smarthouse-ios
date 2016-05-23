//
//  CSAddActionViewModel.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Model
#import "CSUploadAction.h"

//Service
#import "CSActionsService.h"


typedef void(^CSAddActionSaveCompletionBlock)(BOOL success, CSAction *action, UIAlertController *alert);

@interface CSAddActionViewModel : NSObject

@property (nonatomic, strong) CSUploadAction *uploadAction;

- (NSString *)subjectName;
- (NSURL *)subjectImageURL;

- (void)saveActionWithCompletion:(CSAddActionSaveCompletionBlock)block;

@end

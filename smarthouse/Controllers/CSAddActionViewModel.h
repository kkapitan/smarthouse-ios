//
//  CSAddActionViewModel.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Model
#import "CSAction.h"
#import "CSActionTriggerTypeModel.h"

typedef void(^CSAddActionSaveCompletionBlock)(BOOL success, CSAction *action, UIAlertController *alert);

@interface CSAddActionViewModel : NSObject

@property (nonatomic, assign) CSActionTriggerTypeModel *triggerTypeModel;

@property (nonatomic, strong) CSActionSubject *subject;

- (NSString *)subjectName;
- (NSURL *)subjectImageURL;

- (void)saveActionWithCompletion:(CSAddActionSaveCompletionBlock)block;

@end

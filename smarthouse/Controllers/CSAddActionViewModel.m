//
//  CSAddActionViewModel.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSAddActionViewModel.h"

//Categories
#import "UIAlertController+Error.h"

@implementation CSAddActionViewModel

- (NSString *)subjectName {
    return _subject ? _subject.name : @"Tap to choose subject";
}

- (NSURL *)subjectImageURL {
    return _subject.imageURL;
}

- (void)saveActionWithCompletion:(CSAddActionSaveCompletionBlock)block {
    if (![self validateData]) {
        UIAlertController *alert = [UIAlertController alertWithErrorMessage:@"Invalid data!"];
        
        if (block) {
            block(NO, nil, alert);
        }
        
        return;
    }
    
    CSActionTrigger *trigger = [self buildTrigger];
    CSAction *action = [[CSAction alloc] initWithSubject:_subject trigger:trigger];
    
    if (block) {
        block(YES, action, nil);
    }
}

#pragma mark - 
#pragma mark - Private

- (BOOL)validateData {
    return _triggerTypeModel != nil && _subject != nil;
}

- (CSActionTrigger *)buildTrigger {
    CSActionTrigger *trigger = [[CSActionTrigger alloc] initWithTriggerType:_triggerTypeModel.triggerType];
    
    return trigger;
}

@end

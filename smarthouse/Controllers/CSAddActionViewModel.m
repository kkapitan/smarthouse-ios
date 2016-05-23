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
    return _uploadAction.subject ? _uploadAction.subject.name : @"Tap to choose subject";
}

- (NSURL *)subjectImageURL {
    return _uploadAction.subject.imageURL;
}

- (void)saveActionWithCompletion:(CSAddActionSaveCompletionBlock)block {
    if (![self validateData]) {
        UIAlertController *alert = [UIAlertController alertWithErrorMessage:@"Invalid data!"];
        
        if (block) {
            block(NO, nil, alert);
        }
        
        return;
    }
    
    [[CSActionsService new] createAction:_uploadAction withCompletion:^(BOOL success, CSAction *action, NSError *error) {
        if (block) {
            block(success, action, error ? [UIAlertController alertWithErrorMessage:@"Something went wrong. Please try again."] : nil);
        }
    }];
}

#pragma mark - 
#pragma mark - Private

- (BOOL)validateData {
    return _uploadAction.subject != nil;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _uploadAction = [CSUploadAction new];
    }
    return self;
}

@end

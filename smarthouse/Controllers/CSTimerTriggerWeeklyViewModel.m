//
//  CSTimerTriggerWeaklyViewModel.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 02.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSTimerTriggerWeeklyViewModel.h"

@implementation CSTimerTriggerWeeklyViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _configuration = [CSTimerTriggerConfiguration new];
    }
    return self;
}

- (void)buildTimerTriggerWithCompletion:(CSTimerTriggerViewModelCompletion)block {
    if (![self validateTrigger]) {
        if (block) {
            block(NO, nil, [UIAlertController alertWithErrorMessage:@"Error"]);
        }
        return;
    }
    
    if (block) {
        block(YES, [[CSWeeklyTimerActionTrigger alloc] initWithConfiguration:self.configuration], nil);
    }
}

#pragma mark -
#pragma mark - Private

- (BOOL)validateTrigger {
    return _configuration.dayHour != nil && _configuration.weeks > 0 && _configuration.weekdays != nil;
}

@end

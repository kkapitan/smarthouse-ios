//
//  CSAction.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSAction.h"

@implementation CSAction

- (instancetype)initWithSubject:(CSActionSubject *)subject trigger:(CSActionTrigger *)trigger actionType:(CSActionType)actionType {
    self = [super init];
    if (self) {
        _subject = subject;
        _trigger = trigger;
        _actionType = actionType;
    }
    return self;
}

- (instancetype)initWithSubject:(CSActionSubject *)subject trigger:(CSActionTrigger *)trigger {
    return [self initWithSubject:subject trigger:trigger actionType:CSActionTypeUserDriven];
}

@end

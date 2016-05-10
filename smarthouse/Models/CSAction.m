//
//  CSAction.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSAction.h"

@implementation CSAction

- (instancetype)initWithSubject:(CSActionSubject *)subject trigger:(CSActionTrigger *)trigger actionState:(CSActionState)state {
    self = [super init];
    if (self) {
        _subject = subject;
        _trigger = trigger;
        _actionState = state;
    }
    return self;
}

- (instancetype)initWithSubject:(CSActionSubject *)subject trigger:(CSActionTrigger *)trigger {
    return [self initWithSubject:subject trigger:trigger actionState:CSActionStateOff];
}

- (void)changeActionState:(CSActionState)state {
    _actionState = state;
}

@end

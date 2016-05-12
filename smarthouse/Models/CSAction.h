//
//  CSAction.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Mantle/Mantle.h>

//Models
#import "CSActionTrigger.h"
#import "CSActionSubject.h"

typedef NS_ENUM(NSUInteger, CSActionState) {
    CSActionStateOff,
    CSActionStateOn
};

@interface CSAction : MTLModel

@property (nonatomic, strong, readonly) CSActionTrigger *trigger;
@property (nonatomic, strong, readonly) CSActionSubject *subject;

@property (nonatomic, assign, readonly) CSActionState actionState;

- (instancetype)initWithSubject:(CSActionSubject *)subject trigger:(CSActionTrigger *)trigger;
- (instancetype)initWithSubject:(CSActionSubject *)subject trigger:(CSActionTrigger *)trigger actionState:(CSActionState)state;

- (void)changeActionState:(CSActionState)state;

@end
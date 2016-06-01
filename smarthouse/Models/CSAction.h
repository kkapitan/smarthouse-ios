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
#import "CSActionType.h"

typedef NS_ENUM(NSUInteger, CSActionState) {
    CSActionStateOff,
    CSActionStateOn
};

@interface CSAction : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign, readonly) NSInteger uid;

@property (nonatomic, strong, readonly) CSActionSubject *subject;
@property (nonatomic, strong, readonly) CSActionTrigger *trigger;

@end

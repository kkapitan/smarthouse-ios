//
//  CSActionTrigger.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Mantle/Mantle.h>

typedef NS_ENUM(NSUInteger, CSActionTriggerType) {
    CSActionTriggerTypeSwitch,
    CSActionTriggerTypeTimer,
    CSActionTriggerTypeBeacon
};

@interface CSActionTrigger : MTLModel

@property (nonatomic, assign, readonly) CSActionTriggerType triggerType;

- (instancetype)initWithTriggerType:(CSActionTriggerType)type;

@end

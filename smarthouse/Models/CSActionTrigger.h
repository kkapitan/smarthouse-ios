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
    CSActionTriggerTypeDailyTimer,
    CSActionTriggerTypeWeeklyTimer,
    CSActionTriggerTypeBeacon
};

@interface CSActionTrigger : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign, readonly) NSInteger uid;
@property (nonatomic, assign, readonly) CSActionTriggerType triggerType;

@end

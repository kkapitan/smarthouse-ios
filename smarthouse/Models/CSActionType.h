//
//  CSActionType.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 22.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Mantle/Mantle.h>

#import "CSPickerView.h"

typedef NS_ENUM(NSUInteger, CSActionTypeKey) {
    CSActionTypeKeySwitch,
    CSActionTypeKeyTimer,
    CSActionTypeKeyBeacon,
};

@interface CSActionType : MTLModel <MTLJSONSerializing, CSPickerItemProtocol>

@property (nonatomic, assign, readonly) CSActionTypeKey uid;
@property (nonatomic, strong, readonly) NSString *name;

@end

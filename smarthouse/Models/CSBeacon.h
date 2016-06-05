//
//  CSBeacon.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 05.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Mantle/Mantle.h>

//Picker
#import "CSPickerView.h"

@interface CSBeacon : MTLModel <MTLJSONSerializing, CSPickerItemProtocol>

@property (nonatomic, assign, readonly) NSInteger uid;
@property (nonatomic, strong, readonly) NSString *name;

@property (nonatomic, strong, readonly) NSNumber *major;

@end

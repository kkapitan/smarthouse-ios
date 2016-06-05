//
//  CSAccount.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 22.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AUAccount.h"

//Model
#import "CSActionType.h"
#import "CSBeacon.h"

@interface CSAccount : AUAccount

@property (nonatomic, strong, readonly) NSArray <CSActionType *> *actionTypes;
@property (nonatomic, strong, readonly) NSArray <CSBeacon *> *beacons;

- (void)updateActionTypes:(NSArray<CSActionType *> *)actionTypes;
- (void)updateBeacons:(NSArray<CSBeacon *> *)beacons;

@end

//
//  CSSmartHouseViewModel.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Model
#import "CSAction.h"
#import "CSActionType.h"

//View Models
#import "CSBeaconActionCellViewModel.h"
#import "CSTimerActionCellViewModel.h"
#import "CSSwitchActionCellViewModel.h"

//Account
#import "CSAccount.h"

//Service
#import "CSActionsService.h"

//Category
#import "UIAlertController+Error.h"

typedef void(^CSSmartHouseViewModelFetchActionsCompletion)(BOOL success, UIAlertController *alert);
typedef void(^CSSmartHouseViewModelDeleteActionCompletion)(BOOL success, UIAlertController *alert);

typedef NS_ENUM(NSInteger, CSSmartHouseSectionType) {
    CSSmartHouseSectionTypeSwitchActions,
    CSSmartHouseSectionTypeTimerActions,
    CSSmartHouseSectionTypeBeaconActions
};

@interface CSSmartHouseViewModel : NSObject

- (NSInteger)numberOfSections;
- (NSString *)titleForSection:(NSInteger)section;
- (NSInteger)numberOfActionsForSection:(NSInteger)section;

- (CSAction *)actionForIndexPath:(NSIndexPath *)indexPath;

- (CSBeaconActionCellViewModel *)beaconActionCellViewModelForIndexPath:(NSIndexPath *)indexPath;

- (CSSwitchActionCellViewModel *)switchActionCellViewModelForIndexPath:(NSIndexPath *)indexPath;

- (CSTimerActionCellViewModel *)timerActionCellViewModelForIndexPath:(NSIndexPath *)indexPath;

- (void)fetchActionsWithCompletion:(CSSmartHouseViewModelFetchActionsCompletion)block;
- (void)deleteActionAtIndexPath:(NSIndexPath *)indexPath completion:(CSSmartHouseViewModelDeleteActionCompletion)block;

@end

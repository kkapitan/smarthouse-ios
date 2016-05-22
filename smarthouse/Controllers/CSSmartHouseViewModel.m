//
//  CSSmartHouseViewModel.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSSmartHouseViewModel.h"

@interface CSSmartHouseViewModel ()

@property (nonatomic, strong) NSArray <CSActionType *> *actionTypes;
@property (nonatomic, strong) NSArray <NSArray <CSAction *> *> *actionsByType;

@end

@implementation CSSmartHouseViewModel

- (NSInteger)numberOfSections {
    return (NSInteger)_actionsByType.count;
}

- (NSInteger)numberOfActionsForSection:(NSInteger)section {
    return (NSInteger)_actionsByType[(NSUInteger)section].count;
}

- (NSString *)titleForSection:(NSInteger)section {
    return [[_actionTypes[(NSUInteger)section].name uppercaseString] stringByAppendingString:@" Actions"];
}

- (CSAction *)actionForIndexPath:(NSIndexPath *)indexPath {
    return _actionsByType[(NSUInteger)indexPath.section][(NSUInteger)indexPath.row];
}

- (CSBeaconActionCellViewModel *)beaconActionCellViewModelForIndexPath:(NSIndexPath *)indexPath {
    CSAction *action = [self actionForIndexPath:indexPath];
    
    return [[CSBeaconActionCellViewModel alloc] initWithAction:action];
}

- (CSSwitchActionCellViewModel *)switchActionCellViewModelForIndexPath:(NSIndexPath *)indexPath {
    CSAction *action = [self actionForIndexPath:indexPath];
    
    return [[CSSwitchActionCellViewModel alloc] initWithAction:action];
}

- (CSTimerActionCellViewModel *)timerActionCellViewModelForIndexPath:(NSIndexPath *)indexPath {
    CSAction *action = [self actionForIndexPath:indexPath];
    
    return [[CSTimerActionCellViewModel alloc] initWithAction:action];
}

- (void)fetchActionsWithCompletion:(CSSmartHouseViewModelFetchActionsCompletion)block {
    __weak typeof (self) wSelf = self;
    [[CSActionsService new] fetchActionsWithCompletionBlock:^(BOOL success, NSArray<NSArray <CSAction *> *> *actionsByActionType, NSArray <CSActionType *> *actionTypes,  NSError *error) {
        
        if (!success && error && block) {
            block(nil, [UIAlertController alertWithErrorMessage:@"Something went wrong. Please try again."]);
            return;
        }
        
        [[CSAccount account] updateActionTypes:actionTypes];
        
        wSelf.actionTypes = actionTypes;
        wSelf.actionsByType = actionsByActionType;
        
        if (block) {
            block(nil, nil);
        }
    }];
}

@end

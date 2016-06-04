//
//  CSSmartHouseViewModel.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSSmartHouseViewModel.h"

//Manager
#import "CSActionManager.h"

@interface CSSmartHouseViewModel ()

@property (nonatomic, strong) CSActionManager *manager;
@property (nonatomic, strong) NSArray <CSActionType *> *actionTypes;

@end

@implementation CSSmartHouseViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _manager = [CSActionManager new];
    }
    return self;
}

- (NSInteger)numberOfSections {
    return (NSInteger)_actionTypes.count;
}

- (NSInteger)numberOfActionsForSection:(NSInteger)section {
    return (NSInteger)_manager.actionsByType[(NSUInteger)section].count;
}

- (NSString *)titleForSection:(NSInteger)section {
    return [[_actionTypes[(NSUInteger)section].name uppercaseString] stringByAppendingString:@" Actions"];
}

- (CSAction *)actionForIndexPath:(NSIndexPath *)indexPath {
    return _manager.actionsByType[(NSUInteger)indexPath.section][(NSUInteger)indexPath.row];
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
        
        if (success) {
            [[CSAccount account] updateActionTypes:actionTypes];
            
            wSelf.actionTypes = actionTypes;
            
            [wSelf.manager setActions:actionsByActionType];
        }
        
        if (block) {
            block(success, error ? [UIAlertController alertWithError:error] : nil);
        }
    }];
}

- (void)deleteActionAtIndexPath:(NSIndexPath *)indexPath completion:(CSSmartHouseViewModelDeleteActionCompletion)block {
    CSAction *action = [self actionForIndexPath:indexPath];
    [_manager removeAction:action];
    
    [[CSActionsService new] deleteAction:action withCompletion:^(BOOL success, NSError *error) {        
        if (block) {
            block(success, error ? [UIAlertController alertWithError:error] : nil);
        }
    }];
}

- (void)switchActionSubjectAtIndexPath:(NSIndexPath *)indexPath completion:(CSSmartHouseViewModelSwitchActionSubjectCompletion)block {
    CSAction *action = [self actionForIndexPath:indexPath];
    [[CSActionSubjectsService new] switchActionSubject:action.subject withCompletion:^(BOOL success, CSActionSubject *subject, NSError *error) {
        if (block) {
            block(success, error ? [UIAlertController alertWithError:error] : nil);
        }
    }];
}

@end

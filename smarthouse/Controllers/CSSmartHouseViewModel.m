//
//  CSSmartHouseViewModel.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSSmartHouseViewModel.h"

@interface CSSmartHouseViewModel ()

@property (nonatomic, strong) NSArray <NSArray <CSAction *> *> *actionsBySection;

@end

@implementation CSSmartHouseViewModel

- (instancetype)initWithActions:(NSArray<CSAction *> *)actions {
    self = [super init];
    if (self) {
        _actionsBySection = [self groupActions:actions];
    }
    return self;
}

- (NSInteger)numberOfSections {
    return (NSInteger)_actionsBySection.count;
}

- (NSInteger)numberOfActionsForSection:(NSInteger)section {
    return (NSInteger)_actionsBySection[(NSUInteger)section].count;
}

- (NSString *)titleForSection:(NSInteger)section {
    switch (section) {
        case CSSmartHouseSectionTypeSwitchActions:
            return @"Switch Actions";
            break;
        case CSSmartHouseSectionTypeTimerActions:
            return @"Timer Actions";
            break;
        case CSSmartHouseSectionTypeBeaconActions:
            return @"Beacon Actions";
            break;
    }
    
    return @"Other Actions";
}

- (CSAction *)actionForIndexPath:(NSIndexPath *)indexPath {
    return _actionsBySection[(NSUInteger)indexPath.section][(NSUInteger)indexPath.row];
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

#pragma mark -
#pragma mark - Private

- (NSArray *)groupActions:(NSArray <CSAction *> *)actions {
    
    NSPredicate *switchPredicate = [NSPredicate predicateWithFormat:@"trigger.triggerType = %d", CSActionTriggerTypeSwitch];
    NSArray *switchActions = [actions filteredArrayUsingPredicate:switchPredicate];
    
    NSPredicate *timerPredicate = [NSPredicate predicateWithFormat:@"trigger.triggerType = %d", CSActionTriggerTypeTimer];
    NSArray *timerActions = [actions filteredArrayUsingPredicate:timerPredicate];

    
    NSPredicate *beaconPredicate = [NSPredicate predicateWithFormat:@"trigger.triggerType = %d", CSActionTriggerTypeBeacon];
    NSArray *beaconActions = [actions filteredArrayUsingPredicate:beaconPredicate];
    
    return @[switchActions, timerActions, beaconActions];
}

@end

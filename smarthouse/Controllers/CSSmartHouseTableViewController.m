//
//  CSSmartHouseTableViewController.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSSmartHouseTableViewController.h"

//Views
#import "CSSwitchActionCell.h"
#import "CSTimerActionCell.h"
#import "CSBeaconActionCell.h"
#import "MBProgressHUD.h"

//View Model
#import "CSSmartHouseViewModel.h"

//Categories
#import "UITableViewController+IndexPath.h"

//Operations
#import "CSAppliancesOperationManager.h"

//Bootstrap
#import "CSBootstrap.h"

@interface CSSmartHouseTableViewController ()

@property (nonatomic, strong) CSSmartHouseViewModel *viewModel;

@end

@implementation CSSmartHouseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 76.0f;
    [self registerCells];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    NSArray *actions = [CSBootstrap sharedInstance].actions;
    _viewModel = [[CSSmartHouseViewModel alloc] initWithActions:actions];

    [self.tableView reloadData];
}

#pragma mark -
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.viewModel numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfActionsForSection:section];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.viewModel numberOfActionsForSection:section] ? [self.viewModel titleForSection:section] : @"";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [self.viewModel numberOfActionsForSection:section] ? UITableViewAutomaticDimension : CGFLOAT_MIN;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == CSSmartHouseSectionTypeSwitchActions) {
        
        NSString *reuseIdentifier = [CSSwitchActionCell reuseIdentifier];
        CSSwitchActionCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
        
        CSSwitchActionCellViewModel *cellViewModel = [self.viewModel switchActionCellViewModelForIndexPath:indexPath];
        
        [cell populateWithViewModel:cellViewModel];
        [cell.actionSwitch addTarget:self action:@selector(switchValueChangedAction:forEvent:) forControlEvents:UIControlEventValueChanged];
        
        return cell;
    } else if (indexPath.section == CSSmartHouseSectionTypeTimerActions) {
        
        NSString *reuseIdentifier = [CSTimerActionCell reuseIdentifier];
        CSTimerActionCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
        
        CSTimerActionCellViewModel *cellViewModel = [self.viewModel timerActionCellViewModelForIndexPath:indexPath];
        [cell populateWithViewModel:cellViewModel];
        
        return cell;
    } else {
        NSString *reuseIdentifier = [CSBeaconActionCell reuseIdentifier];
        CSBeaconActionCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
        
        CSBeaconActionCellViewModel *cellViewModel = [self.viewModel beaconActionCellViewModelForIndexPath:indexPath];
        [cell populateWithViewModel:cellViewModel];
        
        return cell;
    }
}

#pragma mark -
#pragma mark - Actions

- (void)switchValueChangedAction:(UISwitch *)actionSwitch forEvent:(UIEvent *)event {
    NSIndexPath *indexPath = [self indexPathForEvent:event];
    
    CSAction *action = [self.viewModel actionForIndexPath:indexPath];
    CSActionState newState = actionSwitch.on ? CSActionStateOn : CSActionStateOff;
    
    [action changeActionState:newState];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    __weak typeof(self) wSelf = self;
    CSTurnApplianceRequestParams *params = [[CSTurnApplianceRequestParams alloc] initWithAction:action];
    [[CSAppliancesOperationManager new] turnApplianceWithParams:params completion:^(BOOL success, NSError *error) {
        [MBProgressHUD hideHUDForView:wSelf.view animated:YES];
    }];
}

#pragma mark -
#pragma mark - Private

- (void)registerCells {
    [self.tableView registerNib:[CSSwitchActionCell nib] forCellReuseIdentifier:[CSSwitchActionCell reuseIdentifier]];
    [self.tableView registerNib:[CSTimerActionCell nib] forCellReuseIdentifier:[CSTimerActionCell reuseIdentifier]];
    [self.tableView registerNib:[CSBeaconActionCell nib] forCellReuseIdentifier:[CSBeaconActionCell reuseIdentifier]];
}

@end

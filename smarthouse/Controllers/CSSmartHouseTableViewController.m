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
    
    [self setupViewModel];
}

- (void)setupViewModel {
    _viewModel = [CSSmartHouseViewModel new];
    
    __weak typeof (self) wSelf = self;
    [_viewModel fetchActionsWithCompletion:^(BOOL success, UIAlertController *alert) {
        if (alert) {
            [wSelf presentViewController:alert animated:YES completion:nil];
            return ;
        }
        
        [wSelf.tableView reloadData];
    }];
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
        
        cell.actionSwitch.tag = indexPath.row;
        //[cell.actionSwitch addTarget:self action:@selector(switchValueChangedAction:) forControlEvents:UIControlEventValueChanged];
        
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
#pragma mark - UITableViewDelegate 

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        __weak typeof (self) wSelf = self;
        [self.viewModel deleteActionAtIndexPath:indexPath completion:^(BOOL success, UIAlertController *alert) {
            if (!success && alert) {
                [wSelf presentViewController:alert animated:YES completion:nil];
                return ;
            }
            
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }];
    }
}

#pragma mark -
#pragma mark - Actions

- (void)switchValueChangedAction:(UISwitch *)actionSwitch {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    __weak typeof (self) wSelf = self;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:actionSwitch.tag inSection:CSSmartHouseSectionTypeSwitchActions];
    
    [self.viewModel switchActionSubjectAtIndexPath:indexPath completion:^(BOOL success, UIAlertController *alert) {
        [MBProgressHUD hideHUDForView:wSelf.view animated:YES];
        
        if (!success && alert) {
            [wSelf presentViewController:alert animated:YES completion:nil];
            return;
        }
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

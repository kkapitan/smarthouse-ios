//
//  CSPickSubjectViewController.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSPickSubjectViewController.h"

//View Model
#import "CSPickSubjectViewModel.h"

//View
#import "CSPickSubjectCell.h"

//Bootstrap
#import "CSBootstrap.h"

@interface CSPickSubjectViewController ()
@property (nonatomic, strong) CSPickSubjectViewModel *viewModel;
@end

@implementation CSPickSubjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *subjects = [[CSBootstrap sharedInstance] subjects];
    _viewModel = [[CSPickSubjectViewModel alloc] initWithActionSubjects:subjects];
    
    [self.tableView registerNib:[CSPickSubjectCell nib]
         forCellReuseIdentifier:[CSPickSubjectCell reuseIdentifier]];
    
    self.tableView.rowHeight = [CSPickSubjectCell height];
}

#pragma mark - 
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfSubjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseIdentifier = [CSPickSubjectCell reuseIdentifier];
    CSPickSubjectCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    CSPickSubjectCellViewModel *cellViewModel = [self.viewModel cellViewModelForIndexPath:indexPath];
    [cell populateWithViewModel:cellViewModel];
    
    return cell;
}

#pragma mark -
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CSActionSubject *subject = [self.viewModel actionSubjectForIndexPath:indexPath];
    
    [self.delegate subjectPicker:self didPickActionSubject:subject];
    [self.navigationController popViewControllerAnimated:YES];
}

@end

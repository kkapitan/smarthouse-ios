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

@interface CSPickSubjectViewController ()
@property (nonatomic, strong) CSPickSubjectViewModel *viewModel;
@end

@implementation CSPickSubjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[CSPickSubjectCell nib]
         forCellReuseIdentifier:[CSPickSubjectCell reuseIdentifier]];
    
    self.tableView.rowHeight = [CSPickSubjectCell height];
    
    [self setupViewModel];
}

- (void)setupViewModel {
    _viewModel = [CSPickSubjectViewModel new];
    
    __weak typeof (self) wSelf = self;
    [_viewModel fetchActionSubjectsWithCompletion:^(NSArray<CSActionSubject *> *subjects, UIAlertController *alert) {
        if (alert) {
            [wSelf presentViewController:alert animated:YES completion:nil];
            return ;
        }
        
        [wSelf.tableView reloadData];
    }];
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

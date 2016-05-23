//
//  CSAddActionViewController.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSAddActionViewController.h"

//View Model
#import "CSAddActionViewModel.h"

//Views
#import "CSPickerView.h"

//Controllers
#import "CSPickSubjectViewController.h"

//Category
#import "UIImageView+AFNetworking.h"

@interface CSAddActionViewController () <CSPickSubjectDelegate>

@property (weak, nonatomic) IBOutlet UILabel *subjectNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *subjectImageView;

@property (weak, nonatomic) IBOutlet UITextField *triggerTypeTextField;

@property (nonatomic, strong) CSAddActionViewModel *viewModel;
@end

@implementation CSAddActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _viewModel = [CSAddActionViewModel new];
    
    [self setupTextFields];
    [self reloadData];
}

#pragma mark -
#pragma mark - CSPickSubjectDelegate

- (void)subjectPicker:(CSPickSubjectViewController *)picker didPickActionSubject:(CSActionSubject *)subject {
    self.viewModel.uploadAction.subject = subject;
    
    [self reloadData];
}

- (IBAction)saveButtonAction:(id)sender {
    
    __weak typeof(self) wSelf = self;
    [self.viewModel saveActionWithCompletion:^(BOOL success, CSAction *action, UIAlertController *alert) {
        if (!success && alert) {
            [wSelf presentViewController:alert animated:YES completion:nil];
            return ;
        }
        
        [wSelf.navigationController popViewControllerAnimated:YES];
    }];
}

- (IBAction)tapGestureAction:(id)sender {
    [self.view endEditing:YES];
}

#pragma mark -
#pragma mark - Private

- (void)reloadData {
    [_subjectImageView setImageWithURL:self.viewModel.subjectImageURL placeholderImage:nil];
    
    _subjectNameLabel.text = [self.viewModel subjectName];
}

- (void)setupTextFields {
    NSArray *triggerTypeItems = [[CSAccount account] actionTypes];
    
    CSPickerView *pickerView = [[CSPickerView alloc] initWithItems:triggerTypeItems];
    __weak typeof(self) wSelf = self;
    
    pickerView.pickItemBlock = ^(CSActionType *actionType) {
        wSelf.triggerTypeTextField.text = actionType.name;
        
        [wSelf reloadData];
    };
    
    self.triggerTypeTextField.inputView = pickerView;
}

#pragma mark -
#pragma mark - Navigation

static NSString *const CSPickSubjectSegueIdentifier = @"CSPickSubjectSegue";

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:CSPickSubjectSegueIdentifier]) {
        CSPickSubjectViewController *pickSubjectViewController = segue.destinationViewController;
        pickSubjectViewController.delegate = self;
    }
}

@end

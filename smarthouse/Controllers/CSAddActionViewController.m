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

//Bootstrap
#import "CSBootstrap.h"

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
    _viewModel.triggerTypeModel = [[CSBootstrap sharedInstance] triggerTypes][0];
    
    [self setupTextFields];
    [self reloadData];
}

#pragma mark -
#pragma mark - CSPickSubjectDelegate

- (void)subjectPicker:(CSPickSubjectViewController *)picker didPickActionSubject:(CSActionSubject *)subject {
    self.viewModel.subject = subject;
    
    [self reloadData];
}
- (IBAction)saveButtonAction:(id)sender {
    
    __weak typeof(self) wSelf = self;
    [self.viewModel saveActionWithCompletion:^(BOOL success, CSAction *action, UIAlertController *alert) {
        if (!success && alert) {
            [wSelf presentViewController:alert animated:YES completion:nil];
            return ;
        }
        
        [[CSBootstrap sharedInstance] addAction:action];
        [wSelf.navigationController popViewControllerAnimated:YES];
    }];
}

- (IBAction)tapGestureAction:(id)sender {
    [self.view endEditing:YES];
}

#pragma mark -
#pragma mark - Private

- (void)reloadData {
    
    _subjectNameLabel.text = [self.viewModel subjectName];
    _subjectImageView.image = [self.viewModel subjectImage];
    
    _triggerTypeTextField.text = [self.viewModel.triggerTypeModel itemTitle];
}

- (void)setupTextFields {
    NSArray *triggerTypeItems = [[CSBootstrap sharedInstance] triggerTypes];
    
    CSPickerView *pickerView = [[CSPickerView alloc] initWithItems:triggerTypeItems];
    __weak typeof(self) wSelf = self;
    
    pickerView.pickItemBlock = ^(CSActionTriggerTypeModel *triggerTypeModel) {
        wSelf.viewModel.triggerTypeModel = triggerTypeModel;
        
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

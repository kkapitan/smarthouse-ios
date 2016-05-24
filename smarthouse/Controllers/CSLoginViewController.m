//
//  CSLoginViewController.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 23.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSLoginViewController.h"

//View Model
#import "CSLoginViewModel.h"

//View
#import "MBProgressHUD.h"

//Wireframe
#import "CSWireframe.h"

@interface CSLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (nonatomic, strong) CSLoginViewModel *viewModel;

@end

@implementation CSLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _viewModel = [CSLoginViewModel new];
}

- (IBAction)textFieldDidChangeText:(UITextField *)textField {
    _viewModel.password = _passwordTextField.text;
    _viewModel.email = _emailTextField.text;
}

- (IBAction)loginAction:(id)sender {
    __weak typeof (self) wSelf = self;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [_viewModel loginWithCompletion:^(BOOL success, UIAlertController *alert) {
        [MBProgressHUD hideHUDForView:wSelf.view animated:YES];
        
        if (!success && alert) {
            [wSelf presentViewController:alert animated:YES completion:nil];
            return ;
        }
        
        CSSmartHouseTableViewController *smartHouseViewController = [[CSWireFrame new] smartHouseViewController];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:smartHouseViewController];
        
        [self presentViewController:navigationController animated:YES completion:^{
            [[[UIApplication sharedApplication] keyWindow] setRootViewController:navigationController];
        }];
    }];
}

@end

//
//  CSLoginViewModel.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 23.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSLoginViewModel.h"

//Service
#import "CSSessionsService.h"

//Account
#import "CSAccount.h"

//Categories
#import "NSString+Validation.h"
#import "UIAlertController+Error.h"

@implementation CSLoginViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _password = @"";
        _email = @"";
    }
    return self;
}

- (void)loginWithCompletion:(CSLoginViewModelLoginCompletion)block {
    NSError *error;
    if (![self validateData:&error]) {
        if (block) {
            block(NO, [UIAlertController alertWithError:error]);
        }
        return;
    }
    
    [[CSSessionsService new] loginUserWithEmail:_email
                                       password:_password
                                     completion:^(BOOL success, CSUser *user, NSError *apiError) {
                                         if (success) {
                                             [[CSAccount account] registerAccountWithAuthenticationToken:user.authToken
                                                                                          expirationDate:nil
                                                                                             accountType:AUAccountTypeCustom
                                                                                                   error:nil];
                                             [[CSAccount account] updateUser:user];
                                         }
                                         
                                         if (block) {
                                             block(success, apiError ? [UIAlertController alertWithError:apiError] : nil);
                                         }
                                     }];
}

#pragma mark -
#pragma mark - Private

- (BOOL)validateData:(NSError **)error {
    return [self.email isValidEmail:error] && [self.password isValidPassword:error];
}

@end

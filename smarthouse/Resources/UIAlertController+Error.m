//
//  UIAlertController+Error.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 09.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "UIAlertController+Error.h"

@implementation UIAlertController (Error)

+ (UIAlertController *)alertWithError:(NSError *)error {
    NSString *message = error.userInfo[@"message"] ?: @"Something went wrong. Please try again later.";
    
    return [self alertWithErrorMessage:message];
}

+ (UIAlertController *)alertWithErrorMessage:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error!" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:okAction];
    
    return alert;
}

@end

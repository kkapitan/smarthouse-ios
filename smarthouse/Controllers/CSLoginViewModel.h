//
//  CSLoginViewModel.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 23.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CSLoginViewModelLoginCompletion)(BOOL success, UIAlertController *alert);

@interface CSLoginViewModel : NSObject

@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *email;

- (void)loginWithCompletion:(CSLoginViewModelLoginCompletion)block;

@end

//
//  CSLoginUserParams.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 22.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSLoginUserParams.h"

@implementation CSLoginUserParams

- (instancetype)initWithEmail:(NSString *)email password:(NSString *)password {
    self = [super init];
    if (self) {
        _email = email;
        _password = password;
    }
    return self;
}

- (NSDictionary *)params {
    return @{
        @"email": _email,
        @"password": _password
    };
}

@end

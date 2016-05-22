//
//  CSAccount.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 22.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSAccount.h"

@implementation CSAccount

- (BOOL)isLoggedIn {
    return YES;
}

- (void)updateActionTypes:(NSArray<CSActionType *> *)actionTypes {
    _actionTypes = actionTypes;
}

@end

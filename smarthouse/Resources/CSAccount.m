//
//  CSAccount.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 22.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSAccount.h"

//Storage
#import "CSDocumentsManager.h"
#import "FastCoder.h"

@interface CSAccount ()
@property (nonatomic, strong) CSDocumentsManager *documentManager;
@end

@implementation CSAccount

- (instancetype)init {
    self = [super init];
    if (self) {
        _documentManager = [[CSDocumentsManager alloc] initWithStorageName:@"cs.account.actiontypes.store"];
        
        NSData *data = [_documentManager read];
        _actionTypes = [FastCoder objectWithData:data];
        
        self.accountName = @"cs.account.smarthouse";
        self.serviceName = @"cs.account.smarthouse";
    }
    return self;
}

- (BOOL)isLoggedIn {
    return self.user != nil;
}

- (void)updateActionTypes:(NSArray<CSActionType *> *)actionTypes {
    if (_actionTypes != nil) {
        [_documentManager write:[FastCoder dataWithRootObject:actionTypes]];
    }
    _actionTypes = actionTypes;
}

@end

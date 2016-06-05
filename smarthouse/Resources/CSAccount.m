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
@property (nonatomic, strong) CSDocumentsManager *actionTypesDocument;
@property (nonatomic, strong) CSDocumentsManager *beaconsDocument;
@end

@implementation CSAccount

- (instancetype)init {
    self = [super init];
    if (self) {
        _actionTypesDocument = [[CSDocumentsManager alloc] initWithStorageName:@"cs.account.actiontypes.store"];
        
        _beaconsDocument = [[CSDocumentsManager alloc] initWithStorageName:@"cs.account.beacons.store"];
        
        NSData *actionTypesData = [_actionTypesDocument read];
        _actionTypes = [FastCoder objectWithData:actionTypesData];
        
        NSData *beaconsData = [_beaconsDocument read];
        _beaconsDocument = [FastCoder objectWithData:beaconsData];
        
        self.accountName = @"cs.account.smarthouse";
        self.serviceName = @"cs.account.smarthouse";
    }
    return self;
}

- (BOOL)isLoggedIn {
    return self.user != nil;
}

- (void)updateActionTypes:(NSArray<CSActionType *> *)actionTypes {
    if (actionTypes != nil) {
        [_actionTypesDocument write:[FastCoder dataWithRootObject:actionTypes]];
    }
    _actionTypes = actionTypes;
}

- (void)updateBeacons:(NSArray<CSBeacon *> *)beacons {
    if (beacons != nil) {
        [_beaconsDocument write:[FastCoder dataWithRootObject:beacons]];
    }
    _beacons = beacons;
}

@end

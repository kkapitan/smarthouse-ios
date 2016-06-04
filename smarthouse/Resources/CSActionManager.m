//
//  CSActionManager.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 04.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSActionManager.h"

//Storage
#import "FastCoder.h"
#import "CSDocumentsManager.h"

@interface CSActionManager ()

@property (nonatomic, strong) NSMutableArray <NSMutableArray<CSAction *> *> *actionsByType;
@property (nonatomic, strong) CSDocumentsManager *documentsManager;

@end

@implementation CSActionManager

- (instancetype)initWithActionTypes:(NSArray *)actionTypes {
    self = [super init];
    if (self) {
        _documentsManager = [[CSDocumentsManager alloc] initWithStorageName:[self persistentStoreName]];
        
        NSData *data = [_documentsManager read];
        NSArray *objects = [FastCoder objectWithData:data];
        
        _actionsByType = objects ? [NSMutableArray arrayWithArray:objects] : [NSMutableArray arrayWithCapacity:actionTypes.count];
    }
    return self;
}

- (NSArray <NSArray<CSAction *> *> *)actionsByType {
    return [_actionsByType copy];
}

- (void)updateAction:(CSAction *)action {
    @synchronized (self) {
        CSAction *oldAction = [self findAction:action];
        
        [_actionsByType[(NSUInteger)oldAction.actionType.uid] removeObject:oldAction];
        [_actionsByType[(NSUInteger)action.actionType.uid] addObject:action];
        
        [self save];
    }
}

- (void)removeAction:(CSAction *)action {
    @synchronized (self) {
        CSAction *oldAction = [self findAction:action];
        
        [_actionsByType[(NSUInteger)oldAction.actionType.uid] removeObject:oldAction];
        
        [self save];
    }
}

- (void)addActions:(NSMutableArray<CSAction *> *)actions {
    @synchronized(self) {
        for (CSAction *action in _actionsByType) {
            
            CSAction *oldAction = [self findAction:action];
            [_actionsByType[(NSUInteger)oldAction.actionType.uid] removeObject:oldAction];
            
            [_actionsByType[(NSUInteger)action.actionType.uid] addObject:action];
        }

        [self save];
    }
}

#pragma mark -
#pragma mark - Private

- (CSAction *)findAction:(CSAction *)action {
    for (NSArray *actions in _actionsByType) {
        for (CSAction *innerAction in actions) {
            if (innerAction.uid == action.uid) {
                return innerAction;
            }
        }
    }
    return nil;
}

- (void)save {
    if (self.actionsByType.count) {
        NSData *data = [FastCoder dataWithRootObject:self.actionsByType];
        [_documentsManager write:data];
    }
}

- (NSString *)persistentStoreName {
    return @"cs_smarthouse_actions.store";
}

@end

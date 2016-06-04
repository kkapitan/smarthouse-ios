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

@property (nonatomic, strong) NSMutableArray <NSArray <CSAction *> *> *actionsByType;
@property (nonatomic, strong) CSDocumentsManager *documentsManager;

@end

@implementation CSActionManager

- (instancetype)init {
    self = [super init];
    if (self) {
        _documentsManager = [[CSDocumentsManager alloc] initWithStorageName:[self persistentStoreName]];
        
        NSData *data = [_documentsManager read];
        NSArray *objects = [FastCoder objectWithData:data];
        
        if (objects) {
            _actionsByType = [objects mutableCopy];
        }

    }
    return self;
}

- (NSArray <NSArray<CSAction *> *> *)actionsByType {
    return [_actionsByType copy];
}

- (void)setActions:(NSArray <NSArray <CSAction *> *> *)actions {
    @synchronized (self) {
        _actionsByType = [actions mutableCopy];
    
        [self save];
    }
}

- (void)updateAction:(CSAction *)action {
    @synchronized (self) {
        CSAction *oldAction = [self findAction:action];
        
        [self safelyRemoveAction:oldAction];
        [self safelyAddAction:action];
        
        [self save];
    }
}

- (void)removeAction:(CSAction *)action {
    @synchronized (self) {
        CSAction *oldAction = [self findAction:action];
        
        [self safelyRemoveAction:oldAction];
        
        [self save];
    }
}

- (void)addActions:(NSArray<CSAction *> *)actions {
    @synchronized(self) {
        for (CSAction *action in actions) {
            
            CSAction *oldAction = [self findAction:action];
            [self safelyRemoveAction:oldAction];
            
            [self safelyAddAction:action];
        }

        [self save];
    }
}

#pragma mark -
#pragma mark - Private
         
- (void)safelyRemoveAction:(CSAction *)action {
    _actionsByType[(NSUInteger)action.actionType.uid] = [_actionsByType[(NSUInteger)action.actionType.uid] mtl_arrayByRemovingObject:action];
}
         
- (void)safelyAddAction:(CSAction *)action {
    _actionsByType[(NSUInteger)action.actionType.uid] = [_actionsByType[(NSUInteger)action.actionType.uid] arrayByAddingObject:action];
}
         
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

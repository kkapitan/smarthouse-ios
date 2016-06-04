//
//  CSActionManager.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 04.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Model
#import "CSAction.h"

@interface CSActionManager : NSObject

//
- (instancetype)initWithActionTypes:(NSArray *)actionTypes;

//
- (NSArray <NSArray<CSAction *> *> *)actionsByType;

//
- (void)updateAction:(CSAction *)action;

//
- (void)removeAction:(CSAction *)action;

//
- (void)addActions:(NSMutableArray<CSAction *> *)actions;

@end

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
- (NSArray <NSArray<CSAction *> *> *)actionsByType;

//
- (void)setActions:(NSArray <NSArray <CSAction *> *> *)actions;

//
- (void)updateAction:(CSAction *)action;

//
- (void)removeAction:(CSAction *)action;

//
- (void)addActions:(NSArray<CSAction *> *)actions;

//
- (void)reload;

@end

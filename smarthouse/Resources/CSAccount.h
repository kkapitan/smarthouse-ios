//
//  CSAccount.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 22.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AUAccount.h"

//Model
#import "CSActionType.h"

@interface CSAccount : AUAccount

@property (nonatomic, strong) NSArray <CSActionType *> *actionTypes;

- (void)updateActionTypes:(NSArray<CSActionType *> *)actionTypes;

@end

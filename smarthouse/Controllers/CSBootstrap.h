//
//  CSBootstrap.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Mantle/Mantle.h>

//Model
#import "CSAction.h"
#import "CSActionTriggerTypeModel.h"

@interface CSBootstrap : MTLModel

@property (nonatomic, strong, readonly) NSArray <CSActionSubject *> *subjects;
@property (nonatomic, strong, readonly) NSArray <CSAction *> *actions;
@property (nonatomic, strong, readonly) NSArray <CSActionTriggerTypeModel *> *triggerTypes;

+ (instancetype)sharedInstance;

- (void)addAction:(CSAction *)action;

@end

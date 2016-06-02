//
//  CSUploadAction.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 22.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Mantle/Mantle.h>

//Action
#import "CSAction.h"

@interface CSUploadAction : MTLModel

@property (nonatomic, strong) CSActionSubject *subject;
@property (nonatomic, strong) CSActionType *actionType;
@property (nonatomic, strong) CSActionTrigger *actionTrigger;

@end

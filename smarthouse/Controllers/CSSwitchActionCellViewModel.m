//
//  CSSwitchActionCellViewModel.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSSwitchActionCellViewModel.h"

//Operations
#import "CSAppliancesOperationManager.h"

@interface CSSwitchActionCellViewModel ()

@property (nonatomic, strong) CSAction *action;
@property (nonatomic, strong) CSAppliancesOperationManager *manager;

@end

@implementation CSSwitchActionCellViewModel

- (instancetype)initWithAction:(CSAction *)action {
    self = [super init];
    if (self) {
        _subjectName = action.subject.name;
        _subjectImage = action.subject.image;
        
        _action = action;
        _manager = [CSAppliancesOperationManager new];
    }
    return self;
}

- (void)switchAction:(BOOL)switchedOn {
    [_action changeActionState:switchedOn ? CSActionStateOn : CSActionStateOff];
    
    CSTurnApplianceRequestParams *params = [[CSTurnApplianceRequestParams alloc] initWithAction:_action];
    [_manager turnApplianceWithParams:params completion:^(BOOL success, NSError *error) {
        NSLog(@"%@",error);
    }];
}

@end

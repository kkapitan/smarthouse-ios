//
//  CSSwitchActionCellViewModel.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSSwitchActionCellViewModel.h"

@interface CSSwitchActionCellViewModel ()

@property (nonatomic, strong) CSAction *action;

@end

@implementation CSSwitchActionCellViewModel

- (instancetype)initWithAction:(CSAction *)action {
    self = [super init];
    if (self) {
        _subjectName = action.subject.name;
        _subjectImage = action.subject.image;
        
        _action = action;
    }
    return self;
}

- (void)switchAction:(BOOL)switchedOn {
    
}

@end

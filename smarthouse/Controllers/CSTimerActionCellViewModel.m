//
//  CSTimerActionCellViewModel.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSTimerActionCellViewModel.h"

@implementation CSTimerActionCellViewModel

- (instancetype)initWithAction:(CSAction *)action {
    self = [super init];
    if (self) {
        _subjectName = action.subject.name;
        _subjectImage = action.subject.image;
        
        _timeRemainingString = @"Not available yet";
    }
    return self;
}

@end

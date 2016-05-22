//
//  CSBeaconActionCellViewModel.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSBeaconActionCellViewModel.h"

@implementation CSBeaconActionCellViewModel

- (instancetype)initWithAction:(CSAction *)action {
    self = [super init];
    if (self) {
        _subjectName = action.subject.name;
        _subjectImageURL = action.subject.imageURL;
        
        _beaconInfoString = @"Not yet available";
    }
    return self;
}

@end

//
//  CSPickSubjectCellViewModel.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSPickSubjectCellViewModel.h"

@implementation CSPickSubjectCellViewModel

- (instancetype)initWitActionSubject:(CSActionSubject *)subject {
    self = [super init];
    if (self) {
        _subjectName = subject.name;
        _subjectImageURL = subject.imageURL;
    }
    return self;
};

@end

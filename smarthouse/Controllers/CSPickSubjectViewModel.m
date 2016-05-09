//
//  CSPickSubjectViewModel.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSPickSubjectViewModel.h"

@interface CSPickSubjectViewModel ()
@property (nonatomic, strong) NSArray <CSActionSubject *> *subjects;
@end

@implementation CSPickSubjectViewModel

- (instancetype)initWithActionSubjects:(NSArray<CSActionSubject *> *)subjects {
    self = [super init];
    if (self) {
        _subjects = subjects;
    }
    return self;
}

- (NSInteger)numberOfSubjects {
    return (NSInteger)_subjects.count;
}

- (CSPickSubjectCellViewModel *)cellViewModelForIndexPath:(NSIndexPath *)indexPath {
    CSActionSubject *subject = [self actionSubjectForIndexPath:indexPath];
    
    return [[CSPickSubjectCellViewModel alloc] initWitActionSubject:subject];
}

- (CSActionSubject *)actionSubjectForIndexPath:(NSIndexPath *)indexPath {
    return _subjects[(NSUInteger)indexPath.row];
}

@end

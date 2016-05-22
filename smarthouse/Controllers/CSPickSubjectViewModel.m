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

- (void)fetchActionSubjectsWithCompletion:(CSPickSubjectViewModelFetchSubjectsCompletion)block {
    
    __weak typeof (self) wSelf = self;
    [[CSActionSubjectsService new] fetchActionSubjectsWithCompletion:^(BOOL success, NSArray<CSActionSubject *> *subjects, NSError *error) {
        if (!success && error && block) {
            block(nil, [UIAlertController alertWithErrorMessage:@"Something went wrong. Please try again."]);
            
            return;
        }
        
        wSelf.subjects = subjects;
        if (block) {
            block([wSelf.subjects copy], nil);
        }
    }];
}

@end

//
//  CSPickSubjectViewModel.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Model
#import "CSActionSubject.h"

//View Model
#import "CSPickSubjectCellViewModel.h"

//Service
#import "CSActionSubjectsService.h"

//Category
#import "UIAlertController+Error.h"

typedef void(^CSPickSubjectViewModelFetchSubjectsCompletion)(NSArray <CSActionSubject *> *subjects, UIAlertController *alert);

@interface CSPickSubjectViewModel : NSObject

- (NSInteger)numberOfSubjects;

- (CSActionSubject *)actionSubjectForIndexPath:(NSIndexPath *)indexPath;
- (CSPickSubjectCellViewModel *)cellViewModelForIndexPath:(NSIndexPath *)indexPath;

- (void)fetchActionSubjectsWithCompletion:(CSPickSubjectViewModelFetchSubjectsCompletion)block;

@end

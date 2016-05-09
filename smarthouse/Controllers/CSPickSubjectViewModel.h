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

@interface CSPickSubjectViewModel : NSObject

- (NSInteger)numberOfSubjects;

- (CSActionSubject *)actionSubjectForIndexPath:(NSIndexPath *)indexPath;
- (CSPickSubjectCellViewModel *)cellViewModelForIndexPath:(NSIndexPath *)indexPath;

- (instancetype)initWithActionSubjects:(NSArray <CSActionSubject *> *)subjects;

@end

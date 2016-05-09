//
//  CSPickSubjectCellViewModel.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Model
#import "CSActionSubject.h"

@interface CSPickSubjectCellViewModel : NSObject

@property (nonatomic, strong, readonly) NSString *subjectName;
@property (nonatomic, strong, readonly) UIImage *subjectImage;

- (instancetype)initWitActionSubject:(CSActionSubject *)subject;

@end

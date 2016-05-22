//
//  CSActionSubjectsService.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 22.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Model
#import "CSActionSubject.h"

//Api
#import "CSApiClient.h"
#import "CSRequests.h"

typedef void(^CSActionSubjectsCompletionBlock)(BOOL success, NSArray <CSActionSubject *> *subjects, NSError *error);

@interface CSActionSubjectsService : NSObject

- (void)fetchActionSubjectsWithCompletion:(CSActionSubjectsCompletionBlock)block;

@end

//
//  CSSwitchActionSubjectParams.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 24.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Protocol
#import "CSRequestParamsProtocol.h"

//ActionSubject
#import "CSActionSubject.h"

@interface CSSwitchActionSubjectParams : NSObject <CSRequestParamsProtocol>

@property (nonatomic, strong, readonly) CSActionSubject *subject;

- (instancetype)initWithActionSubject:(CSActionSubject *)subject;

@end

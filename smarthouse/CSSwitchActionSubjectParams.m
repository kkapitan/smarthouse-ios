//
//  CSSwitchActionSubjectParams.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 24.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSSwitchActionSubjectParams.h"

@implementation CSSwitchActionSubjectParams

- (instancetype)initWithActionSubject:(CSActionSubject *)subject {
    self = [super init];
    if (self) {
        _subject = subject;
    }
    return self;
}

- (NSDictionary *)params {
    return nil;
}

@end

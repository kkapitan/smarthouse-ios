//
//  CSDeleteActionParams.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 22.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSDeleteActionParams.h"

@implementation CSDeleteActionParams

- (instancetype)initWithAction:(CSAction *)action {
    self = [super init];
    if (self) {
        _action = action;
    }
    return self;
}

- (NSDictionary *)params {
    return nil;
}

@end

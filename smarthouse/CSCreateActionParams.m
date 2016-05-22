//
//  CSCreateActionParams.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 22.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSCreateActionParams.h"

@implementation CSCreateActionParams

- (instancetype)initWithAction:(CSUploadAction *)action {
    self = [super init];
    if (self) {
        _action = action;
    }
    return self;
}

- (NSDictionary *)params {
    return [MTLJSONAdapter JSONDictionaryFromModel:_action error:nil];
}

@end

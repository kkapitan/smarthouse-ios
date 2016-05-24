//
//  CSActionSubjectResponseSerializer.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 24.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSActionSubjectResponseSerializer.h"

@implementation CSActionSubjectResponseSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing  _Nullable *)error {
    NSDictionary *json = [super responseObjectForResponse:response data:data error:error];
    
    NSError *parseError;
    CSActionSubject *action = [MTLJSONAdapter modelOfClass:CSActionSubject.class fromJSONDictionary:json[@"action_subject"] error:&parseError];
    
    NSMutableDictionary *results = [NSMutableDictionary new];
    
    if (json != nil) {
        [results setObject:json forKey:@"payload"];
    }
    
    if (action != nil) {
        [results setObject:action forKey:@"action_subject"];
    }
    
    return [results copy];
}

@end

//
//  CSActionSubjectsResponseSerializer.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 22.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSActionSubjectsResponseSerializer.h"

@implementation CSActionSubjectsResponseSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing  _Nullable *)error {
    NSDictionary *json = [super responseObjectForResponse:response data:data error:error];
    
    NSError *parseError;
    NSArray <CSActionSubject *> *subjects = [MTLJSONAdapter modelsOfClass:CSActionSubject.class fromJSONArray:json[@"action_subjects"] error:&parseError];
    
    NSMutableDictionary *results = [NSMutableDictionary new];
    
    if (json != nil) {
        [results setObject:json forKey:@"payload"];
    }
    
    if (subjects != nil) {
        [results setObject:subjects forKey:@"subjects"];
    }
    
    return [results copy];
}

@end

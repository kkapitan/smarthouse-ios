//
//  CSActionResponseSerializer.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 22.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSActionResponseSerializer.h"

@implementation CSActionResponseSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing  _Nullable *)error {
    NSDictionary *json = [super responseObjectForResponse:response data:data error:error];
    
    NSError *parseError;
    CSAction *action = [MTLJSONAdapter modelOfClass:CSAction.class fromJSONDictionary:json[@"action"] error:&parseError];
    
    NSMutableDictionary *results = [NSMutableDictionary new];
    
    if (json != nil) {
        [results setObject:json forKey:@"payload"];
    }
    
    if (action != nil) {
        [results setObject:action forKey:@"action"];
    }
    
    return [results copy];
}

@end

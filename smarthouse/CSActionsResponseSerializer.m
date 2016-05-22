//
//  CSActionsResponseSerializer.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 22.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSActionsResponseSerializer.h"

@implementation CSActionsResponseSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing  _Nullable *)error {
    NSDictionary *json = [super responseObjectForResponse:response data:data error:error];
    
    NSError *parseError;
    NSArray <CSAction *> *actions = [MTLJSONAdapter modelsOfClass:CSAction.class fromJSONArray:json[@"actions"] error:&parseError];
    
    NSMutableDictionary *results = [NSMutableDictionary new];
    
    if (json != nil) {
        [results setObject:json forKey:@"payload"];
    }
    
    if (actions != nil) {
        [results setObject:actions forKey:@"actions"];
    }
    
    return [results copy];
}

@end

//
//  CSUserResponseSerializer.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 22.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSUserResponseSerializer.h"

@implementation CSUserResponseSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing  _Nullable *)error {
    NSDictionary *json = [super responseObjectForResponse:response data:data error:error];
    
    NSError *parseError;
    CSUser *user = [MTLJSONAdapter modelOfClass:CSUser.class fromJSONDictionary:json[@"user"] error:&parseError];
    
    NSMutableDictionary *results = [NSMutableDictionary new];
    
    if (json != nil) {
        [results setObject:json forKey:@"payload"];
    }
    
    if (user != nil) {
        [results setObject:user forKey:@"user"];
    }
    
    return [results copy];
}

@end

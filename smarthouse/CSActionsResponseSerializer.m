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
    
    NSMutableArray *actionsByActionType = [NSMutableArray new];
    NSMutableArray *actionTypes = [NSMutableArray new];
    
    for (NSDictionary *sectionJSON in json[@"sections"]) {
        NSArray <CSAction *> *actions = [MTLJSONAdapter modelsOfClass:CSAction.class fromJSONArray:sectionJSON[@"actions"] error:&parseError];
        
        CSActionType *actionType = [MTLJSONAdapter modelOfClass:CSActionType.class fromJSONDictionary:sectionJSON[@"action_type"] error:&parseError];
        
        if (actions != nil) {
            [actionsByActionType addObject:actions];
        }
        
        if (actionTypes != nil) {
            [actionTypes addObject:actionType];
        }
    }

    NSMutableDictionary *results = [NSMutableDictionary new];
    
    if (json != nil) {
        [results setObject:json forKey:@"payload"];
    }
    
    [results setObject:actionsByActionType forKey:@"actions"];
    [results setObject:actionTypes forKey:@"action_types"];
    
    return [results copy];
}

@end

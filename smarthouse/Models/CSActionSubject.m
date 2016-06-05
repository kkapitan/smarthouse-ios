//
//  CSActionSubject.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSActionSubject.h"

//Environment
#import "CSEnvironment.h"

@implementation CSActionSubject

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"uid" : @"id",
             @"name" : @"name",
             @"imageURL" : @"image_url"
            };
}

+ (NSValueTransformer *)imageURLJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^NSURL*(NSString *value, BOOL *success, NSError *__autoreleasing *error) {
        NSURL *apiURL = [[CSEnvironment sharedConfiguration] apiBaseURL];
        apiURL = [apiURL URLByDeletingLastPathComponent];
        
        NSURL *imageURL = [NSURL URLWithString:value];
        return [apiURL URLByAppendingPathComponent:[imageURL relativePath]];
    }];
}


@end

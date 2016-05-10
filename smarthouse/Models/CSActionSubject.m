//
//  CSActionSubject.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSActionSubject.h"

@implementation CSActionSubject

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"name" : @"name",
             @"image" : @"image_name",
             @"configuration" : @"configuration"
            };
}

+ (NSValueTransformer *)configurationJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[CSActionSubjectConfiguration class]];
}

+ (NSValueTransformer *)imageJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^UIImage*(NSString *imageName, BOOL *success, NSError *__autoreleasing *error) {
        return [UIImage imageNamed:imageName];
    }];
}


@end

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
             @"uid" : @"id",
             @"name" : @"name",
             @"imageURL" : @"image_url"
            };
}

+ (NSValueTransformer *)imageURLJSONTransformer {
    return [MTLValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}


@end

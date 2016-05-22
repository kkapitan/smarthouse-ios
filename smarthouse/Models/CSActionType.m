//
//  CSActionType.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 22.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSActionType.h"

@implementation CSActionType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"uid":@"id",
             @"name":@"name"
            };
}

@end

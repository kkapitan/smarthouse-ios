//
//  CSUser.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 22.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSUser.h"

@implementation CSUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"uid":@"id",
             @"authToken":@"auth_token",
             @"email":@"email"
            };
}

@end

//
//  CSBeacon.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 05.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSBeacon.h"

@implementation CSBeacon

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"uid":@"id",
             @"name":@"name",
             @"major":@"major"
             };
}

- (NSString *)itemTitle {
    return self.name;
}

@end

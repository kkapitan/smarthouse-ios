//
//  CSSwitchActionTrigger.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 01.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSSwitchActionTrigger.h"

@implementation CSSwitchActionTrigger

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"uid" : @"id",
             @"triggerType" : @"type"
             };
}

@end

//
//  CSAction.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSAction.h"

@implementation CSAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"uid":@"id",
             @"subject":@"action_subject",
             @"actionType":@"action_type",
             @"trigger":@"trigger"
            };
}

+ (NSValueTransformer *)subjectURLJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:CSActionSubject.class];
}

+ (NSValueTransformer *)actionTypeURLJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:CSActionType.class];
}

+ (NSValueTransformer *)triggerURLJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:CSActionTrigger.class];
}


@end

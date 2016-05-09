//
//  CSBootstrap.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSBootstrap.h"

@interface CSBootstrap ()

@end

@implementation CSBootstrap

+ (instancetype)sharedInstance {
    static CSBootstrap *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSDictionary *json = [self jsonDictionaryFromFile:@"bootstrap"];
        
        instance = [[CSBootstrap alloc] initWithJSONDictionary:json];
    });
    
    return instance;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)json {
    self = [super init];
    if (self) {
        _actions = @[];
        
        _subjects = [MTLJSONAdapter modelsOfClass:CSActionSubject.class fromJSONArray:json[@"action_subjects"] error:nil];
        
        [self initTriggerTypes];
    }
    
    return self;
}

- (void)addAction:(CSAction *)action {
    _actions = [_actions arrayByAddingObject:action];
}

#pragma mark -
#pragma mark - Private

+ (NSDictionary *)jsonDictionaryFromFile:(NSString *)fileName {
    NSString *jsonFilePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:jsonFilePath];
    
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

- (void)initTriggerTypes {
    _triggerTypes = @[];
    for (NSUInteger type = CSActionTriggerTypeSwitch; type <= CSActionTriggerTypeBeacon; type++ ) {
        _triggerTypes = [_triggerTypes arrayByAddingObject:[[CSActionTriggerTypeModel alloc] initWithActionTriggerType:type]];
    }
}

@end

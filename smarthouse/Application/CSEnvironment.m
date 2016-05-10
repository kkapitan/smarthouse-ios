//
//  CSEnvironment.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSEnvironment.h"

@interface CSEnvironment ()
@property (nonatomic, copy) NSString *configuration;
@property (nonatomic, strong) NSDictionary *variables;
@end

@implementation CSEnvironment

#pragma mark -
#pragma mark - Initialization

+ (CSEnvironment *)sharedConfiguration {
    static CSEnvironment *_sharedConfiguration = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedConfiguration = [[self alloc] init];
    });
    
    return _sharedConfiguration;
}

- (instancetype)initWithConfiguration:(NSString *)configuration {
    self = [super init];
    if (self) {
        // save configuration
        self.configuration = configuration;
        
        // load configurations
        NSString *path = [self.bundle pathForResource:@"Configuration" ofType:@"plist"];
        NSDictionary *configurations = [NSDictionary dictionaryWithContentsOfFile:path];
        
        
        // get enviroments
        NSMutableDictionary *defaultEnvironment = [configurations[@"Default"] mutableCopy];
        NSDictionary *currentEnvironment = configurations[self.configuration];
        
        // merge values
        if (currentEnvironment) {
            [defaultEnvironment addEntriesFromDictionary:currentEnvironment];
        }
        
        // save result
        self.variables = [defaultEnvironment copy];
    }
    
    return self;
}

- (instancetype)init {
    // fetch current configuration
    NSString *configuration = [[self.bundle infoDictionary] objectForKey:@"Configuration"];
    
    //
    return [self initWithConfiguration:configuration];
}

#pragma mark -
#pragma mark - Public methods

- (NSURL *)apiBaseURL {
    NSString *URLString = self.variables[kCSEnvironmentApiBaseURLKey];
    return [NSURL URLWithString:URLString];
}

- (id)variableForKey:(NSString *)key {
    return self.variables[key];
}

#pragma mark -
#pragma mark Private

- (NSBundle *)bundle {
    return [NSBundle mainBundle];
}


@end

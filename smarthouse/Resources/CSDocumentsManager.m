//
//  CSDocumentsManager.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 04.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSDocumentsManager.h"

@implementation CSDocumentsManager

- (instancetype)initWithStorageName:(NSString *)name {
    self = [super init];
    if (self) {
        _storageName = name;
    }
    return self;
}

- (void)write:(NSData *)data {
    [data writeToFile:[self storePath] atomically:YES];
}

- (NSData *)read {
    return [NSData dataWithContentsOfFile:[self storePath]];
}

#pragma mark -
#pragma mark - Private

- (NSString *)storePath {
    return [[self.class documentsPaths] stringByAppendingPathComponent:[self storageName]];
}

+ (NSString *)documentsPaths {
    static NSString *path = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        path = [paths objectAtIndex:0];
    });
    
    return path;
}


@end

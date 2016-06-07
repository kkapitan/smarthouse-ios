//
//  NSIndexSet+Array.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 07.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "NSIndexSet+Array.h"

@implementation NSIndexSet (Array)

- (NSArray *)arrayFromIndexes {
    NSMutableArray *selectedItemsArray = [NSMutableArray array];
    
    [self enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
        [selectedItemsArray addObject:[NSNumber numberWithUnsignedInteger:idx]];
    }];
    
    return [selectedItemsArray copy];
}

@end

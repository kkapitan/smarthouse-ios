//
//  CSDateFormatter.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 01.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSDateFormatter.h"

@implementation CSDateFormatter

+ (instancetype)hourMinuteDateFormatter {
    static CSDateFormatter *formatter = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [CSDateFormatter new];
        [formatter setDateFormat:@"hh:mm a"];
    });
    return formatter;
}


@end

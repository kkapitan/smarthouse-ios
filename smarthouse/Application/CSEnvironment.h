//
//  CSEnvironment.h
//  GameStore
//
//  Created by Krzysztof Kapitan on 08.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSConstants.h"

@interface CSEnvironment : NSObject

+ (CSEnvironment *)sharedConfiguration;

// return service URL
- (NSURL *)apiBaseURL;

// return variable by key
- (id)variableForKey:(NSString *)key;

@end

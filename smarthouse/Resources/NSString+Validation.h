//
//  NSString+Validation.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 23.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validation)

- (BOOL)isValidPassword:(NSError **)error;
- (BOOL)isValidEmail:(NSError **)error;

@end

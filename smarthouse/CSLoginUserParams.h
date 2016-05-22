//
//  CSLoginUserParams.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 22.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Protocol
#import "CSRequestParamsProtocol.h"

@interface CSLoginUserParams : NSObject <CSRequestParamsProtocol>

@property (nonatomic, strong, readonly) NSString *email;
@property (nonatomic, strong, readonly) NSString *password;

- (instancetype)initWithEmail:(NSString *)email password:(NSString *)password;

@end

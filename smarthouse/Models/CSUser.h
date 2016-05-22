//
//  CSUser.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 22.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface CSUser : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign, readonly) NSInteger uid;

@property (nonatomic, strong, readonly) NSString *email;
@property (nonatomic, strong, readonly) NSString *authToken;

@end

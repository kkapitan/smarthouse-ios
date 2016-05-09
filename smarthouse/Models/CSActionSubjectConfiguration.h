//
//  CSActionSubjectConfiguration.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface CSActionSubjectConfiguration : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign, readonly) NSInteger pin;

@end

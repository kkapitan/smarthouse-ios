//
//  CSActionSubject.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Mantle/Mantle.h>

//Model
#import "CSActionSubjectConfiguration.h"

@interface CSActionSubject : MTLModel <MTLJSONSerializing>

@property (nonatomic, readonly, strong) NSString *name;
@property (nonatomic, readonly, strong) UIImage *image;

@property (nonatomic, readonly, strong) CSActionSubjectConfiguration *configuration;

@end

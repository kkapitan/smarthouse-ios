//
//  CSTurnApplianceRequestParams.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 09.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Protocol
#import "CSRequestParamsProtocol.h"

//Model
#import "CSAction.h"

@interface CSTurnApplianceRequestParams : NSObject <CSRequestParamsProtocol>

@property (nonatomic, assign, readonly) NSInteger pin;
@property (nonatomic, assign, readonly) CSActionState state;

- (instancetype)initWithAction:(CSAction *)action;

@end

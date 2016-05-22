//
//  CSDeleteActionParams.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 22.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Protocol
#import "CSRequestParamsProtocol.h"

//Model
#import "CSAction.h"

@interface CSDeleteActionParams : NSObject <CSRequestParamsProtocol>

@property (nonatomic, strong, readonly) CSAction *action;

- (instancetype)initWithAction:(CSAction *)action;

@end

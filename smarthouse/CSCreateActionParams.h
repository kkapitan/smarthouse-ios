//
//  CSCreateActionParams.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 22.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Protocol
#import "CSRequestParamsProtocol.h"

//Action
#import "CSUploadAction.h"

@interface CSCreateActionParams : NSObject <CSRequestParamsProtocol>

@property (nonatomic, strong, readonly) CSUploadAction *action;

- (instancetype)initWithAction:(CSUploadAction *)action;

@end

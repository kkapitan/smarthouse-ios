//
//  CSTimerTriggerBuilderPageDelegate.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 02.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//Model
#import "CSActionTrigger.h"


typedef void(^CSTimerTriggerBuilderCompletion)(BOOL success, CSActionTrigger *trigger, UIAlertController *alert);

@protocol CSTimerTriggerBuilderPageProtocol <NSObject>

- (void)buildTriggerWithCompletion:(CSTimerTriggerBuilderCompletion)completion;

@end

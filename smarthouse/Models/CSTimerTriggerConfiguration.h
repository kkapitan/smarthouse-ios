//
//  CSTimerTriggerConfiguration.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 01.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSTimerTriggerConfiguration : NSObject

@property (nonatomic, strong) NSDate *dayHour;

@property (nonatomic, strong) NSDate *startHour;
@property (nonatomic, strong) NSDate *finishHour;

@property (nonatomic, strong) NSIndexSet *weekdays;

@property (nonatomic, assign) NSUInteger weeks;
@property (nonatomic, assign) NSUInteger hours;
@property (nonatomic, assign) NSUInteger minutes;

@end

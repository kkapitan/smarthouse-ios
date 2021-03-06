//
//  CSWireFrame.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 24.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSWireFrame.h"

@implementation CSWireFrame

static NSString *const CSLoginViewControllerStoryboardID = @"CSLoginViewController";
static NSString *const CSSmartHouseTableViewControllerStoryboardID = @"CSSmartHouseTableViewController";

static NSString *const CSTimerTriggerWeeklyViewControllerStoryboardID = @"CSTimerTriggerWeeklyViewController";
static NSString *const CSTimerTriggerDailyViewControllerStoryboardID = @"CSTimerTriggerDailyViewController";

- (CSLoginViewController *)loginViewController {
    return [[self mainStoryboard] instantiateViewControllerWithIdentifier:CSLoginViewControllerStoryboardID];
}

- (CSSmartHouseTableViewController *)smartHouseViewController {
    return [[self mainStoryboard] instantiateViewControllerWithIdentifier:CSSmartHouseTableViewControllerStoryboardID];
}

- (CSTimerTriggerDailyViewController *)timerTriggerDailyViewController {
    return [[self mainStoryboard] instantiateViewControllerWithIdentifier:CSTimerTriggerDailyViewControllerStoryboardID];
}

- (CSTimerTriggerWeeklyViewController *)timerTriggerWeeklyViewController {
    return [[self mainStoryboard] instantiateViewControllerWithIdentifier:CSTimerTriggerWeeklyViewControllerStoryboardID];
}

#pragma mark -
#pragma mark - Private

- (UIStoryboard *)mainStoryboard {
    return [UIStoryboard storyboardWithName:@"Main" bundle:nil];
}

@end

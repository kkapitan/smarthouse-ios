//
//  CSTimerTriggerPageManager.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 31.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSTimerTriggerPageManager : NSObject 

- (instancetype)initWithPageController:(UIPageViewController *)controller;

- (void)setViewControllerWithIndex:(NSUInteger)index animated:(BOOL)animated;

@end

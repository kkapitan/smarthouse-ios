//
//  CSTimerTriggerPageManager.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 31.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSTimerTriggerPageManager.h"

//Wireframe
#import "CSWireFrame.h"

@interface CSTimerTriggerPageManager ()

@property (nonatomic, strong) UIPageViewController *pageController;

@property (nonatomic, strong) NSArray <UIViewController<CSTimerTriggerBuilderPageProtocol> *> *controllers;
@property (nonatomic, assign) NSUInteger controllerIndex;

@end

@implementation CSTimerTriggerPageManager

- (instancetype)initWithPageController:(UIPageViewController *)controller {
    self = [super init];
    if (self) {
        _pageController = controller;
        
        [self setupControllers];
    }
    return self;
}

#pragma mark - 
#pragma mark - Public

- (void)setViewControllerWithIndex:(NSUInteger)index animated:(BOOL)animated {
    _controllerIndex = index;
    
    UIPageViewControllerNavigationDirection direction = index > _controllerIndex ? UIPageViewControllerNavigationDirectionForward : UIPageViewControllerNavigationDirectionReverse;
    
    UIViewController *viewController = _controllers[(NSUInteger)index];
    [self.pageController setViewControllers:@[viewController] direction:direction animated:animated completion:nil];
}

- (UIViewController<CSTimerTriggerBuilderPageProtocol> *)currentPage {
    return _controllers[(NSUInteger)_controllerIndex];
}

#pragma mark -
#pragma mark - Private

- (void)setupControllers {
    CSTimerTriggerDailyViewController *dailyController = [[CSWireFrame new] timerTriggerDailyViewController];
    
    CSTimerTriggerWeeklyViewController *weeklyController = [[CSWireFrame new] timerTriggerWeeklyViewController];
    
    _controllers = @[dailyController, weeklyController];
    [self setViewControllerWithIndex:0 animated:YES];
}

@end

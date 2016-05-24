//
//  CSSplashViewController.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 24.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSSplashViewController.h"

//Account
#import "CSAccount.h"

//Wireframe
#import "CSWireFrame.h"

@interface CSSplashViewController ()

@end

@implementation CSSplashViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self setupRootController];
}

- (void)setupRootController {
    UIViewController *rootViewController;
    
    if ([[CSAccount account] isLoggedIn]) {
        CSSmartHouseTableViewController *smartHouseViewController = [[CSWireFrame new] smartHouseViewController];
        rootViewController = [[UINavigationController alloc] initWithRootViewController:smartHouseViewController];
    } else {
        rootViewController = [[CSWireFrame new] loginViewController];
    }
    
    [[[UIApplication sharedApplication] keyWindow] setRootViewController:rootViewController];
}

@end

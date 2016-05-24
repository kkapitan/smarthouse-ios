//
//  CSWireFrame.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 24.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CSLoginViewController.h"
#import "CSSmartHouseTableViewController.h"

@interface CSWireFrame : NSObject

- (CSLoginViewController *)loginViewController;

- (CSSmartHouseTableViewController *)smartHouseViewController;

@end

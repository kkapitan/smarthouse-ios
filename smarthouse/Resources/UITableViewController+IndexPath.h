//
//  UITableViewController+IndexPath.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 10.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewController (IndexPath)

- (NSIndexPath *)indexPathForEvent:(UIEvent *)event;

@end

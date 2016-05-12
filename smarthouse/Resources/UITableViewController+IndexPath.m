//
//  UITableViewController+IndexPath.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 10.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "UITableViewController+IndexPath.h"

@implementation UITableViewController (IndexPath)

- (NSIndexPath *)indexPathForEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchPoint = [touch locationInView:self.tableView];
    
    return [self.tableView indexPathForRowAtPoint:touchPoint];
}

@end

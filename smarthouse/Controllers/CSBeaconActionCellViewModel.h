//
//  CSBeaconActionCellViewModel.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Model
#import "CSAction.h"

@interface CSBeaconActionCellViewModel : NSObject

@property (nonatomic, strong, readonly) NSString *subjectName;
@property (nonatomic, strong, readonly) UIImage *subjectImage;

@property (nonatomic, strong, readonly) NSString *beaconInfoString;

- (instancetype)initWithAction:(CSAction *)action;

@end

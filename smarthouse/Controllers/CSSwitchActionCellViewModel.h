//
//  CSSwitchActionCellViewModel.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//Model
#import "CSAction.h"

@interface CSSwitchActionCellViewModel : NSObject

@property (nonatomic, strong, readonly) NSString *subjectName;
@property (nonatomic, strong, readonly) NSURL *subjectImageURL;

@property (nonatomic, assign, readonly) BOOL isSwitched;

- (instancetype)initWithAction:(CSAction *)action;

@end
